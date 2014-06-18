import QtQuick 2.1
import QtMultimedia 5.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1
import "../images"
import "mylogic.js" as Logic



Item {
    id: quarto
    visible: true
    focus: true

    property var previousNumber1;
    property var previousNumber2;
    property var result;
    property var number1;
    property var number2;
    property var wrong1;
    property var wrong2;
    property var wrong3;
    property var positionResult;
    property var positionWrong1;
    property var positionWrong2;
    property var positionWrong3;
    property var tries;
    property var nextActivity ;
    property var actualActivity ;
    property var folder ;

    Resultado {
        id: popupResultado
        width: parent.width/2
        height: parent.height/2
        anchors.centerIn: parent
        visible: false
        z:100
    }


    Rectangle {
        id: telaLetras
        width: parent.width
        height: parent.height

        property int letraSelecionada: 0
        property int letrasVistas: 0

        Image {
            id: backgroundJogo
            fillMode: Image.PreserveAspectCrop
            anchors.fill: parent

        }

        /*Rectangle {
            id: supE
            anchors.left: parent.left
            anchors.top: parent.top
            height: parent.height/2
            width: parent.width/2
            color: "transparent"

            Image{
                id:p1
                fillMode: Image.PreserveAspectFit
                anchors.fill:parent
                anchors.rightMargin: 200
                anchors.bottomMargin: 30


            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    supE.color = "pink"
                }
                onReleased: {
                    supE.color = "black"
                }

            }
        }

        Rectangle {
            id: supD
            anchors.right: parent.right
            anchors.top: parent.top
            height: parent.height/2
            width: parent.width/2
            color: "transparent"
            Image{
                id:p2
                fillMode: Image.PreserveAspectFit
                anchors.fill:parent
                anchors.leftMargin: 200
                anchors.bottomMargin: 30
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    supD.color = "pink"
                }
                onReleased: {
                    supD.color = "black"
                }

            }
        }

        Rectangle {
            id: infE
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            height: parent.height/2
            width: parent.width/2
              color: "transparent"
            Image{
                id:p3
                fillMode: Image.PreserveAspectFit
                anchors.fill:parent
                anchors.rightMargin: 200
                anchors.topMargin: 30
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    infE.color = "pink"
                }
                onReleased: {
                    infE.color = "black"
                }

            }
        }

        Rectangle {
            id: infD
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: parent.height/2
            width: parent.width/2
              color: "transparent"
            Image{
                id:p4
                fillMode: Image.PreserveAspectFit
                anchors.fill:parent
                anchors.leftMargin: 200
                anchors.topMargin: 30
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    infD.color = "pink"
                }
                onReleased: {
                    infD.color = "black"
                }

            }
        }

        */

        Component {
            id: highlightBar
            Rectangle {
                height: telaLetras.height/2
                width: telaLetras.width/2
                color: "transparent"
                border.color: "blue"
                border.width: 20
                opacity: 0.6
            }
        }

        GridView {
            id: gridView
            anchors.fill: parent
            cellHeight: telaLetras.height/2
            cellWidth: telaLetras.width/2
            model: imageModel

            highlight: highlightBar
            //highlightFollowsCurrentItem: true
            currentIndex: 0
            delegate: Item {
                property int number: value
                height: gridView.cellHeight
                width: gridView.cellWidth

                Rectangle {
                    anchors.fill: parent
                    color: rect_color
                    opacity: 0.3
                }

                Image{
                    source: image_source
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    anchors.topMargin: topMargin
                    anchors.leftMargin: leftMargin
                    anchors.bottomMargin:  bottomMargin
                    anchors.rightMargin:  rightMargin


                }
            }

            Timer {
                id: timer
                interval: 1000; running: true; repeat: true
                onTriggered: {
                    gridView.currentIndex = Logic.next();
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(gridView.currentItem.number === n1.number + n2.number) {
                        print("HURRAY!");
                        toNextActivity();
                    }
                    else {
                        imageModel.get(gridView.currentIndex).rect_color = "red"
                    }
                }
            }
        }

        Rectangle {

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            height: parent.height/2
            width: parent.width*0.4
            color: "transparent"
            Image{
                id: personagem
                fillMode: Image.PreserveAspectFit
                anchors.fill:parent
                anchors.centerIn: parent
                source: "../images/personagem.png"
            }
        }

        Rectangle {
            id: desafio
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: 0
            height: parent.height*0.4
            width: parent.width*0.4
            gradient: Gradient {
                     GradientStop { position: 0.0; color: "white" }
                     GradientStop { position: 1.0; color: "#d7d7d7" }
                 }
            radius: 500
            border.color: "#b7b7b7"
            border.width: 1
            Item {
                anchors.fill: parent
                anchors.margins: 10

                Rectangle {

                    anchors.left: parent.left
                    height: parent.height
                    width: parent.width*0.35
                     color: "transparent"
                    Image{
                        fillMode: Image.PreserveAspectFit
                        id: n1
                        property int number: 0
                        anchors.fill:parent
                     }

                }
                Rectangle {
                     anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.35
                    height: parent.height
                    width: parent.width*0.1
                    color: "transparent"
                    Text {
                        id: mais
                        anchors.centerIn: parent
                        text: "+"
                        font.bold: true
                        font.pointSize: 50*(window.width/Screen.desktopAvailableWidth)
                    }
                }
                Rectangle {
                     anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.45
                    height: parent.height
                    width: parent.width*0.35
                     color: "transparent"
                    Image{
                        anchors.fill:parent
                        fillMode: Image.PreserveAspectFit
                        id: n2
                        property int number: 0
                     }
                }
                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: (parent.width*0.8)
                    height: parent.height
                    width: parent.width*0.1
                    color: "transparent"
                    Text {
                        id: igual
                        anchors.centerIn: parent
                        text: "="
                        font.bold: true
                        font.pointSize: 50*(window.width/Screen.desktopAvailableWidth)
                    }
                }

                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: (parent.width*0.9)
                    height: parent.height
                    width: parent.width*0.1
                    color: "transparent"
                    Text {
                        id: interrogacao
                        anchors.centerIn: parent
                        text: "?"
                        font.bold: true
                        font.pointSize: 50*(window.width/Screen.desktopAvailableWidth)
                    }
                }
            }

        }
    }


    function init(){
        previousNumber1=0;
        previousNumber2=0;
        result=0;
        number1=0;
        number2=0;
        wrong1=0;
        wrong2=0;
        wrong3=0;
        positionResult=0;
        positionWrong1=0;
        positionWrong2=0;
        positionWrong3=0;
        tries=0;
        actualActivity=0;
        nextActivity=0;
        folder="../images/Atividades/"+1+"/";
        sortChallenge(folder)
        sortPosition(folder)
        backgroundJogo.source= folder+ "background.jpg"

    }

    function sortChallenge(folder){
        do{
           number1 = random(9);
           result = random(9);
           number2= result-number1;
        } while ((number2<=0) | (number1===number2) | (number1===previousNumber1) | (number2===previousNumber2))

       do{
            wrong1 = random(9);
            wrong2 = random(9);
            wrong3 = random(9);
        }while ((wrong1===wrong2) | (wrong1===wrong3) | (wrong3===wrong2) | (wrong1===result) | (wrong2===result) | (wrong3===result))

        previousNumber1=number1;
        previousNumber2=number2;

       console.log(number1)
       console.log(number2)

        n1.source=folder+number1+".png"
        n1.number = number1
        n2.source=folder+number2+".png"
        n2.number = number2

    }

    function sortPosition(folder){
        do{
            positionResult=random(4);
            positionWrong1=random(4);
            positionWrong2=random(4);
            positionWrong3=random(4);
         }while ((positionResult===positionWrong1) | (positionResult===positionWrong3) | (positionResult===positionWrong2) | (positionWrong1===positionWrong2) |(positionWrong1===positionWrong3) | (positionWrong3===positionWrong2))



        imageModel.set(positionResult-1,{ "image_source":folder+result+".png", "value":result, "rect_color":"transparent"})
        imageModel.set(positionWrong1-1,{ "image_source":folder+wrong1+".png", "value":wrong1, "rect_color":"transparent"})
        imageModel.set(positionWrong2-1,{ "image_source":folder+wrong2+".png", "value":wrong2, "rect_color":"transparent"})
        imageModel.set(positionWrong3-1,{ "image_source":folder+wrong3+".png", "value":wrong3, "rect_color":"transparent"})



    }

    function random(numPossibilidades){
        var aleat = Math.random() * numPossibilidades;
        aleat = Math.floor(aleat);
        return aleat+1;
    }


    function calcFeedback(){

    }

    function toNextActivity(){
       nextActivity = actualActivity++;
       folder="../images/Atividades/"+1+"/"
       sortChallenge(folder)
       sortPosition(folder)
       gridView.currentIndex = 0
       Logic.restart()
       timer.restart()
       backgroundJogo.source= folder+ "background.jpg"
        popupResultado.visible = true
    }



}
