<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
ServletContext ctx = getServletContext();
Map<String,String> selmap1 =(Map<String,String>) session.getAttribute("selmap1");
Map<String,String> selmap2 =(Map<String,String>) session.getAttribute("selmap2");
Map<String,String> selmap3 =(Map<String,String>) session.getAttribute("selmap3");
Map<String,String> selmap4 =(Map<String,String>) session.getAttribute("selmap4");

String  output=(String )request.getAttribute("output");

//application.getAttribute("cdDetails");
%>
<h2>DECODED STRING</h2>
<%= output %>