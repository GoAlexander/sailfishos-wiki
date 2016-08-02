#include "audiorecorder.h"


#include <QUrl>
#include <QDebug>


AudioRecorder::AudioRecorder(QObject *parent) : QAudioRecorder(parent) {
    QAudioEncoderSettings audioSettings;
    audioSettings.setCodec("audio/PCM");
    audioSettings.setQuality(QMultimedia::HighQuality);
    this->setEncodingSettings(audioSettings);
    this->setContainerFormat("wav");
}
