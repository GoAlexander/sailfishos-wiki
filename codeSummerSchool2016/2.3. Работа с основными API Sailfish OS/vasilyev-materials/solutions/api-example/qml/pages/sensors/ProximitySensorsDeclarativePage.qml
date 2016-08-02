import QtQuick 2.2
import Sailfish.Silica 1.0
// .pro: QT += sensors
// .yaml: Requires: - qt5-qtdeclarative-import-sensors
import QtSensors 5.2
import "../.."

Page {
    ProximitySensor { id: proximitySensor }
    Column {
        PageHeader { title: qsTr("Declarative Proximity Sensors") }
        Label {
            text: qsTr("Proximity sensor is busy")
            visible: proximitySensor.busy
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            Button {
                text: proximitySensor.active ? qsTr("Stop proximity sensor") : qsTr("Start proximity sensor")
                anchors.horizontalCenter: parent.horizontalCenter
                preferredWidth: Theme.buttonWidthLarge
                onClicked: proximitySensor.active ? proximitySensor.stop() : proximitySensor.start()
            }
            IconTextSwitch {
                text: qsTr("Near")
                anchors.horizontalCenter: parent.horizontalCenter
                enabled: proximitySensor.active
                checked: proximitySensor.reading ? proximitySensor.reading.near : false
                automaticCheck: false
            }

            visible: !proximitySensor.busy
            width: parent.width
            spacing: Theme.paddingLarge
        }
        IRProximitySensor { id: irProximitySensor }
        Label {
            text: qsTr("IR proximity sensor is busy")
            visible: irProximitySensor.busy
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            Button {
                text: irProximitySensor.active ? qsTr("Stop IR proximity sensor") : qsTr("Start IR proximity sensor")
                anchors.horizontalCenter: parent.horizontalCenter
                preferredWidth: Theme.buttonWidthLarge
                onClicked: irProximitySensor.active ? irProximitySensor.stop() : irProximitySensor.start()
            }
            ReadingValue {
                label: qsTr("Reflectance")
                width: parent.width
                source: irProximitySensor
                value: "reflectance"
            }

            visible: !irProximitySensor.busy
            width: parent.width
            spacing: Theme.paddingLarge
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
