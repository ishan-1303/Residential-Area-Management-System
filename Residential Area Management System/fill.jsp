<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import = "java.sql.*"%>
<%@page import = "java.text.*"%>
<jsp:useBean id="dbCon" class="bean.SQLConnectionBean"/>
<%
	dbCon.connect();
	String sql = "SELECT streets.street, houses.house FROM streets, houses WHERE streets.street = houses.street AND pincode = (SELECT pincode FROM areas WHERE area = '" + session.getAttribute("area") + "')";
	ResultSet rs = dbCon.sqlQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<title>Fill Details</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	function go() {
  		window.location.href = "home.jsp";
  	}
  </script>
</head>
<body>

<div class="container">
<h1><%=session.getAttribute("area") %> Area</h1>
  <h2>Person Details</h2>
  <form action="store_data.jsp" method="post">
    <div class="form-group">
      <label for="text">Govt ID:</label>
      <input type="text" class="form-control" id="id" placeholder="Enter Goverment ID (Aadhar)" name="id">
    </div>
    <div class="form-group">
      <label for="fname">First Name:</label>
      <input type="text" class="form-control" id="fname" placeholder="Enter First Name" name="fname">
    </div>
    <div class="form-group">
      <label for="lname">Last Name:</label>
      <input type="text" class="form-control" id="lname" placeholder="Enter Last Name" name="lname">
    </div>
    <div class="form-group">
      <label for="birthday">Date of Birth:</label>
	  <input type="date" id="dob" name ="dob">
    </div>
    <label>Gender:</label>
    <div class="radio">
	  <label><input type="radio" name="gender" value="Male">Male</label>
	</div>
	<div class="radio">
	  <label><input type="radio" name="gender" value="Female">Female</label>
	</div>
	<div class="radio">
	  <label><input type="radio" name="gender" value="other">Other</label>
	</div>
    <div class="form-group">
      <label for="contact">Contact:</label>
      <input type="text" class="form-control" id="contact" placeholder="Enter Contact" name="contact">
    </div>
    <div class="form-group">
    	 <label for="sel1">Select Street</label>
		  <select class="form-control" id="sel1" name="street">
		    <% 
		    	while(rs.next()) {
		    		%>
		    		<option><%=rs.getString(1) + " " + rs.getInt(2)%></option>
		    		<%
		    	}
		    dbCon.close();
		    %>
		  </select>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
    <a href="home.jsp">Home Page</a>
  </form>
  
</div>

</body>
</html>