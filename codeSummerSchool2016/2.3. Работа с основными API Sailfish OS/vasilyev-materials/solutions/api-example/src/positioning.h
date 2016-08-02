#ifndef POSITIONING_H
#define POSITIONING_H

#include <QObject>
#include <QReadWriteLock>
// .pro: QT += positioning
// .yaml: Requires: - qt5-qtpositioning
#include <QGeoPositionInfo>
#include <QGeoPositionInfoSource>

class Positioning : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool available READ available CONSTANT)
    Q_PROPERTY(bool active READ active NOTIFY isWorkingChanged)
    Q_PROPERTY(qreal altitude READ altitude NOTIFY geoInfoChanged)
    Q_PROPERTY(qreal latitude READ latitude NOTIFY geoInfoChanged)
    Q_PROPERTY(qreal longitude READ longitude NOTIFY geoInfoChanged)

public:
    explicit Positioning(QObject *parent = 0);
    bool available() const;
    bool active() const;
    qreal altitude() const;
    qreal latitude() const;
    qreal longitude() const;

public slots:
    void start();
    void stop();

signals:
    void isWorkingChanged();
    void geoInfoChanged();

private:
    mutable QReadWriteLock t_readWriteLock;
    QGeoPositionInfoSource *t_geoInfoSource;
    QGeoPositionInfo t_geoInfo;
    bool t_active;

private slots:
    void t_updateGeoInfo(const QGeoPositionInfo &geoInfo);
};

#endif // POSITIONING_H
