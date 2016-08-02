#include "recorder.h"

Recorder::Recorder(QObject *parent) : QObject(parent) {
    _recording = false;
    _settings.setCodec("audio/PCM");
    _settings.setQuality(QMultimedia::NormalQuality);
    _audioRecorder = new QAudioRecorder(this);
    _audioRecorder->setEncodingSettings(_settings);
    _audioRecorder->setContainerFormat("wav");
}

Recorder::~Recorder() {
    delete _audioRecorder;
}

void Recorder::startRecord() {
    _recording = true;
    _audioRecorder->record();
}

void Recorder::stopRecord() {
    _recording = false;
    _audioRecorder->stop();
}

QUrl Recorder::getActualLocation() {
    return _audioRecorder->actualLocation();
}
