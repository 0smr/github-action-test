import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 640;
    height: 480;
    visible: true;
    title: qsTr("looper");

    Rectangle {
        id: looperKing;

        property real _x: window.width  * 0.5 - width;
        property real _y: window.height * 0.5 - height;
        property real _hue: 0;
        x: _x;
        y: _y;
        width: 100;height: 100;
        color: Qt.hsla(_hue,0.5,0.5,1);
        radius: 10;

        transform: Rotation {
            id: transformer;
            origin.x: 95;origin.y: 95;
            angle: 0;
        }
    }

    ParallelAnimation {
        id: anim

        property real duration: 1000;

        running: true;
        loops: Animation.Infinite;

        NumberAnimation {
            target: transformer;
            property: 'angle';
            duration: anim.duration;
            from: 0;to: 90;
            easing.type: Easing.InQuart;
        }
        NumberAnimation {
            target: looperKing;
            property: 'x';
            duration: anim.duration;
            from: looperKing._x; to: looperKing.x - 90;
            easing.type: Easing.InQuart;
        }
    }
    NumberAnimation {
        target: looperKing;
        property: "_hue";
        duration: anim.duration * 5;
        from:0;  to:1;
    }
}
