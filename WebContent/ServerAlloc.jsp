

<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
ServletContext ctx = getServletContext();
Map<String,String> selmap1 =(Map<String,String>) session.getAttribute("selmap1");
Map<String,String> selmap2 =(Map<String,String>) session.getAttribute("selmap2");
Map<String,String> selmap3 =(Map<String,String>) session.getAttribute("selmap3");
Map<String,String> selmap4 =(Map<String,String>) session.getAttribute("selmap4");
Map<String,String> selmap5 =(Map<String,String>) session.getAttribute("selmap5");
Map<String,String> selmap6 =(Map<String,String>) session.getAttribute("selmap6");

Map<String,Double> ecmap1 =(Map<String,Double>) session.getAttribute("ecmap1");
Map<String,Double> ecmap2 =(Map<String,Double>) session.getAttribute("ecmap2");
Map<String,Double> ecmap3 =(Map<String,Double>) session.getAttribute("ecmap3");
Map<String,Double> ecmap4 =(Map<String,Double>) session.getAttribute("ecmap4");
Map<String,Double> ecmap5 =(Map<String,Double>) session.getAttribute("ecmap5");
Map<String,Double> ecmap6 =(Map<String,Double>) session.getAttribute("ecmap6");
//application.getAttribute("cdDetails");
%>

<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script type="text/javascript" id="runscript">

$(document).ready(function(){
//	alert("NEW");
    
});



</script>
<style>
button {
    color: ""C14746";
}
</style>
<%--
 <form>

Description:<br/><textarea>${objectid} ${" "} ${objectprity} ${" "} ${cachetype}</textarea>

</form>  
--%>
<!-- <h2>position: relative;</h2> -->


<body onload="myFunction()">
<div id="downButton">
<%
    
     if(selmap6.size()==1&&("DN").equalsIgnoreCase(selmap6.get("DN"))){
       
    	 out.print("<input type=\"submit\" name=\"button\" id=\"button\" value=\"S6-UP\"  onclick=\"add_sm3()\"/>");	 
     }
     else{
       out.print("<input type=\"submit\" name=\"button\" id=\"button\" value=\"S6-DOWN\"  onclick=\"delete_sm3()\" />");
     }
    	 
%>
</div>
<div id="left">
<h3 style="color: #C14746">Selective Replication</h3>
<table border="2" id="sm1" style="display:inline-block; width: auto;"  >

<tr>
<th width="5">S1</th>

</tr>
<c:forEach items="${selmap1}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td>${cd.value}</td></td>
	</tr>
</c:forEach>
</table>

<table border="1" id="sm2" style="display:inline-block; width: auto;"   >
<tr>
<th width="5">S2</th>
</tr>
<c:forEach  items="${selmap2}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td>${cd.value}</td></td>
	</tr>
</c:forEach>
</table>

<%-- <c:choose>
    <c:when test="${param.enter=='1'}">
        pizza. 
        <br />
    </c:when>    
    <c:otherwise>
        pizzas. 
        <br />
    </c:otherwise>
</c:choose> --%>

<table id="sm3" border="1" style="display:inline-block; width: auto;" >
<tr>
<th width="4">S3</th>
</tr>
<c:forEach items="${selmap3}" var="cd">
  <tr>
	<c:choose>
    <c:when test="${cd.key == 'DN'}">
      
		<td><font color="C14746">DN</font><td>0</td></td>

    </c:when>    
    <c:otherwise>
       <td><font color="C14746">${cd.key}</font> <td>${cd.value}</td></td>
    </c:otherwise>
</c:choose>
	
	
	</tr>
</c:forEach>

</table>


<table id="sm4" border="1" style="display:inline-block; width: auto;" >
<tr>
<th width="5">S4</th>
</tr>
<c:forEach items="${selmap4}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>

</table>
<table id="sm5" border="2" style="display:inline-block; width: auto;" >
<tr>
<th width="3">S5</th>
</tr>
<c:forEach items="${selmap5}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>

</table>
<table id="sm6" border="1" style="display:inline-block; width: auto;" >
<tr>
<th width="3">S6</th>
</tr>
<c:forEach items="${selmap6}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>

</table>
</div>

<div id="right">
<h3 style="color: #C14746">Ec-Cache: Parameter k=4 and R=2</h3>
<table id="ec1" border="1" style="display:inline-block; width: auto;"  >
<tr>
<th width="5">S1</th>
</tr>
<c:forEach items="${ecmap1}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>
</table>
<table id="ec2" border="1" style="display:inline-block; width: auto;" >
<tr>
<th width="5">S2</th>
</tr>
<c:forEach items="${ecmap2}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>
</table>

<table id="ec3" id="table" border="1" style="display:inline-block; width: auto;" >
<tr>
<th width="3">S3</th>
</tr>
<c:forEach items="${ecmap3}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>

</table>
<table id="ec4" border="2" style="display:inline-block; width: auto;" >
<tr>
<th width="5">S4</th>
</tr>
<c:forEach items="${ecmap4}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>

</table>
<table id="ec5" border="2" style="display:inline-block; width: auto;" >
<tr>
<th width="5">S5</th>
</tr>
<c:forEach items="${ecmap5}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>

</table>
<table id="ec6" border="2" style="display:inline-block; width: auto;" >
<tr>
<th width="5">S6</th>
</tr>
<c:forEach items="${ecmap6}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>

</table>
<br>
<a href="ec_cache_inter_structure.action"><font style="color: #C14746">EC-Cache Internal Structure</font></a>
</div>

</body>


<!-- <div id="myDiv"  class="modal" style="width: 480px; height: 400px;">
</div> -->

<!-- <input type="button" style="color: #C14746" name="click" id="click" value="CLICK" onclick="myFunction()"> --> 

