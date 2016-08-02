import QtQuick 2.2
import Sailfish.Silica 1.0
// .pro: QT += multimedia
// .yaml: Requires: - qt5-qtmultimedia
import QtMultimedia 5.0

Page {
    MediaPlayer {
        id: player
        source: "/home/nemo/Videos/Default/Sailfish_OS_2.0.mp4"
    }
    VideoOutput {
        id: videoOutput
        source: player
        anchors.fill: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (player.playbackState == MediaPlayer.PlayingState)
                player.pause();
            else
                player.play();
        }
        onDoubleClicked: player.stop()
    }
}
