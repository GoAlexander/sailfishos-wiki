#ifndef YANDEXSPEECHKITHELPER_H
#define YANDEXSPEECHKITHELPER_H

#include <QByteArray>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QList>
#include <QNetworkAccessManager>
#include <QNetworkInterface>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QObject>
#include <QObjectList>
#include <QPair>
#include <QRegularExpression>
#include <QSettings>
#include <QStandardPaths>
#include <QString>
#include <QUrl>
#include <QUrlQuery>
#include <QVariant>
#include <QXmlStreamReader>

#include "searchresultobject.h"

#include <QDebug>

class YandexSpeechKitHelper : public QObject
{
    Q_OBJECT

public:
    explicit YandexSpeechKitHelper(QObject *parent = 0);

    void setNetworkAccessManager(QNetworkAccessManager *mng);

    Q_INVOKABLE void getSearchPage(QString query);
    Q_INVOKABLE void recognizeQuery(QString path_to_file);
    Q_INVOKABLE void getHints(QString text);

public slots:
    void requestFinished(QNetworkReply *reply);

signals:
    void gotAudio(QString answer);
    void gotResponce(QString query);
    void gotSearchPage(QVariant results);
    void hintsReceived(QVariantList data);

private:
    QString _buildUniqID();
    void _parseResponce(QXmlStreamReader *element);
    void _parseWebPage(QXmlStreamReader *element);

    QNetworkReply *_reply;
    QNetworkAccessManager *_manager;
    QUrl _urlRedirectTo;
    QList<QObject*> _searchResults;
};

#endif // YANDEXSPEECHKITHELPER_H
