# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = device-api-starting-point

CONFIG += sailfishapp

SOURCES += src/device-api-starting-point.cpp

OTHER_FILES += qml/device-api-starting-point.qml \
    qml/cover/CoverPage.qml \
    rpm/device-api-starting-point.changes.in \
    rpm/device-api-starting-point.spec \
    rpm/device-api-starting-point.yaml \
    translations/*.ts \
    device-api-starting-point.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/device-api-starting-point-de.ts

DISTFILES += \
    qml/pages/StartPage.qml \
    qml/pages/PositioningApiPage.qml \
    qml/pages/MapApiPage.qml \
    qml/pages/SensorsListingPage.qml \
    qml/pages/AccelerometerApiPage.qml \
    qml/components/SensorVisualizer.qml \
    qml/pages/RotationSensorApiPage.qml \
    qml/pages/CameraApiPage.qml \
    qml/pages/SoundEffectApiPage.qml \
    qml/pages/AudioApiPage.qml \
    qml/pages/CustomComponentApi.qml

