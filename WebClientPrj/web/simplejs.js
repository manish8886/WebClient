var lastActiveElem;
function displayDate()
{
    document.getElementById("demo").innerHTML=Date();
}
function GettheFocus(){
    lastActiveElem = document.activeElement;
}
function GetListItem()
{
    var items = "";
    var frm = document.getElementById("listbox1");
    var countryFirstEditBox = document.getElementById("country1");
    var countrySecondEditBox = document.getElementById("country2");
    var firstCountryValue = countryFirstEditBox .value;
    var secondCountryValue = countrySecondEditBox.value;
    var len = frm.length;

    for(i=0;i<len;i++){
        if(frm[i].selected){
            //If any of the edit box has empty value first fill them
            if(firstCountryValue=="" && secondCountryValue==""){
                countryFirstEditBox.value = frm[i].text ;
            }else if(lastActiveElem==countryFirstEditBox){
                countryFirstEditBox.value = frm[i].text ;
            }else if(lastActiveElem==countrySecondEditBox){
                countrySecondEditBox.value = frm[i].text ;
		
            }
        }
    }

}