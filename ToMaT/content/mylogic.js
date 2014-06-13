.pragma library // Shared game state
var letrasVistas=0;
var letterCenter;
var correctLetter;
var answer;
var collision;
var result;
var tries;
var numberOfActivities;
var change;
var atividadeItem;
var clearLetters;
function mostrarPopup(object1, object2, object3, object4) {
    var source1=object1;
    var source2=object2;
    var source3=object3;
    var source4=object4;

    if(source1.indexOf("Clicked")>0 && source2.indexOf("Clicked")>0&& source3.indexOf("Clicked")>0 && source4.indexOf("Clicked")>0 ){
        return true;
    }else{
        return false;
    }
}

function setCorrectLetter(source){
    var source1=source+"";
    if(source1.indexOf("AHeader")>0){
        correctLetter='A_.png';
    }else  if(source1.indexOf("BHeader")>0){
        correctLetter='B_.png';
    }else  if(source1.indexOf("CHeader")>0){
        correctLetter='C_.png';
    }else  if(source1.indexOf("DHeader")>0){
        correctLetter='D_.png';
    }
    console.log("Letter: correct111: "+ correctLetter)

}

function getSource (source, resultNow){
    var s= source+"";
    s=s.replace("_", resultNow+"");
    s=s.replace("qrc:///", "");



    if(resultNow==='Ok'){
        console.log("ok "+numberOfActivities);
        result++;
        tries=0;
        if(numberOfActivities===3){
            atividadeItem.toResult(result);
        }else{
            atividadeItem.change();
        }
         numberOfActivities++;

    }else {
        tries++;
        setLife();
        console.log("trie++: "+ tries);
        if(tries===3){
            if(numberOfActivities===3){
                atividadeItem.toResult(result);
            }else{
                atividadeItem.change();
            }
             numberOfActivities++;

            tries=0;
         }
    }
    return s;
}

function getCorrectLetter(){
      return correctLetter;
}

function setAnswer(positionY){
    answer=positionY;
}

function getAnswer(){
   return answer;
}

function start(){
    letterCenter=null;
    answer=null;
    collision=false;
    result=0;
    tries=0;
    numberOfActivities=0;
    change=0;
    clearLetters = false
}



function getResult(){
    return result;
}

function setAtividadeItem(tempAtividadeItem) {
    atividadeItem = tempAtividadeItem;
}

function getClearLetters() {
    return clearLetters;
}

function setClearLetters(clear) {
    clearLetters = clear;
}


function setLife(){
    atividadeItem.setLife(3-tries);
}


var previousNumber1;
var previousNumber2;
var result;
var number1;
var number2;
var wrong1;
var wrong2;
var wrong3;
var positionResult;
var positionWrong1;
var positionWrong2;
var positionWrong3;


function init(){
    previousNumber1=0;
    previousNumber2=0;
    result=0;
    number1=0;
    number2=0;
    wrong1=0;
    wrong2=0;
    wrong3=0;

}

function sortChallenge(){
    do{
       number1 = random(9);
       result = random(9);
       number2= result-number1;
    } while ((number1<=result) & (number1===previousNumber1) & (number2===previousNumber2))

   do{
        wrong1 = random(9);
        wrong2 = random(9);
        wrong3 = random(9);
    }while ((wrong1===wrong2) & (wrong1===wrong3) & (wrong3===wrong2) & (wrong1===result) & (wrong2===result) & (wrong3===result))

    previousNumber1=number1;
    previousNumber2=number2;
}

function sorPosition(){

}

function random(numPossibilidades){
    var aleat = Math.random() * numPossibilidades;
    aleat = Math.floor(aleat);
    return aleat;
}

