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
TARGET = gui-example

CONFIG += sailfishapp

SOURCES += src/gui-example.cpp

OTHER_FILES += qml/gui-example.qml \
    rpm/gui-example.changes.in \
    rpm/gui-example.spec \
    rpm/gui-example.yaml \
    translations/*.ts \
    gui-example.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/gui-example-ru.ts

DISTFILES += \
    qml/pages/FlickablePage.qml \
    qml/pages/GridPage.qml \
    qml/pages/ListPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/StackPage.qml \
    qml/pages/PullDownMenuPage.qml \
    qml/pages/PushUpMenuPage.qml \
    qml/pages/SlideshowPage.qml \
    qml/pages/ContextMenuPage.qml \
    qml/pages/NotificationPage.qml \
    qml/pages/DialogPage.qml \
    qml/pages/WebViewPage.qml \
    qml/dialogs/HeaderInputDialog.qml \
    qml/pages/TextInputPage.qml \
    qml/cover/CoverPage.qml

