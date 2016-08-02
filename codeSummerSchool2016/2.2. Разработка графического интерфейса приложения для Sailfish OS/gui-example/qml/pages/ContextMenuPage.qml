import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    SilicaListView {
        anchors.fill: parent
        delegate: ListItem {
            menu: ContextMenu {
                MenuItem {
                    text: qsTr("Toggle bold font")
                    onClicked: label.font.bold = !label.font.bold
                }
            }

            Label {
                id: label

                text: qsTr("Item %1").arg(model.index + 1)
                anchors.centerIn: parent
            }
        }
        model: 10
    }
}
