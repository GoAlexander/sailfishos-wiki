import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    SilicaListView {
        header: PageHeader { title: qsTr("List Page") }
        anchors.fill: parent
        delegate: ListItem {
            Label {
                text: qsTr("Item %1").arg(model.index + 1)
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.horizontalPageMargin
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
            }
        }
        model: 100

        VerticalScrollDecorator { }
    }
}
