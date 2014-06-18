import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtMultimedia 5.0
import "../images"

Item {
    id: menuInicial
    Rectangle {
        anchors.fill: parent

        SoundEffect {
            id: buttonClick
            source: "../images/sounds/ButtonSelect1.wav"
            //source: "resources/sounds/ButtonSelect2.wav"
        }

        Image {
            id: bg_menu
            anchors.fill: parent
            source: "../images/BackgroundTelaInicial.jpg"
        }

        Image {
            id: titulo
            height: parent.height/2
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            source:"../images/LogoTelaInicial.png"
            Layout.alignment: (Qt.AlignHCenter | Qt.AlignVCenter)
            //anchors.horizontalCenter: parent.horizontalCenter
            //y: parent.height/2 - parent.height/10
            /*Rectangle {
                anchors.fill: parent
                color: "black"
            }*/
        }

        Item {
            id: opcoes
            height: parent.height/2
            width: parent.width
            anchors.bottom: parent.bottom

            Image {
                id: estudar
                width: parent.width/3
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: "../images/StudyButton.png"
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        estudar.source = "../images/StudyButtonClicked.png"
                        buttonClick.play()
                    }
                    onReleased: {
                        menuInicial.visible = false
                        estudar.source = "../images/StudyButton.png"
                    }
                }
            }

            Image {
                id: jogar
                source: "../images/PlayButton.png"
                width: parent.width/3
                anchors.verticalCenter: parent.verticalCenter
                x: parent.width/3
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        jogar.source = "../images/PlayButtonClicked.png"
                        buttonClick.play()
                    }
                    onReleased: {
                        //Logic.start()
                        menuInicial.visible = false
                        jogar.source = "../images/PlayButton.png"
                    }
                }
            }

            Image {
                id: sair
                source: "../images/QuitButton.png"
                width: parent.width/3
                anchors.verticalCenter: parent.verticalCenter
                x: 2*parent.width/3
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        sair.source = "../images/QuitButtonClicked.png"
                        buttonClick.play()
                    }
                    onReleased: {
                        sair.source = "../images/QuitButton.png"
                        Qt.quit();
                    }
                }
            }

        }
    }
}
