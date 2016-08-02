#include "yandexspeechkithelper.h"

YandexSpeechKitHelper::YandexSpeechKitHelper(QObject *parent) : QObject(parent) {}

void YandexSpeechKitHelper::setNetworkAccessManager(QNetworkAccessManager *mng) {
    _manager = mng;
    connect(_manager, SIGNAL(finished(QNetworkReply*)), this, SLOT(requestFinished(QNetworkReply*)));
}

void YandexSpeechKitHelper::getSearchPage(QString query) {
    // Поисковый запрос
}

void YandexSpeechKitHelper::recognizeQuery(QString path_to_file) {
    // Запрос на распознавание речи
}

void YandexSpeechKitHelper::getHints(QString text) {
    // Запрос на поисковые подсказки
}

void YandexSpeechKitHelper::_parseResponce(QXmlStreamReader *element) {
    double idealConfidence = 0;
    QString idealQuery;
    while (!element->atEnd()) {
        element->readNext();
        // Выделение результата распознавания
    }
    if (element->hasError()) qDebug() << element->errorString();
    emit gotResponce(idealQuery);
}

void YandexSpeechKitHelper::_parseWebPage(QXmlStreamReader *element) {
    _searchResults.clear();
    bool answerFlag = false;
    bool searchResultFlag = false;
    QString answer = "";
    QString searchUrl = "";
    while (!element->atEnd()) {
        element->readNext();
        if (element->tokenType() == QXmlStreamReader::StartElement) {
            // Выделение требуемых блоков
        } else if (element->tokenType() == QXmlStreamReader::Characters) {
            if (answerFlag) {
                // Выделение ответа на запрос
            } else if (searchResultFlag) {
                // Выделение текста ссылки
            }
        }
    }
    if (element->hasError()) qDebug() << element->errorString();

    emit gotSearchPage(QVariant::fromValue(_searchResults));
    if (!answer.isEmpty()) emit gotAudio(answer);
}

void YandexSpeechKitHelper::requestFinished(QNetworkReply *reply) {
    QUrl url = reply->attribute(QNetworkRequest::RedirectionTargetAttribute).toUrl();
    if (url.isEmpty()) {
        QString data = reply->readAll();
        if (data.startsWith("<?xml")) {
            data = data.replace("<?xml version=\"1.0\" encoding=\"utf-8\"?>", "");
            _parseResponce(new QXmlStreamReader(data));
        } else if (data.startsWith("suggest.apply(")) {
            // Обработка подсказок
        } else {
            data = data.mid(data.indexOf("<body"));
            data = data.replace("</html>", "");
            data = data.replace(QRegularExpression("<form.*?</form>"), "");
            data = data.replace(QRegularExpression("<script.*?</script>"), "");
            data = data.replace(QRegularExpression("<img.*?>"), "");
            data = data.replace(QRegularExpression("<b.*?>"), "");
            data = data.replace(QRegularExpression("</b>"), "");
            data = data.replace("<wbr>", "");
            data = data.replace("<br>", "");
            data = data.replace("<hr>", "");
            data = data.replace("&raquo;", "");
            data = data.replace("&middot;", "");
            data = data.replace("&nbsp;", " ");
            _parseWebPage(new QXmlStreamReader(data));
        }
    } else {
        QNetworkRequest request(url);
        request.setHeader(QNetworkRequest::UserAgentHeader,
                          "Mozilla/5.0 (Android; Mobile; rv:40.0) Gecko/40.0 Firefox/40.0");
        _manager->get(request);
    }
    reply->deleteLater();
}

QString YandexSpeechKitHelper::_buildUniqID() {
    const QString possibleChars("0123456789abcdef");
    const int length = 32;
    QString randomString;
    for (int i = 0; i < length; ++i) {
        int index = qrand() % possibleChars.length();
        QChar nextChar = possibleChars.at(index);
        randomString.append(nextChar);
    }
    return randomString;
}

