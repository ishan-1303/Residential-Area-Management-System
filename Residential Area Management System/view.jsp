<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.text.*"%>
<jsp:useBean id="dbCon" class="bean.SQLConnectionBean"/>
<!DOCTYPE html>
<html>
<head>
	<title>View</title>
	<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
<%
	dbCon.connect();
	String sql = "SELECT people.id, fname, lname, dob, gender, contact, areas.area, address.pincode, address.street, address.house FROM people, address, areas WHERE people.id = address.id AND address.pincode = areas.pincode";
	ResultSet rs = dbCon.sqlQuery(sql);
%>
<div class="container">
  <h2>People in City</h2>
  <table class="table table-condensed">
    <thead>
      <tr>
        <th>Aadhar ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Date of Birth</th>
        <th>Gender</th>
        <th>Contact</th>
        <th>Area</th>
        <th>Pin Code</th>
        <th>Street, House Number</th>
      </tr>
    </thead>
    <tbody>
     	<%
     	while(rs.next()) {
     	%>
     	<tr>
     	<td><%=rs.getString(1) %></td>
     	<td><%=rs.getString(2) %></td>
     	<td><%=rs.getString(3) %></td>
     	<td><%=rs.getDate(4) %></td>
     	<td><%=rs.getString(5) %></td>
     	<td><%=rs.getInt(6) %></td>
     	<td><%=rs.getString(7) %></td>
     	<td><%=rs.getInt(8) %></td>
     	<td><%=rs.getString(9) + ", " + rs.getInt(10) %></td>
     	</tr>
     		
     	<% 
     	}
     	%>
    </tbody>
  </table>
  <a href="home.jsp"><button class="btn btn-success">Home Page</button></a>
</div>
<%dbCon.close(); %>

</body>
</html>