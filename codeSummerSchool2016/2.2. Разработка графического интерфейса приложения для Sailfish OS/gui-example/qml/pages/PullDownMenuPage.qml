import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    SilicaListView {
        header: PageHeader { title: qsTr("Pull Down Menu Page") }
        anchors.fill: parent

        PullDownMenu {
//            backgroundColor: "green"
//            highlightColor: backgroundColor
//            quickSelect: true

            MenuItem {
                text: "Option"
                onClicked: console.log(qsTr("Option clicked"))
            }
            MenuLabel { text: qsTr("Informational label") }
        }
    }
}
