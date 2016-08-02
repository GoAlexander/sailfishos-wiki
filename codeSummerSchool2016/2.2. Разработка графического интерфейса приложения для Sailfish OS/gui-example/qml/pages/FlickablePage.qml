import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: applicationWindow.height * 1.5

        Column {
            id: column

            width: applicationWindow.width

            PageHeader { title: qsTr("Flickable Page") }
        }
        VerticalScrollDecorator { }
    }
}
