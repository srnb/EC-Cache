<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
ServletContext ctx = getServletContext();
Map<String,String> selmap1 =(Map<String,String>) session.getAttribute("selmap1");
Map<String,String> selmap2 =(Map<String,String>) session.getAttribute("selmap2");
Map<String,String> selmap3 =(Map<String,String>) session.getAttribute("selmap3");
Map<String,String> selmap4 =(Map<String,String>) session.getAttribute("selmap4");

String [] split_String=(String [])request.getAttribute("split_String");

//application.getAttribute("cdDetails");
%>
<h3>Object is split and encoded in K(4) and N(2) Servers:</h3>
			<table border="2" id="k1" style="display: inline-block; width: auto;" bgcolor="green">
				<tr>
					<th width="50">K1</th>
				</tr>
				<tr>
					<td>${split_String[0]}</td>
				</tr>
			</table>
			
			<table border="2" id="k2" style="display: inline-block; width: auto;" bgcolor="green">
				<tr>
					<th width="50">K2</th>
				</tr>
				<tr>
					<td>${split_String[1]}</td>
				</tr>
			</table>
			
			<table border="2" id="K3" style="display: inline-block; width: auto;" bgcolor="green">
				<tr>
					<th width="50">K3</th>
				</tr>
				<tr>
					<td>${split_String[2]}</td>
				</tr>
			</table>
			
			<table border="2" id="K4" style="display: inline-block; width: auto;" bgcolor="green">
				<tr>
					<th width="50">K4</th>
				</tr>
				<tr>
					<td>${split_String[3]}</td>
				</tr>
			</table>
			<table border="2" id="P1" style="display: inline-block; width: auto;" bgcolor="7DED73">
				<tr>
					<th width="50">P1</th>
				</tr>
				<tr>
					<td>${split_String[4]}</td>
				</tr>
			</table>
			<table border="2" id="P2" style="display: inline-block; width: auto;" bgcolor="7DED73">
				<tr>
					<th width="50">P2</th>
				</tr>
				<tr>
					<td>${split_String[5]}</td>
				</tr>
			</table>
