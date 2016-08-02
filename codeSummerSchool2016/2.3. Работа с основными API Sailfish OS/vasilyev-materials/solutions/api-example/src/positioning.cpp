#include "positioning.h"


Positioning::Positioning(QObject *parent) : QObject(parent) {
    this->t_geoInfoSource = QGeoPositionInfoSource::createDefaultSource(this);
    if (this->t_geoInfoSource) {
        connect(this->t_geoInfoSource, &QGeoPositionInfoSource::positionUpdated,
                this, &Positioning::t_updateGeoInfo);
    }
    this->t_active = false;
}


bool Positioning::available() const {
    QReadLocker locker(&this->t_readWriteLock);
    return this->t_geoInfoSource != 0;
}


bool Positioning::active() const {
    QReadLocker locker(&this->t_readWriteLock);
    return this->t_active;
}


qreal Positioning::altitude() const {
    QReadLocker locker(&this->t_readWriteLock);
    return this->t_geoInfo.isValid() ? this->t_geoInfo.coordinate().altitude() : qQNaN();
}


qreal Positioning::latitude() const {
    QReadLocker locker(&this->t_readWriteLock);
    return this->t_geoInfo.isValid() ? this->t_geoInfo.coordinate().latitude() : qQNaN();
}


qreal Positioning::longitude() const {
    QReadLocker locker(&this->t_readWriteLock);
    return this->t_geoInfo.isValid() ? this->t_geoInfo.coordinate().longitude() : qQNaN();
}


void Positioning::start() {
    QWriteLocker locker(&this->t_readWriteLock);
    if (this->t_active) return;
    this->t_geoInfoSource->startUpdates();
    this->t_active = true;
    locker.unlock();
    this->isWorkingChanged();
}


void Positioning::stop() {
    QWriteLocker locker(&this->t_readWriteLock);
    if (!this->t_active) return;
    this->t_geoInfoSource->stopUpdates();
    this->t_active = false;
    locker.unlock();
    this->isWorkingChanged();
}


void Positioning::t_updateGeoInfo(const QGeoPositionInfo &geoInfo) {
    QWriteLocker locker(&this->t_readWriteLock);
    this->t_geoInfo = geoInfo;
    locker.unlock();
    this->geoInfoChanged();
}
