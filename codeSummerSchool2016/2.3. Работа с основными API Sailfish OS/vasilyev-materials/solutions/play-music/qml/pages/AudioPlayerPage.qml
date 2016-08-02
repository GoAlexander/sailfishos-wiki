/*
  Copyright (C) 2016 Andrey Vasilyev
  Contact: Andrey Vasilyev <andrey.vasilyev@fruct.org>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

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
import Sailfish.Silica 1.0
import QtMultimedia 5.0

Page {
    id: page
    Audio {
        id: audioPlayer
        source: "/usr/share/08-playing-music/samples/Pokemon_Blue_Version_Conundrum_OC_ReMix.mp3"
    }
    Column {
        anchors.centerIn: parent
        spacing: Theme.paddingMedium
        Label {
            width: page.width - Theme.horizontalPageMargin * 2
            wrapMode: Wrap
            text: "Название " + audioPlayer.metaData.title
        }

        Label {
            text: "Права " + audioPlayer.metaData.copyright
        }

        Button {
            text: "Нажми для воспроизведения"
            enabled: audioPlayer.playbackState != Audio.PlayingState
            onClicked: audioPlayer.play()
        }
    }
}
