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
var actualActivity;
var nextActivity;
var folder;
var pos;
function nextActivity(){
    var nextActivity = actualActivity++;
    folder="../images/Atividades/"+folder+"/";


}
function next(){
    if(pos === undefined)
        pos = 0;
    pos = (pos + 1)%4;
    return pos;
}

