import QtQuick
import Quickshell
import Quickshell.Services.Mpris

PanelWindow {
    id: root
    anchors { top: true; right: true }
    margins { top: 0; right: 330 }   // ajusta para ubicarlo a la izquierda del volumen
    implicitWidth: 260
    implicitHeight: 30
    exclusiveZone: 0
    color: "transparent"

    property real speed: 30          // píxeles por segundo (más bajo = más lento)

    property var player: {
        const list = Mpris.players.values
        for (const p of list) if (p.isPlaying) return p
        return list.length > 0 ? list[0] : null
    }
    property string label: player ? ("♪ " + player.trackArtist + " - " + player.trackTitle + "     ●     ") : ""

    Text {
        id: measure
        visible: false
        text: root.label
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 14
    }

    Item {
        anchors.fill: parent
        clip: true

        Row {
            id: strip
            height: parent.height
            Repeater {
                model: measure.width > 0 ? Math.ceil(root.width / measure.width) + 2 : 0
                Text {
                    text: root.label
                    color: "white"
                    font: measure.font
                    height: strip.height
                    verticalAlignment: Text.AlignVCenter
                }
            }

            NumberAnimation on x {
                from: 0
                to: -measure.width
                duration: Math.max(1, measure.width / root.speed * 1000)
                loops: Animation.Infinite
                easing.type: Easing.Linear
                running: root.player !== null && root.player.isPlaying
            }
        }
    }
}
