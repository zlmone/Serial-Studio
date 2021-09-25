/*
 * Copyright (c) 2020-2021 Alex Spataru <https://github.com/alex-spataru>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

import "../Widgets" as Widgets

Item {
    id: root

    Rectangle {
        id: window
        radius: 5
        anchors.fill: parent

        gradient: Gradient {
            GradientStop {
                position: 0
                color: Cpp_ThemeManager.windowGradient1
            }

            GradientStop {
                position: 1
                color: Cpp_ThemeManager.windowGradient2
            }
        }

        RowLayout {
            spacing: app.spacing

            anchors {
                left: parent.left
                leftMargin: app.spacing
                verticalCenter: parent.verticalCenter
            }

            Image {
                width: sourceSize.width
                height: sourceSize.height
                sourceSize: Qt.size(24, 24)
                source: "qrc:/icons/arrow-right.svg"
                Layout.alignment: Qt.AlignVCenter

                ColorOverlay {
                    source: parent
                    anchors.fill: parent
                    color: palette.brightText
                }
            }

            Label {
                font.bold: true
                font.pixelSize: 16
                color: palette.brightText
                font.family: app.monoFont
                text: Cpp_UI_Dashboard.title
            }
        }

        Label {
            font.family: app.monoFont
            color: palette.brightText
            visible: !Cpp_CSV_Player.isOpen
            text: Cpp_IO_Manager.receivedDataLength //*! Optimize this function

            anchors {
                right: parent.right
                rightMargin: app.spacing
                verticalCenter: parent.verticalCenter
            }
        }
    }

    Widgets.Shadow {
        source: window
    }
}
