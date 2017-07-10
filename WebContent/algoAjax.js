
var xhr;

function fnInitXhr(){
	if(window.ActiveXObject){
		// true for MS-IE
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else{
		xhr = new XMLHttpRequest(); // works even for IE8 onwards
	}
}

function fnAddObjects(form1){
	fnInitXhr();
	if(xhr){
		var objectid=form1.objectid.value;
		var objectprity=form1.objectprity.value;
		var cachetype=form1.cacheType.value;
		var objectfreq=form1.objectfreq.value; 
		//alert("cache Type"+objectfreq);
		// alert("objectid  "+objectid+" objectprity"+objectprity);
		//var url="getdescofCity.action?city="+city;
		var url = "addobjecttotable.action?objectid="+objectid+"&objectprity="+objectprity+"&cachetype="+cachetype+"&objectfreq="+objectfreq;
		xhr.open("GET", url, true);
		xhr.onreadystatechange=fnUpdateTable;
		xhr.send(null);
	}
}

function fnsplit(form1) {
	fnInitXhr();
	var split_input=form1.en_input.value;
	if (xhr) {
		var url = "splitobject.action?split_input="+split_input;
		xhr.open("GET", url, true);
		xhr.onreadystatechange=fnUpdatesplitValues;
		xhr.send(null);
	}
}


function fndecode(form1) {
	fnInitXhr();
	var file1=form1.file1.value;
	var file2=form1.file2.value;
	var file3=form1.file3.value;
	var file4=form1.file4.value;
	fileName1=file1.match(/[^\/\\]+$/);
	fileName2=file2.match(/[^\/\\]+$/);
	fileName3=file3.match(/[^\/\\]+$/);
	fileName4=file4.match(/[^\/\\]+$/);
	var split_files=[fileName1,fileName1,fileName3,fileName4];
	
	if (xhr) {
		var url = "decodeobject.action?fileName1="+fileName1+"&fileName2="+fileName2+"&fileName3="+fileName3+"&fileName4="+fileName4;
		xhr.open("GET", url, true);
		xhr.onreadystatechange=fnUpdatedecoded;
		xhr.send(null);
	}
}


function delete_sm3(){
	//alert("delete_sm3");
	//document.getElementById("sm3").style.display="None";
	fnInitXhr();
	if(xhr){
		var url = "redistribute.action?objectid="+"DOWN";
		xhr.open("GET", url, true);
		xhr.onreadystatechange=fnUpdateTable;
		
		/*var x = document.getElementById('sm3');
	    if (x.style.display === 'none') {
	        x.style.display = 'inline-block';
	        document.getElementById("button").value="S3-DOWN";
	    } else {
	        x.style.display = 'none';
	        document.getElementById("button").value="S3-UP";
	        var server1_size=document.getElementById("sm1").getElementsByTagName("tr").length;
	        var server2_size=document.getElementById("sm2").getElementsByTagName("tr").length;
	        var server3_size=document.getElementById("sm3").getElementsByTagName("tr").length;
	        //var count = $('#gvPerformanceResult tr').length;
	        if((server1_size>"5" | server2_size>"5")&&server3_size>"3"){
	        	alert("Over Loading on Server1 and Server2");
	        }
	        
	    }*/
	    
		xhr.send(null);	
		
	
	
	}
}

function add_sm3(){
	var url = "redistribute.action?objectid="+"UP";
	xhr.open("GET", url, true);
	xhr.onreadystatechange=fnUpdateTable;
	xhr.send(null);
}


function fnUpdateTable(){
	if(xhr.readyState==4){
		document.getElementById("output").innerHTML=xhr.responseText;
		//document.getElementById("output1").innerHTML=xhr.responseText;
		myFunction();
	}
	
	
}

function fnUpdatesplitValues(){
	if(xhr.readyState==4){
		document.getElementById("splitObjects").innerHTML=xhr.responseText;
		//document.getElementById("output1").innerHTML=xhr.responseText;
	}
}

function fnUpdatedecoded(){
	if(xhr.readyState==4){
		document.getElementById("decodedObjects").innerHTML=xhr.responseText;
		//document.getElementById("output1").innerHTML=xhr.responseText;
	}
}










