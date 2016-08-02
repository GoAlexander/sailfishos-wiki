import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    SilicaGridView {
        header: PageHeader { title: qsTr("Grid Page") }
        anchors.fill: parent
        cellWidth: width / 4
        cellHeight: cellWidth
        delegate: Label {
            width: GridView.view.cellWidth
            height: GridView.view.cellHeight
            text: (model.index + 1)
            color: Theme.highlightColor
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        model: 100

        VerticalScrollDecorator { }

//        flow: GridView.TopToBottom
//        HorizontalScrollDecorator { }
    }
}
