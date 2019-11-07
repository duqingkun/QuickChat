#include "contactmodel.h"

ContactModel::ContactModel(QObject *parent)
{
    Q_UNUSED(parent);
    mRoleNames[IdRole] = "id";
    mRoleNames[AvatarRole] = "avatar";
    mRoleNames[NicknameRole] = "nickname";
    mRoleNames[LastMessageRole] = "lastMsg";
    mRoleNames[DatetimeRole] = "datetime";
}

void ContactModel::insert(int index, int id, const QString &avatar, const QString &nickname, const QString &lastMsg, const QString &datetime)
{
    if(index < 0 || index > mContacts.count()){
        return;
    }
    beginInsertRows(QModelIndex(), index, index);
    Contact item;
    item.userId = id;
    item.avatar = avatar;
    item.nickname = nickname;
    item.lastMessage = lastMsg;
    item.datetime = datetime;
    mContacts.insert(0, item);
    endInsertRows();
}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return mContacts.count();
}

QVariant ContactModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if(row < 0 || row >= mContacts.count()){
        return QVariant();
    }
    Contact contact = mContacts.at(row);
    switch (role) {
    case IdRole: return contact.userId;
    case AvatarRole: return contact.avatar;
    case NicknameRole: return contact.nickname;
    case LastMessageRole: return contact.lastMessage;
    case DatetimeRole: return contact.datetime;
    }

    return QVariant();
}

QHash<int, QByteArray> ContactModel::roleNames() const
{
    return mRoleNames;
}