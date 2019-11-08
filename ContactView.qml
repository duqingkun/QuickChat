import QtQuick 2.0
import QuickChat.model 1.0

Item{
    id:root

    Rectangle{
        anchors.fill: parent
        color: "#f1f1f1"

        Search{
            id: search
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 60
            color: "#efefef"
            onFilter: {
                view.model.filter(text)
            }
        }

        ListView{
            id: view
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: search.bottom
            anchors.bottom: parent.bottom
            model: ContactModel{}
            delegate: ContactDelegate{}
            clip: true

            Component.onCompleted: {
                view.currentIndex = -1
            }
        }
    }

    function append(id, avatar, nickname, lastMsg, datetime){
        view.model.append(id, avatar, nickname, lastMsg, datetime)
    }
}
