

<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
ServletContext ctx = getServletContext();
Map<String,String> selmap1 =(Map<String,String>) session.getAttribute("selmap1");
Map<String,String> selmap2 =(Map<String,String>) session.getAttribute("selmap2");
Map<String,String> selmap3 =(Map<String,String>) session.getAttribute("selmap3");
Map<String,String> selmap4 =(Map<String,String>) session.getAttribute("selmap4");

Map<String,Double> ecmap1 =(Map<String,Double>) session.getAttribute("ecmap1");
Map<String,Double> ecmap2 =(Map<String,Double>) session.getAttribute("ecmap2");
Map<String,Double> ecmap3 =(Map<String,Double>) session.getAttribute("ecmap3");
Map<String,Double> ecmap4 =(Map<String,Double>) session.getAttribute("ecmap4");
//application.getAttribute("cdDetails");
%>

<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script type="text/javascript" id="runscript">

$(document).ready(function(){
	//alert("NEW");
    
});



</script>
<%--
 <form>

Description:<br/><textarea>${objectid} ${" "} ${objectprity} ${" "} ${cachetype}</textarea>

</form>  
--%>
<!-- <h2>position: relative;</h2> -->




<div id="left">
<h3 style="color: #C14746">Selective Replication</h3>

<input type="submit" name="button" id="button" value="S3-UP"  onclick="add_sm3()"/>
<table border="2" id="sm1" style="display:inline-block; width: auto;"  >

<tr>
<th width="50">S1</th>

</tr>
<c:forEach items="${selmap1}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td>${cd.value}</td></td>
	</tr>
</c:forEach>
</table>

<table border="2" id="sm2" style="display:inline-block; width: auto;"   >
<tr>
<th width="50">S2</th>
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

<table id="sm3" border="2" style="display:inline-block; width: auto;" >
<tr>
<th width="50">S3</th>
</tr>
<c:forEach items="${selmap3}" var="cd">
  <tr>
	<c:choose>
    <c:when test="${cd.key == 'DOWN'}">
      
		<td><font color="C14746">DOWN</font><td>0</td></td>

    </c:when>    
    <c:otherwise>
       <td><font color="C14746">${cd.key}</font> <td>${cd.value}</td></td>
    </c:otherwise>
</c:choose>
	
	
	</tr>
</c:forEach>

</table>


<table id="sm4" border="2" style="display:inline-block; width: auto;" >
<tr>
<th width="50">S4</th>
</tr>
<c:forEach items="${selmap4}" var="cd">
	<tr>
	<td><font color="C14746">${cd.key}</font> <td> ${cd.value}</td></td>
	</tr>
</c:forEach>

</table>
</div>

<div id="right">
<h3 style="color: #C14746">Ec-Cache: Parameter k=2</h3>
<table border="2" style="display:inline-block; width: auto;"  >
<tr>
<th width="50">ECS1</th>
</tr>
<c:forEach items="${ecmap1}" var="cd">
	<tr>
	<td>${cd.key}a ${" "}  ${cd.value}</td>
	</tr>
</c:forEach>
</table>
<table border="2" style="display:inline-block; width: auto;" >
<tr>
<th width="50">ECS2</th>
</tr>
<c:forEach items="${ecmap2}" var="cd">
	<tr>
	<td>${cd.key}b ${" "}  ${cd.value}</td>
	</tr>
</c:forEach>
</table>

<table id="table" border="2" style="display:inline-block; width: auto;" >
<tr>
<th width="50">ECS3</th>
</tr>
<c:forEach items="${ecmap3}" var="cd">
	<tr>
	<td>${cd.key}c ${" "}  ${cd.value}</td>
	</tr>
</c:forEach>

</table>
<table border="2" style="display:inline-block; width: auto;" >
<tr>
<th width="50">ECS4</th>
</tr>
<c:forEach items="${ecmap4}" var="cd">
	<tr>
	<td>${cd.key}d ${" "}  ${cd.value}</td>
	</tr>
</c:forEach>

</table>
<br>
<a href="ec_cache_inter_structure.action"><font style="color: #C14746">EC-Cache Internal Structure</font></a>
</div>

<div id="myDiv"  class="modal" style="width: 480px; height: 400px;">
</div>
Click<input type="button" name="click" id="click" value="click" onclick="myFunction()"> 

