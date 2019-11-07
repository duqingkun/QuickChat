#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "contactmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qRegisterMetaType<Contact>("Contact");
    qmlRegisterType<ContactModel>("QuickChat.model", 1, 0, "ContactModel");
    QQmlApplicationEngine engine;
    //engine.rootContext()->setContextProperty("contactModel", new ContactModel());
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
