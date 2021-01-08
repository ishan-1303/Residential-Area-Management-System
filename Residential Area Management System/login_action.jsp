<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<jsp:useBean id="dbCon" class="bean.SQLConnectionBean"/> 

<%@page import = "java.sql.*"%>
<%
String eid = request.getParameter("email");
String pwd = request.getParameter("pwd");

session.setAttribute("area", request.getParameter("area"));
dbCon.connect();
String sql = "SELECT email_id, password, fname, lname FROM login WHERE email_id = '" + eid + "' AND password = '" + pwd + "'";
ResultSet rs = dbCon.sqlQuery(sql);
if(rs.next()) {
	String name = rs.getString(3) + " " + rs.getString(4);
	session.setAttribute("user", name);  
	response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", "home.jsp");
}
dbCon.close();

%>