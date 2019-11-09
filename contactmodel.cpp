#include "contactmodel.h"

#include <QDebug>

ContactModel::ContactModel(QObject *parent)
{
    Q_UNUSED(parent)
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
    mContacts.insert(index, item);
    mBackup.insert(index, item);
    endInsertRows();
}

void ContactModel::append(int id, const QString &avatar, const QString &nickname, const QString &lastMsg, const QString &datetime)
{
    insert(mContacts.count(), id, avatar, nickname, lastMsg, datetime);
}

void ContactModel::filter(const QString &nickname)
{
    beginResetModel();
    mContacts.clear();
    foreach (Contact item, mBackup) {
        if(item.nickname.indexOf(nickname) >= 0){
            mContacts.append(item);
        }
    }
    endResetModel();
}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
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
