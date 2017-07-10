<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EC Cache Internals</title>

<script type="text/javascript" src="algoAjax.js"></script>
<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script  src="plotly.js"></script>

<style> 
#panel, #flip {
    padding: 5px;
    text-align:left;
    background-color: #e5eecc;
    border: solid 1px #C14746;
}

#panel {
    padding: 100px;
    display: none;
}

#panel1, #flip1 {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #C14746;
}

#panel1 {
    padding: 100px;
    display: none;
 }
 #hspace {
    padding: 25px 50px 75px;
 }
 #inbox {
    padding: 50px 50px 75px;
    
 }
 .redBg {
    background: red;
}
 
 .modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}


/* The DE_Close Button */
.de_close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.de_close:hover,
.de_close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

</style>
</head>


<body>
<h1 style="color: #C14746">EC CACHE INTERNAL ARCHITECTURE</h1>
<div id="flip" style="color: #C14746" align="center">Write Operation
</div>

<div id="panel">
<form name="split_object">
Input to Encode<input type="text" name="en_input" id="en_input" value=""  align="top">
&nbsp;<input type="button" name="en_split" id="en_split" value="SPLIT" title="SPLIT" onclick="fnsplit(document.split_object)"> 
</form>
<div id="splitObjects"></div>
</div>
<!-- <div id="myModal" class="modal">

  Modal content
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Some text in the Modal..</p>
          <h3>Object is split and encoded in K(4) and N(2) Servers:</h3>
			<table border="2" id="k1" style="display: inline-block; width: auto;" bgcolor="green">
				<tr>
					<th width="50">K1</th>
				</tr>
				<tr>
					<td>ABCD</td>
				</tr>
			</table>
			
			<table border="2" id="k2" style="display: inline-block; width: auto;" bgcolor="green">
				<tr>
					<th width="50">K2</th>
				</tr>
				<tr>
					<td>EFGH</td>
				</tr>
			</table>
			
			<table border="2" id="K3" style="display: inline-block; width: auto;" bgcolor="green">
				<tr>
					<th width="50">K3</th>
				</tr>
				<tr>
					<td>IJKL</td>
				</tr>
			</table>
			
			<table border="2" id="K4" style="display: inline-block; width: auto;" bgcolor="green">
				<tr>
					<th width="50">K4</th>
				</tr>
				<tr>
					<td>MNOP</td>
				</tr>
			</table>
			<table border="2" id="P1" style="display: inline-block; width: auto;" bgcolor="7DED73">
				<tr>
					<th width="50">P1</th>
				</tr>
				<tr>
					<td>52 52 53 49</td>
				</tr>
			</table>
			<table border="2" id="P2" style="display: inline-block; width: auto;" bgcolor="7DED73">
				<tr>
					<th width="50">P2</th>
				</tr>
				<tr>
					<td>55 56 57 25</td>
				</tr>
			</table>

		</div>
 </div>   --> 
<div id="hspace"></div>

<div id="flip1" style="color: #C14746">Read Operation
</div>
<div id="panel1">
<!-- <input type="de_button" name="de_input" id="de_split" value="DECODE" title="DECODE" >  -->
<form name="decode_object">
Choose any Four Servers to Decode<br/>
<input type="file" name="file1"  id="file1">
<input type="file" name="file2"  id="file2">
<input type="file" name="file3"  id="file3">
<input type="file" name="file4"  id="file4">
<h2></h2>
<br/>
<input type="button" name="de_output" id="de_split" value="DECODE" title="DECODE"  onclick="fndecode(document.decode_object)">
</form> 
<div id="decodedObjects"></div>
<!-- Output of the Decode<input type="text" name="de_output"  id="de_output"> -->

<!-- <div id="de_myModal" class="modal">

  Modal content
  <div class="modal-content">
    <span class="de_close">&times;</span>
     <h3>Any K(4) servers output is enough to Decode the object</h3>  
       <table border="2" id="DK1" style="display: inline-block; width: auto;" >
				<tr>
					<th width="50">K1</th>
				</tr>
				<tr>
					<td>ABCD</td>
				</tr>
			</table>
			
			<table border="2" id="DK2" style="display: inline-block; width: auto;" >
				<tr>
					<th width="50">K2</th>
				</tr>
				<tr>
					<td>EFGH</td>
				</tr>
			</table>
			
			<table border="2" id="DK3" style="display: inline-block; width: auto;" >
				<tr>
					<th width="50">K3</th>
				</tr>
				<tr>
					<td>IJKL</td>
				</tr>
			</table>
			
			<table border="2" id="DK4" style="display: inline-block; width: auto;">
				<tr>
					<th width="50">K4</th>
				</tr>
				<tr>
					<td>MNOP</td>
				</tr>
			</table>
			<table border="2" id="DK5" style="display: inline-block; width: auto;" >
				<tr>
					<th width="50">P1</th>
				</tr>
				<tr>
					<td>52 52 53 49</td>
				</tr>
			</table>
			<table border="2" id="DK6" style="display: inline-block; width: auto;" >
				<tr>
					<th width="50">P2</th>
				</tr>
				<tr>
					<td>55 56 57 25</td>
				</tr>
			</table>
		<br/>	
     INPUT USED TO DECODE:  <textarea rows="3" cols="30" id="input_used" style="color: orange;"></textarea> 
</div>
</div> -->
 </div>   


<script> 
$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
});
$(document).ready(function(){
    $("#flip1").click(function(){
        $("#panel1").slideToggle("slow");
    });
});
//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("en_split");

 var de_modal = document.getElementById('de_myModal');

//Get the button that opens the modal
var de_btn = document.getElementById("de_split"); 


// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var de_span = document.getElementsByClassName("de_close")[0];
// When the user clicks the button, open the modal 


/* de_btn.onclick = function() {
	 var S1="ABCD";var S2="EFGH";var S2="IJKL";var S2="MNOP";
	var S2="52 53 54 49";var S2="55 56 57 25"; 
	
	var cars = ["ABCD", "EFGH", "IJKL", "MNOP", "52 53 54 49", "55 56 57 25"];
    
    var str=document.getElementById('de_server').value;
    var res = str.split("/");
    var numberPattern = /\d+/g;

   // 'something102asdfkj1948948'.match( numberPattern )
    
    var res_num0 = res[0].match(numberPattern);
    var res_num1 = res[1].match(numberPattern);
    document.getElementById('DK'+res_num0).style.backgroundColor = "red";
    document.getElementById('DK'+res_num1).style.backgroundColor = "red";
    var text="";
    //alert(match[1]);
    //alert(res_num0 + res_num1);
    for (i = 0; i < cars.length; i++) {
    	if(!(cars[i]==cars[res_num0-1]||cars[i]==cars[res_num1-1]))
        	text +="| "+ cars[i];
    }
    
    //alert(text);    
    document.getElementById('input_used').value = text;
    document.getElementById('de_output').value = '';
    de_modal.style.display = "block";
    
} */
/* btn.onclick = function() {
    modal.style.display = "block";
    
} */

// When the user clicks on <span> (x), close the modal
window.onload=function(){
/* span.onclick = function() {
    modal.style.display = "none";
} */
/* de_span.onclick = function() {
    de_modal.style.display = "none";
    document.getElementById('de_output').value = 'ABCDEFGHIJKLMNOP';
    document.getElementById('DK'+1).style.backgroundColor = "";
    document.getElementById('DK'+2).style.backgroundColor = "";
    document.getElementById('DK'+3).style.backgroundColor = "";
    document.getElementById('DK'+4).style.backgroundColor = "";
    document.getElementById('DK'+4).style.backgroundColor = "";
    document.getElementById('DK'+5).style.backgroundColor = "";
    document.getElementById('DK'+6).style.backgroundColor = "";
} */
}

// When the user clicks anywhere outside of the modal, close it
/* window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
    if (event.target == de_modal) {
        de_modal.style.display = "none";
    }
} */



</script>

<a href="results.action">
<img border="0" alt="results" src=./img/button.gif width="100" height="100">
</a>
</body>
</html>	