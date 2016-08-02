import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.fill: parent

        PageHeader { title: qsTr("Text Input Page")}
        TextField {
            placeholderText: qsTr("Fill the field")
            label: qsTr("Text Field")
            width: parent.width
            EnterKey.enabled: text.length > 0
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            EnterKey.onClicked: textArea.focus = true
//            validator: DoubleValidator {
//                bottom: -1
//                top: 10
//                decimals: 2
//            }
//            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }
        TextArea {
            id: textArea

            placeholderText: qsTr("Fill the area")
            label: qsTr("Text area")
            width: parent.width
        }
    }
}
