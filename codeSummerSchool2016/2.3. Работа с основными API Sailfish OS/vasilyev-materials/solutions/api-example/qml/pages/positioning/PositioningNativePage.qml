import QtQuick 2.2
import Sailfish.Silica 1.0
import ru.omprussia.example.api 1.0
import "../.."

Page {
    Positioning { id: positioning }
    Column {
        PageHeader { title: qsTr("Native Positioning") }
        Label {
            text: qsTr("Positioning isn't available")
            visible: !positioning.available
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            Button {
                text: positioning.active ? qsTr("Stop positioning") : qsTr("Start positioning")
                anchors.horizontalCenter: parent.horizontalCenter
                preferredWidth: Theme.buttonWidthLarge
                onClicked: positioning.active ? positioning.stop() : positioning.start()
            }
            ReadingValue {
                label: qsTr("Latitude")
                width: parent.width
                source: positioning
                text: isNaN(positioning.latitude) ? " " : positioning.latitude
            }
            ReadingValue {
                label: qsTr("Longitude")
                width: parent.width
                source: positioning
                text: isNaN(positioning.longitude) ? " " : positioning.longitude
            }
            ReadingValue {
                label: qsTr("Altitude")
                width: parent.width
                source: positioning
                text: isNaN(positioning.altitude) ? " " : positioning.altitude
            }

            visible: positioning.available
            width: parent.width
            spacing: Theme.paddingLarge
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
