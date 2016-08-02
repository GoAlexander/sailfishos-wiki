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
import Sailfish.Silica 1.0


Page {
    id: page

    SilicaFlickable {
        anchors {
            fill: parent
            margins: Theme.horizontalPageMargin
        }
        contentHeight: column.height
        Column {
            id: column
            anchors {
                left: parent.left
                right: parent.right
            }
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Разбор API")
            }
            Button {
                width: parent.width
                text: qsTr("Positioning API")
                onClicked: pageStack.push(Qt.resolvedUrl("PositioningApiPage.qml"))
            }
            Button {
                width: parent.width
                text: qsTr("Map API")
                onClicked: pageStack.push(Qt.resolvedUrl("MapApiPage.qml"))
            }
            Button {
                width: parent.width
                text: qsTr("List sensors")
                onClicked: pageStack.push(Qt.resolvedUrl("SensorsListingPage.qml"))
            }
            Button {
                width: parent.width
                text: qsTr("Accelerometer API")
                onClicked: pageStack.push(Qt.resolvedUrl("AccelerometerApiPage.qml"))
            }
            Button {
                width: parent.width
                text: qsTr("Rotation Sensor API")
                onClicked: pageStack.push(Qt.resolvedUrl("RotationSensorApiPage.qml"))
            }
            Button {
                width: parent.width
                text: qsTr("Camera API")
                onClicked: pageStack.push(Qt.resolvedUrl("CameraApiPage.qml"))
            }
            Button {
                width: parent.width
                text: qsTr("SoundEffect API")
                onClicked: pageStack.push(Qt.resolvedUrl("SoundEffectApiPage.qml"))
            }
            Button {
                width: parent.width
                text: qsTr("Audio API")
                onClicked: pageStack.push(Qt.resolvedUrl("AudioApiPage.qml"))
            }
            Button {
                width: parent.width
                text: qsTr("CustomComponent")
                onClicked: pageStack.push(Qt.resolvedUrl("CustomComponentApi.qml"))
            }
        }
    }
}


