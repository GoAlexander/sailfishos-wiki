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
TARGET = 06-positioning-api

CONFIG += sailfishapp

SOURCES += src/06-positioning-api.cpp

nmeafiles.files = nmeafiles/*
nmeafiles.path = /usr/share/$${TARGET}/nmeafiles
INSTALLS += nmeafiles

OTHER_FILES += qml/06-positioning-api.qml \
    qml/cover/CoverPage.qml \
    rpm/06-positioning-api.changes.in \
    rpm/06-positioning-api.spec \
    rpm/06-positioning-api.yaml \
    translations/*.ts \
    06-positioning-api.desktop \
    nmeafiles/*.log \

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/06-positioning-api-de.ts

DISTFILES += \
    qml/pages/PositionViewPage.qml \
    qml/pages/MapPage.qml

