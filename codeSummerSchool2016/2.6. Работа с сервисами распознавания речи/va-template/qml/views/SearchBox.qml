import QtQuick 2.0
import Sailfish.Silica 1.0

Column {
    id: root

    property alias searchQueryField: searchQuery
    property alias searchQueryButton: searchButton

    signal recordStarted()
    signal searchStarted()

    Row {
        id: controls
        width: parent.width
        spacing: Theme.paddingMedium

        TextField {
            id: searchQuery
            width: parent.width - parent.spacing - searchButton.width
            placeholderText: qsTr("Search query")
            label: qsTr("Search query")

            onTextChanged: if (focus) yandexSpeechKitHelper.getHints(text)

            EnterKey.enabled: text.length > 0
            EnterKey.iconSource: "image://theme/icon-m-enter-accept"
            EnterKey.onClicked: {
                focus = false
                yandexSpeechKitHelper.getSearchPage(text)
                searchStarted()
            }
        }

        IconButton {
            id: searchButton

            property bool isRecording: false

            width: Theme.iconSizeLarge
            height: Theme.iconSizeLarge
            icon.source: isRecording || searchQuery.focus ? "image://theme/icon-m-search" :
                                                            "image://theme/icon-m-mic"

            onClicked: {
                if (searchQuery.focus) {
                    yandexSpeechKitHelper.getSearchPage(searchQuery.text)
                    searchStarted()
                } else if (isRecording) {
                    isRecording = false
                    recorder.stopRecord()
                    yandexSpeechKitHelper.recognizeQuery(recorder.getActualLocation())
                    searchStarted()
                } else {
                    isRecording = true
                    recorder.startRecord()
                    recordStarted()
                }
            }
        }
    }

    SilicaListView {
        id: hints
        width: parent.width
        height: contentHeight

        model: ListModel {}

        delegate: BackgroundItem {
            id: listItem
            width: parent.width
            height: Theme.itemSizeExtraSmall

            Label {
                id: hintLabel
                anchors.fill: parent
                anchors.leftMargin: Theme.paddingLarge
                anchors.rightMargin: Theme.paddingLarge
                font.pixelSize: Theme.fontSizeSmall
                color: listItem.highlighted ? Theme.highlightColor : Theme.primaryColor
                verticalAlignment: Text.AlignVCenter
                truncationMode: TruncationMode.Fade
                text: hint
            }

            onClicked: {
                searchQueryField.focus = false
                searchQueryField.text = hintLabel.text
                yandexSpeechKitHelper.getSearchPage(hintLabel.text)
                searchStarted()
            }
        }
    }

    Connections {
        target: yandexSpeechKitHelper
        onHintsReceived: {
            // Отображение поисковых подсказок
        }
        onGotSearchPage: hints.model.clear()
    }
}
