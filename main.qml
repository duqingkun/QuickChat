import QtQuick 2.12
import QtQuick.Window 2.12
import QuickChat.model 1.0

Window {
    visible: true
    width: 340
    height: 480
    minimumWidth: 300
    title: qsTr("迅捷通")

    ContactView{
        id: view
        width: 260
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Component.onCompleted: {
        view.append(1, "avatar/wechat.png", "傻媳妇儿", "爱你哦", "18:18")
        view.append(2, "avatar/alipay.png", "傻媳妇呀", "你是不是傻，你是不是二，你是不是臭", "2019-11-07")
        view.append(3, "avatar/BOC.png", "中国银行", "你是不是傻，你是不是二，你是不是臭", "2019-11-07")
        view.append(4, "avatar/wechat.png", "傻子", "爱你哦", "18:18")
        view.append(5, "avatar/alipay.png", "媳妇儿儿", "你是不是傻，你是不是二，你是不是臭", "2019-11-07")
    }
}
