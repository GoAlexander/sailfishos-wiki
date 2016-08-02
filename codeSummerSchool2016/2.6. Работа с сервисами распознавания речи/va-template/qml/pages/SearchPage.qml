/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import QtMultimedia 5.0
import Sailfish.Silica 1.0

import "../views"


Page {
    id: page

    Audio { id: audio }

    BusyIndicator {
        id: indicator
        size: BusyIndicatorSize.Large
        anchors.centerIn: parent
        running: false
    }

    SearchBox {
        id: searchBox
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: Theme.paddingLarge
        anchors.rightMargin: Theme.paddingLarge

        onRecordStarted: indicator.running = true
        onSearchStarted: {
            listView.headerItem.text = ""
            indicator.running = true
        }
    }

    SilicaListView {
        id: listView
        anchors.top: searchBox.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.topMargin: Theme.paddingMedium
        anchors.bottomMargin: Theme.paddingMedium
        clip: true

        header: TextArea {
            id: answerField
            width: parent.width
            enabled: false
            color: Theme.secondaryColor
            wrapMode: TextEdit.WordWrap
            visible: text.length > 0
            labelVisible: false
        }

        delegate: BackgroundItem {
            id: listItem
            width: parent.width
            height: Theme.itemSizeMedium

            Column {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: Theme.paddingLarge
                anchors.rightMargin: Theme.paddingLarge
                spacing: Theme.paddingSmall

                Label {
                    width: parent.width
                    color: listItem.highlighted ? Theme.highlightColor : Theme.primaryColor
                    font.pixelSize: Theme.fontSizeMedium
                    truncationMode: TruncationMode.Fade
                    text: model.modelData.title
                }

                Label {
                    width: parent.width
                    color: listItem.highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                    font.pixelSize: Theme.fontSizeSmall
                    truncationMode: TruncationMode.Fade
                    text: decodeURI(model.modelData.url)
                }
            }

            onClicked: Qt.openUrlExternally(decodeURI(model.modelData.url))
        }

        VerticalScrollDecorator {}
    }

    Connections {
        target: yandexSpeechKitHelper
        onGotAudio: {
            listView.headerItem.text = answer
            listView.scrollToTop()
            // Запрос аудиофайла с озвучкой ответа
        }
        onGotSearchPage: {
            indicator.running = false
            listView.model = results
        }
        onGotResponce: {
            yandexSpeechKitHelper.getSearchPage(query)
            searchBox.searchQueryField.text = query
        }
    }
}
