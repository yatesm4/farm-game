/// split the msg string
var msg = argument[0]; //string to split
var splitBy = argument[1]; //string to split the first string by
var slot = 0;
var splits; //array to hold all splits
var str2 = ""; //var to hold the current split we're working on building

var a;
for (a = 1; a < (string_length(msg)+1); a++) {
    var currStr = string_copy(msg, a, 1);
    if (currStr == splitBy) {
        splits[slot] = str2; //add this split to the array of all splits
        slot++;
        str2 = "";
    } else {
        str2 = str2 + currStr;
        splits[slot] = str2;
    }
}
return splits;
