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
import QtQuick.Layouts 1.0
import QtSensors 5.0
import "../components"

Page {
    id: page
    allowedOrientations: Orientation.Portrait

    PageHeader {
        id: header
        title: qsTr("Показания") + " x: " + rotationSensor.reading.x + ";y: " + rotationSensor.reading.y +
               ";z: " + rotationSensor.reading.z
    }

    GridLayout {
        id: rectangles
        anchors {
            left: parent.left
            right: parent.right
            top: header.bottom
            bottom: debug.top
            margins: Theme.horizontalPageMargin
        }

        columns: 3
        SensorVisualizer {
            enabled: rotationSensor.reading.x > 10
        }
        SensorVisualizer {
            enabled: rotationSensor.reading.x > 10
        }
        SensorVisualizer {
            enabled: rotationSensor.reading.x > 10
        }
        SensorVisualizer {
            enabled: -10 < rotationSensor.reading.x && rotationSensor.reading.x < 10
        }
        SensorVisualizer {
            enabled: -10 < rotationSensor.reading.x && rotationSensor.reading.x < 10
        }
        SensorVisualizer {
            enabled: -10 < rotationSensor.reading.x && rotationSensor.reading.x < 10
        }
        SensorVisualizer {
            enabled: rotationSensor.reading.x < -10
        }
        SensorVisualizer {
            enabled: rotationSensor.reading.x < -10
        }
        SensorVisualizer {
            enabled: rotationSensor.reading.x < -10
        }
    }
    Label {
        id: debug
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    RotationSensor {
        id: rotationSensor
        active: true
    }
}


