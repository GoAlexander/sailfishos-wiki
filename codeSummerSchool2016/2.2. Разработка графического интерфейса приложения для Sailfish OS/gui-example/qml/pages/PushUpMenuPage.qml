import Sailfish.Silica 1.0

Page {
    SilicaListView {
        header: PageHeader { title: qsTr("Push Up Menu Page") }
        anchors.fill: parent

        PushUpMenu {
            backgroundColor: "red"
            highlightColor: backgroundColor
            quickSelect: true

            MenuItem {
                text: "Option"
                onClicked: console.log(qsTr("Option clicked"))
            }
            MenuLabel { text: qsTr("Informational label") }
        }
    }
}
