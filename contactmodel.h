#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QAbstractListModel>

typedef struct _Contact
{
    int userId;     //用户ID
    QString avatar; //头像
    QString nickname; //昵称
    QString lastMessage;    //最后一条消息
    QString datetime;       //日期
}Contact;

Q_DECLARE_METATYPE(Contact)


class ContactModel : public QAbstractListModel
{
    Q_OBJECT
    Q_ENUMS(RoleNames)
public:
    enum RoleNames{
        IdRole = Qt::UserRole,
        AvatarRole,
        NicknameRole,
        LastMessageRole,
        DatetimeRole,
    };

    explicit ContactModel(QObject *parent = nullptr);

public slots:
    void insert(int index, int id, const QString& avatar, const QString& nickname, const QString& lastMsg, const QString& datetime);

public:
    virtual int rowCount(const QModelIndex &parent) const;

    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

    //用于qml访问时使用
    virtual QHash<int,QByteArray> roleNames() const;

private:
    QList<Contact> mContacts;
    QHash<int, QByteArray> mRoleNames;
};

#endif // CONTACTMODEL_H
