<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Basic Simulation of Selective and Ec-Cache Replication</title>

<script type="text/javascript" src="algoAjax.js"></script>
<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script  src="plotly.js"></script>
<script>

$(document).ready(function(){
    $("h3").click(function(){
        $(this).hide();
    });
});

function myFunction() {
	var btn = document.getElementById('click');
     var s1=0,s2=0,s3=0,s4=0,s5=0,s6=0; 
     var e1=0,e2=0,e3=0,e4=0,e5=0,e6=0; 
	
     $('#left #sm1').find('tr').each(function(){
    	
    	if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
    		
    	 s1=s1+parseInt(($(this).children('td:nth-child(2)').text()));
    	}
     });
     $('#left #sm2').find('tr').each(function(){
     	
     	if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
     	 s2=s2+parseInt(($(this).children('td:nth-child(2)').text()));
     		
     	}
      });
     
     $('#left #sm3').find('tr').each(function(){
     	
     	     	if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
     	 s3=s3+parseInt(($(this).children('td:nth-child(2)').text()));
     	     		
     	     	}
      });
     
     $('#left #sm4').find('tr').each(function(){
     	
		 if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
     	     		
     	 s4+=parseInt(($(this).children('td:nth-child(2)').text()));
     	     	}    	
      });
     
     $('#left #sm5').find('tr').each(function(){
      	
		 if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
     	     		
     	 s5+=parseInt(($(this).children('td:nth-child(2)').text()));
     	     	}    	
      });
     $('#left #sm6').find('tr').each(function(){
      	
		 if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
     	     		
     	 s6+=parseInt(($(this).children('td:nth-child(2)').text()));
     	     	}    	
      });
     
     $('#right #ec1').find('tr').each(function(){
     	
     	if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
     		
     	 e1=e1+parseInt(($(this).children('td:nth-child(2)').text()));
     	}
      });
      $('#right #ec2').find('tr').each(function(){
      	
      	if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
      	 e2=e2+parseInt(($(this).children('td:nth-child(2)').text()));
      		
      	}
       });
      
      $('#right #ec3').find('tr').each(function(){
      	
      	     	if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
      	 e3=e3+parseInt(($(this).children('td:nth-child(2)').text()));
      	     		
      	     	}
       });
      
      $('#right #ec4').find('tr').each(function(){
      	
 		 if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
      	     		
      	 e4+=parseInt(($(this).children('td:nth-child(2)').text()));
      	     	}    	
       });
     
      $('#right #ec5').find('tr').each(function(){
        	
  		 if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
       	     		
       	 e5+=parseInt(($(this).children('td:nth-child(2)').text()));
       	     	}    	
        });
      $('#right #ec6').find('tr').each(function(){
        	
  		 if(!isNaN(parseInt(($(this).children('td:nth-child(2)').text())))) {
       	     		
       	 e6+=parseInt(($(this).children('td:nth-child(2)').text()));
       	     	}    	
        });
	var trace1 = {
			  x: ['Server1', 'Server2', 'Server3','Server4','Server5','Server6'], 
			  y: [s1, s2,s3,s4,s5,s6], 
			  name: 'selective Replication', 
			  type: 'bar'
			};

			var trace2 = {
			  x: ['Server1', 'Server2', 'Server3','Server4','Server5','Server6'], 
			  y: [e1, e2, e3,e4,e5,e6], 
			  name: 'Ec-Cache', 
			  type: 'bar'
			};

			var data = [trace1];
			var data1 = [trace2];

			var layout = {barmode: 'group',
					
				xaxis: {
				    title: 'Servers',
				    titlefont: {
				      family: 'Courier New, monospace',
				      size: 18,
				      color: '#7f7f7f'
				    }
				  },
				  yaxis: {
				    title: 'Number of Requests.',
				    titlefont: {
				      family: 'Courier New, monospace',
				      size: 18,
				      color: '#7f7f7f'
				    }
				  }
			
			};

			Plotly.newPlot('myDiv', data, layout);
		//	var modal = document.getElementById('myDiv');
			
			
			Plotly.newPlot('myDiv1', data1, layout);
		//	var modal = document.getElementById('myDiv1');
				/* if(modal.style.display=='none')
			    modal.style.display = "block";
				else
					modal.style.display = "none"; */	
		
	}
	

</script>


<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

/* .right {
    
	float: right;
	width: 100px;
	border: 3px solid #73AD21;
	padding: 10px;
}

.left {
    
	float: lift;
	width: 100px;
	border: 3px solid #73AD21;
	padding: 10px;
} */

#sides {
	margin: 0;
}

#downButton {
padding-top: 50px;
}
#left {
  /*  border: 3px solid #C14746;
   /* padding-top: 30px;*/
	float: left;
	width: 490px;
	height: 300px; 
	overflow: auto;
}

#right {
   /* border: 3px solid #C14746;*/
    /*padding-top: 70px;*/
	float: right;
	width:  490px;
	height: 300px;
	overflow: auto;
}
#padding{
padding-top: 70px;
}
#paddingLink{
padding-top: 180px;
float: left;
}

#myDiv{
  /*  border: 3px solid #C14746;
   /* padding-top: 30px;*/
   padding-top: 100px;
	float: left;
	width: 45%;
	
}

#myDiv1{
  /*  border: 3px solid #C14746;
   /* padding-top: 30px;*/
   padding-top: 100px;
	float: right;
	width: 45%;
	
}
</style>


</head>
<body onload="myFunction()">
	<form name="basic_algo">
		<h2 style="color: #C14746">Enter object details:</h2>
		<br /> &nbsp;&nbsp;<font style="color: #C14746">Object Id:</font> <input
			type="text" name="objectid" size="7" /> &nbsp;&nbsp;<font
			style="color: #C14746">Object Priority:</font> <input type="text"
			name="objectprity" size=7> &nbsp;&nbsp;&nbsp;&nbsp;
			<font
			style="color: #C14746">Objects Frequency:</font> <input type="text"
			name="objectfreq" size=7> &nbsp;&nbsp;&nbsp;&nbsp;
			<font style="color: #C14746">Choose Cache Type:</font> <select
			style="color: #C14746" name="cacheType">
			<option value="select">Selective Replication</option>
			<option value="eccache">EC-Cache</option>
		</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" style="color: #C14746" value="Add" size="20" width="10"
			onclick="fnAddObjects(document.basic_algo) ">
		
	</form>
    <div id="padding">
      
    </div>
     <div id="paddingLink"></div> 
    
     <div id="output"></div>
	
	<div id="myDiv"  class="modal" style="width: 480px; height: 400px;"></div>
	<div id="myDiv1"  class="modal" style="width: 480px; height: 400px;"></div>
 	

</body>
</html>