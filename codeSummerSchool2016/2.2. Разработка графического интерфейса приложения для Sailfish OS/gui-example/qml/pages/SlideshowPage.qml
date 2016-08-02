import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    SlideshowView {
        id: slideshowView
        anchors.centerIn: parent
        width: Math.min(parent.width, parent.height)
        height: width
        delegate: BackgroundItem {
            width: slideshowView.itemWidth
            height: slideshowView.itemHeight

            Label {
                text: qsTr("Item %1").arg(index + 1)
                anchors.centerIn: parent
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
            }
        }
        model: 5
    }
}
