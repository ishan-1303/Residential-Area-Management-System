<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.text.*"%>
<jsp:useBean id="dbCon" class="bean.SQLConnectionBean"/>
    
<!DOCTYPE html>
<html>
<head>
	<title>Gender Ratio</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron">
	<%
		dbCon.connect();
		String sql = "SELECT COUNT(*) FROM people";
		ResultSet rs = dbCon.sqlQuery(sql);
		int total = 0, male = 0, female = 0, other = 0;
		if(rs.next()) {
			total = rs.getInt(1);
		}
		
		sql = "SELECT COUNT(*) FROM people WHERE gender = 'male'";
		rs = dbCon.sqlQuery(sql);
		if(rs.next()) {
			male = rs.getInt(1);
		}
		
		sql = "SELECT COUNT(*) FROM people WHERE gender = 'female'";
		rs = dbCon.sqlQuery(sql);
		if(rs.next()) {
			female = rs.getInt(1);
		}
		
		sql = "SELECT COUNT(*) FROM people WHERE gender = 'other'";
		rs = dbCon.sqlQuery(sql);
		if(rs.next()) {
			other = rs.getInt(1);
		}
		
		float pm = (male * 100) / total;
		float fm = (female * 100) / total;
		float om = (other * 100) / total;
		dbCon.close();
		%>
		<h1 class="heading-1">Ratio:</h1>
		<h1>Male:<%out.println(pm); %></h1>
		<h1>Female:<%out.println(fm); %></h1>
		<h1>Other:<%out.println(om); %></h1>
		<%
	%>
	<a href="home.jsp"><button class="btn btn-success">Home Page</button></a>
	</div>
</body>
</html>