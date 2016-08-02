import QtQuick 2.2
import Sailfish.Silica 1.0
// .pro: QT += multimedia
// .yaml: Requires: - qt5-qtmultimedia
import QtMultimedia 5.0

Page {
    Audio {
        id: audio
        source: "/home/nemo/api-example.wav"
    }
    Column {
        PageHeader { title: qsTr("Declarative Audio") }
        Row {
            Button {
                text: {
                    switch (audio.playbackState) {
                    case Audio.StoppedState:
                        return qsTr("Play");
                    case Audio.PausedState:
                        return qsTr("Continue");
                    default:
                        return qsTr("Pause");
                    }
                }
                onClicked: {
                    switch (audio.playbackState) {
                    case Audio.StoppedState:
                    case Audio.PausedState:
                        return audio.play();
                    default:
                        return audio.pause();
                    }
                }
            }
            Button {
                text: qsTr("Stop")
                enabled: audio.playbackState !== Audio.StoppedState
                onClicked: audio.stop()
            }

            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingLarge
        }
        TextField {
            label: qsTr("Position (ms)")
            width: parent.width
            text: "%1 / %2".arg(audio.position).arg(audio.duration)
            readOnly: true
            color: Theme.highlightColor
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
