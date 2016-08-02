import QtQuick 2.2
import Sailfish.Silica 1.0
// .pro: QT += sensors
// .yaml: Requires: - qt5-qtdeclarative-import-sensors
import QtSensors 5.2
import "../.."

Page {
    AmbientLightSensor { id: ambientLightSensor }
    Column {
        PageHeader { title: qsTr("Declarative Light Sensors") }
        Label {
            text: qsTr("Ambient light sensor is busy")
            visible: ambientLightSensor.busy
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            Button {
                text: ambientLightSensor.active ? qsTr("Stop ambient light sensor") : qsTr("Start ambient light sensor")
                anchors.horizontalCenter: parent.horizontalCenter
                preferredWidth: Theme.buttonWidthLarge
                onClicked: ambientLightSensor.active ? ambientLightSensor.stop() : ambientLightSensor.start()
            }
            ReadingValue {
                label: qsTr("Light level")
                width: parent.width
                source: ambientLightSensor
                value: "lightLevel"
                text: {
                    if (!source.reading) return " ";
                    switch (source.reading[value]) {
                    case AmbientLightReading.Undefined: return qsTr("Undefined");
                    case AmbientLightReading.Dark:      return qsTr("Dark");
                    case AmbientLightReading.Twilight:  return qsTr("Twilight");
                    case AmbientLightReading.Light:     return qsTr("Light");
                    case AmbientLightReading.Bright:    return qsTr("Bright");
                    case AmbientLightReading.Sunny:     return qsTr("Sunny");
                    }
                }
            }

            visible: !ambientLightSensor.busy
            width: parent.width
            spacing: Theme.paddingLarge
        }
        LightSensor { id: lightSensor }
        Label {
            text: qsTr("Light sensor is busy")
            visible: lightSensor.busy
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            Button {
                text: lightSensor.active ? qsTr("Stop light sensor") : qsTr("Start light sensor")
                anchors.horizontalCenter: parent.horizontalCenter
                preferredWidth: Theme.buttonWidthLarge
                onClicked: lightSensor.active ? lightSensor.stop() : lightSensor.start()
            }
            ReadingValue {
                label: qsTr("Illuminance")
                width: parent.width
                source: lightSensor
                value: "illuminance"
            }

            visible: !lightSensor.busy
            width: parent.width
            spacing: Theme.paddingLarge
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
