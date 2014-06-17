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

    Rectangle {
        id: telaLetras
        width: parent.width
        height: parent.height

        property int letraSelecionada: 0
        property int letrasVistas: 0

        Image {
            id: backgroundQuarto
            anchors.fill: parent
            source: "../images/stock-photo-illustration-of-a-boy-sleeping-soundly-inside-his-room-133435442.jpg"
        }

        Rectangle {
            id: supE
            anchors.left: parent.left
            anchors.top: parent.top
            height: parent.height/2
            width: parent.width/2
            color: "black"

            Image{
                id:p1
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
            color: "red"
            Image{
                id:p2
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
            color: "blue"
            Image{
                id:p3
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
            color: "black"
            Image{
                id:p4
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

        Rectangle {
            id: desafio
            anchors.centerIn: parent
            height: parent.height/3
            width: parent.width/3
            color: "white"
            Item {
                anchors.fill: parent
                anchors.margins: 10

                Rectangle {

                    anchors.left: parent.left
                    height: parent.height
                    width: parent.width*0.4
                    color: "purple"
                    Image{
                        fillMode: Image.PreserveAspectFit
                        id: n1
                        anchors.fill:parent
                     }

                }
                Rectangle {
                    anchors.centerIn: parent
                    height: parent.height
                    width: parent.width*0.2
                    color: "transparent"
                    Text {
                        id: mais
                        anchors.centerIn: parent
                        text: "+"
                        font.bold: true
                        font.pointSize: 98*(window.width/Screen.desktopAvailableWidth)
                    }
                }
                Rectangle {
                    anchors.right: parent.right
                    height: parent.height
                    width: parent.width*0.4
                    Image{
                        anchors.fill:parent
                        fillMode: Image.PreserveAspectFit
                        id: n2
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

    }

    function sortChallenge(){
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

        n1.source="../images/Bola/"+number1+".png"
        n2.source="../images/Bola/"+number2+".png"

    }

    function sortPosition(){
        do{
            positionResult=random(4);
            positionWrong1=random(4);
            positionWrong2=random(4);
            positionWrong3=random(4);
         }while ((positionResult===positionWrong1) | (positionResult===positionWrong3) | (positionResult===positionWrong2) | (positionWrong1===positionWrong2) |(positionWrong1===positionWrong3) | (positionWrong3===positionWrong2))

         p1.source="../images/Bola/"+positionResult+".png"
         p2.source="../images/Bola/"+positionWrong1+".png"
         p3.source="../images/Bola/"+positionWrong2+".png"
         p4.source="../images/Bola/"+positionWrong3+".png"

    }

    function random(numPossibilidades){
        var aleat = Math.random() * numPossibilidades;
        aleat = Math.floor(aleat);
        return aleat+1;
    }

    function incrementTries(){
        tries++;
    }

    function calcFeedback(){

    }



}
