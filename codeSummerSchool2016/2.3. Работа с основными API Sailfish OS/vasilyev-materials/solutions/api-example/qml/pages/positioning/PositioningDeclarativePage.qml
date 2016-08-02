import QtQuick 2.0
import Sailfish.Silica 1.0
// .pro: QT += positioning
// .yaml: Requires: - qt5-qtdeclarative-import-positioning
import QtPositioning 5.2
import "../.."

Page {
    PositionSource {
        id: positionSource
        updateInterval: 1000
    }
    Column {
        PageHeader { title: qsTr("Declarative Positioning") }
        Button {
            text: positionSource.active ? qsTr("Stop position source") : qsTr("Start position source")
            anchors.horizontalCenter: parent.horizontalCenter
            preferredWidth: Theme.buttonWidthLarge
            onClicked: positionSource.active ? positionSource.stop() : positionSource.start()
        }
        ReadingValue {
            label: qsTr("Latitude")
            width: parent.width
            source: positionSource
            text: source.position.coordinate ? source.position.coordinate.latitude : " "
        }
        ReadingValue {
            label: qsTr("Longitude")
            width: parent.width
            source: positionSource
            text: source.position.coordinate ? source.position.coordinate.longitude : " "
        }
        ReadingValue {
            label: qsTr("Altitude")
            width: parent.width
            source: positionSource
            text: source.position.coordinate ? source.position.coordinate.altitude : " "
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
