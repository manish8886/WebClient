<%-- 
    Document   : index
    Created on : Nov 17, 2012, 8:55:30 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <title>My first web page</title>
        <link rel="stylesheet" type="text/css" href="css/JSP-Styles.css" />
        <script>
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
        </script>
    </head>
    <body>

        <table style="background-color:white;" width="100%" cellspacing="0">
            <tr class="FirstRow">
                <td width="10%" valign="top" align="left">
                    <a href="www.buffalo.edu/">
                        <img src="images/logo1.jpg" />
                    </a>
                </td>
                <td  align="left" valign="center"> 
                    <span id="ctl03_Banner_PortalTitle" class="SiteTitle"><Strong>University <br>At<Strong><br>
                                Buffalo</span>
                                </td>
                                <td valign="center" align="center" rowspan="1">
                                    <H1>
                                        Project Country Info
                                    </H1>
                                </td>
                                <td width="20%" valign="center" align="right"> 
                                    <span id="ctl03_Banner_PortalTitle" class="SiteTitle"><Strong>Data <br>Intensive<Strong><br>
                                                Computing</span>
                                                </td>
                                                <td width="2%">

                                                </td>
                                                <td  width="5%" valign="middle" align="right">
                                                    <img id="ctl03_Banner_HeaderImage2" style="border-width:0px;" src="images/logo2.jpg"/>
                                                </td>
                                                </tr>
                                                <tr>

                                                    <td id="leftCol">
                                                    </td>
                                                    <td id="formCol" colspan = "4" align="center">
                                                        <form class="mainform" action="CountryDbServlet" method="POST">
                                                            <table class = "FaostatForm">
                                                                <tr>
                                                                    <td  valign = "top">
                                                                        <fieldset>
                                                                            <legend>Country</legend>
                                                                            <select id="listbox1" class="test" name="countrylistbox" size="8">
                                                                                <option disabled="disabled" style="color: graytext" value="0">---------- Individual Countries ----------</option>
                                                                                <option>Afghanistan</option>
                                                                                <option>Albania</option>
                                                                                <option>Algeria</option>
                                                                                <option>American Samoa</option>
                                                                                <option>Andorra</option>
                                                                                <option>Angola</option>
                                                                                <option>Anguilla</option>
                                                                            </select>
                                                                            <br>
                                                                            <br>
                                                                            <input type="submit" name="countryinfobtn" value="GetCountryInfo">
                                                                            <input type="submit" name="showmapbtn" value="ShowMap">
                                                                        </fieldset>
                                                                    </td>
                                                                    <td style="width: 5%">
                                                                        <button type= "button" onmouseover="GettheFocus()" onclick="GetListItem()"><div class="arrow-right"></div></button>
                                                                    </td >
                                                                    <td  valign = "top">
                                                                        <fieldset>
                                                                            <br>
                                                                            <br>
                                                                            <legend>CheckBorderCountry</legend>
                                                                            Country1: 	<input id="country1" type="text" name= "firstcountryeditbox" value=""><br>
                                                                            Country2: 	<input id="country2"type="text" name= "secondcountryeditbox" value=""><br>
                                                                            <br>
                                                                            <br>
                                                                            <br>
                                                                            <br>
                                                                            <input type="submit" name="arebordercountriesbtn" value="AreBorderCountries">
                                                                        </fieldset>
                                                                    </td>
                                                                    <td  valign = "top">
                                                                        <fieldset>
                                                                            <legend>SortingCriteria</legend>
                                                                            <DL>
                                                                                <DD><INPUT TYPE="RADIO" NAME="SortingCriteria" VALUE="population">
                                                                                    Population
                                                                                <DD><INPUT TYPE="RADIO" NAME="SortingCriteria" VALUE="gdp">
                                                                                    GDP
                                                                                <DD><INPUT TYPE="RADIO" NAME="SortingCriteria" VALUE="landarea" CHECKED>
                                                                                    Landarea
                                                                                <DD><INPUT TYPE="RADIO" NAME="SortingCriteria" VALUE="hdi">
                                                                                    Human Development Index
                                                                                    <br>
                                                                                    <br>
                                                                                <DD><input type="checkbox" name="order" value="asc/des">
                                                                                    From Top/Bottom
                                                                            </DL>
                                                                            <input type="submit" name="sortingbtn" value="GetCountriesList">
                                                                            (max 10)
                                                                        </fieldset>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td  valign = "top" colspan="2">
                                                                        <fieldset>
                                                                            <br>
                                                                            <br>
                                                                            <legend>Positions</legend>
                                                                            Latitdue:	&nbsp &nbsp <input type="text" name= "latitude" value=""><br>
                                                                            Longitude: <input type="text" name= "longitude" value=""><br>
                                                                            <br>
                                                                            <br>
                                                                            <br>
                                                                            <br>
                                                                            <input type="submit" name="findpositionBtn" value="FindCountry">
                                                                        </fieldset>
                                                                    </td>
                                                                    <td  valign = "top">
                                                                        <fieldset>
                                                                            <legend>FindByCapital</legend>
                                                                            <table class="findbycapital">
                                                                                <tr>
                                                                                    <td align="left">
                                                                                        Capital Name:
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name= "capitalnameedit" value=""><br>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="left">
                                                                                        Latitdue:
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name= "capitallatitudeedit" value=""><br>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="left">
                                                                                        Longitude:
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name= "capitallongitudeedit" value=""><br>
                                                                                    </td>
                                                                                </tr>
                                                                                </tr>
                                                                            </table><br><br><br><br>
                                                                            <input type="submit" name="findnearestCaptialsbtn" value="findnearestCaptials">
                                                                        </fieldset>
                                                                    </td>
                                                                    <td>
                                                                        <fieldset>
                                                                            <legend>Classify</legend>
                                                                            Number of groups : <input style = "width:50;" type="text" name= "grpcountedit" value=""><br><br><br>
                                                                            <input type="submit" name="classifybtn" value="Classify">
                                                                        </fieldset>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </form>
                                                    </td>

                                                    <td id="right">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <c:if test="${not empty countries}">
                                                        <td colspan="6">
                                                            <div style="height:120px;width:100%;border:1px solid #ccc;font:16px/26px Georgia, Garamond;overflow:auto;">
                                                                <table width ="100%"border="5"  cellspacing="0" align="center">
                                                                    <tr bgcolor="green">
                                                                    <th>NAME</th>                                                                        
                                                                    <th>CAPITALNAME</th>
                                                                    <th>UNCODE</th>
                                                                    <th>POPULTAION</th>
                                                                    <th>GDPTOTAL</th>
                                                                    <th>LANDAREA</th>
                                                                    <th>HDI</th>
                                                                    </tr>
                                                                    <c:forEach items="${countries}" var="country">
                                                                            <tr bgcolor="blue">
                                                                                <td>${country.nameEN}</td>
                                                                                <td>${country.nameCapital}</td>
                                                                                <td>${country.unCode}</td>
                                                                                <td>${country.population}</td>
                                                                                <td>${country.gdpTotal}</td>
                                                                                <td>${country.landarea}</td>
                                                                                <td>${country.hdi}</td>
                                                                            </tr>
                                                                    </c:forEach>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${not empty strResponse}">
                                                        <td colspan="6" bgcolor="green" style="height:120px;width:100%;border:1px solid #ccc;font:16px/26px Georgia, Garamond;">${strResponse}</td>
                                                    </c:if>
                                                </tr>
                                                </table>
                                                </body>
                                                </html>

