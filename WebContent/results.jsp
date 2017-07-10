<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

.axis .domain {
  display: none;
}
.modal {
    display: none;
  }
</style>
<script  src="plotly.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RESULTS</title>

</head>
<body>
<div id="myDiv"  class="modal" style="width: 480px; height: 400px;">
</div>
<!-- Click<input type="button" name="click" id="click" value="click"> -->
<font style="color: #C14746">Select Graph</font><select id="mySelect" onchange="myFunction()">
  <option value=""></option>
  <option value="ReadLatency">ReadLatency</option>
</select>
<script>

var btn = document.getElementById('click');

	
var trace1 = {
		  x: ['Mean', 'Median', '95th','99th','99.9th'], 
		  y: [242, 238, 283,340,881], 
		  name: 'selective Replication', 
		  type: 'bar'
		};

		var trace2 = {
		  x: ['Mean', 'Median', '95th','99th','99.9th'], 
		  y: [96, 90, 134,193,492], 
		  name: 'Ec-Cache', 
		  type: 'bar'
		};

		var data = [trace1, trace2];

		var layout = {barmode: 'group',
				
			xaxis: {
			    title: '',
			    titlefont: {
			      family: 'Courier New, monospace',
			      size: 18,
			      color: '#7f7f7f'
			    }
			  },
			  yaxis: {
			    title: 'Read Latency (ms)',
			    titlefont: {
			      family: 'Courier New, monospace',
			      size: 18,
			      color: '#7f7f7f'
			    }
			  }
		
		};

		Plotly.newPlot('myDiv', data, layout);
		var modal = document.getElementById('myDiv');
		btn.onclick = function() {
		    modal.style.display = "block";
	}	
		function myFunction() {
		    var x = document.getElementById("mySelect").value;
		   // alert(x);
		    if(x=='ReadLatency'){
		    var modal = document.getElementById('myDiv');
		    modal.style.display = "block";
		    }
		}		

</script>


</body>
</html>