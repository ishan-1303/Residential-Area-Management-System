<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.text.*"%>
<jsp:useBean id="dbCon" class="bean.SQLConnectionBean"/>



<%
	dbCon.connect();
	String sql = "DELETE FROM address WHERE id = '" + request.getParameter("id") + "'";
	boolean b = dbCon.sqlExecute(sql);
	
	sql = "DELETE FROM people WHERE id = '" + request.getParameter("id") + "'";
	boolean a = dbCon.sqlExecute(sql);
	out.println(a + "" +  b);
	
	if(!a && !b) {
		response.setStatus(response.SC_MOVED_TEMPORARILY);
	    response.setHeader("Location", "search.jsp");%>
	    1 record deleted	<%
	} else {
		response.setStatus(response.SC_MOVED_TEMPORARILY);
	    response.setHeader("Location", "search.jsp");
	}
	dbCon.close();
%>