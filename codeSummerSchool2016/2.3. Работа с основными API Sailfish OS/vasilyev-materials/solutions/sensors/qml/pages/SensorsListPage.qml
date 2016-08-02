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

import QtQuick 2.2
import Sailfish.Silica 1.0
import QtSensors 5.0 as Sensors

Page {
    id: page

    PageHeader {
        id: header
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        title: qsTr("A list of available sensors")
    }

    SilicaListView {
        id: sensorsView
        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: Theme.horizontalPageMargin
        }
        model: sensorsList
        delegate: sensorView
        spacing: Theme.paddingMedium
    }

    ListModel {
        id: sensorsList

        Component.onCompleted: {
            var types = Sensors.QmlSensors.sensorTypes();
            for(var i = 0; i < types.length; i++) {
                append({ name: types[i]});
            }
        }
    }

    Component {
        id: sensorView
        Label {
            anchors {
                left: parent.left
                right: parent.right
            }
            text: model.name
            font.pixelSize: Theme.fontSizeLarge
        }
    }
}
