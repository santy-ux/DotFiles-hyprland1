import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 150
    color: "transparent"

    exclusionMode: ExclusionMode.Ignore

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

    mask: Region {
        item: root.showing ? flyout : null
    }

    // -------------------------
    // Estado
    // -------------------------

    property bool showing: false
    property real brightness: 0   // 0..1

    function change(step) {
        // step: "5%+" o "5%-"
        if (adjust.running)
            return
        adjust.command = [
            "sh", "-c",
            "brightnessctl --min-value=655 set " + step + " >/dev/null; brightnessctl -m"
        ]
        adjust.running = true
    }

    function showOsd() {
        showing = true
        hideTimer.restart()
    }

    Timer {
        id: hideTimer
        interval: 1200
        repeat: false
        onTriggered: root.showing = false
    }

    // Cambia el brillo y luego lee el valor resultante
    Process {
        id: adjust

        stdout: StdioCollector {
            onStreamFinished: {
                const parts = text.trim().split(",")
                if (parts.length >= 4) {
                    const pct = parseInt(parts[3])
                    if (!isNaN(pct))
                        root.brightness = pct / 100
                }
                root.showOsd()
            }
        }
    }

    // -------------------------
    // IPC:  qs ipc call brightness up | down
    // -------------------------

    IpcHandler {
        target: "brightness"

        function up(): void {
            root.change("5%+")
        }

        function down(): void {
            root.change("5%-")
        }
    }

    // -------------------------
    // OSD (mismo estilo que el volumen)
    // -------------------------

    Rectangle {
        id: flyout

        width: 320
        height: 28

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30

        radius: 36
        color: Theme.alpha(Theme.bg, 0.5)

        opacity: root.showing ? 1 : 0
        scale: root.showing ? 1 : 0.9

        Behavior on opacity {
            NumberAnimation { duration: 150 }
        }

        Behavior on scale {
            NumberAnimation {
                duration: 150
                easing.type: Easing.OutCubic
            }
        }

        Text {
            id: icon

            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter

            // nf-md-brightness_5 / 6 / 7
            text: {
                if (root.brightness < 0.33)
                    return "\uDB80\uDCDF"
                if (root.brightness < 0.66)
                    return "\uDB80\uDCE0"
                return "\uDB80\uDCE1"
            }

            font.family: "Symbols Nerd Font"
            font.pixelSize: 20
            color: Theme.text
        }

        Text {
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter

            text: Math.round(root.brightness * 100) + "%"

            font.pixelSize: 12
            font.bold: true
            color: Theme.text
        }

        Rectangle {
            anchors.left: icon.right
            anchors.leftMargin: 15

            anchors.right: parent.right
            anchors.rightMargin: 68

            anchors.verticalCenter: parent.verticalCenter

            height: 5
            radius: 4
            color: "#555555"

            Rectangle {
                width: parent.width * Math.min(root.brightness, 1)
                height: parent.height
                radius: 4
                color: Theme.text

                Behavior on width {
                    NumberAnimation { duration: 100 }
                }
            }
        }
    }
}
