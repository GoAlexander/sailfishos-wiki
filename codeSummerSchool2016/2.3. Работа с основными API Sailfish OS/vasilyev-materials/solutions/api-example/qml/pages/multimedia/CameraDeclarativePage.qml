import QtQuick 2.2
import Sailfish.Silica 1.0
// .pro: QT += multimedia
// .yaml: Requires: - qt5-qtmultimedia
import QtMultimedia 5.0

Page {
    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }
        flash.mode: Camera.FlashRedEyeReduction
        imageCapture.onImageCaptured: photoPreview.source = preview
    }
    VideoOutput {
        source: camera
        anchors.fill: parent
        focus : visible
    }
    MouseArea {
        anchors.fill: parent
        onClicked: camera.searchAndLock()
        onDoubleClicked: camera.imageCapture.captureToLocation("/home/nemo/api-example.jpg")
    }

    Image {
        id: photoPreview
    }
}
