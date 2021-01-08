<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.text.*"%>
<jsp:useBean id="dbCon" class="bean.SQLConnectionBean"/>
<%
	dbCon.connect();
	String id = request.getParameter("id");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	
	String gender = request.getParameter("gender");
	String contact = request.getParameter("contact");
	
	String addr = request.getParameter("street");
	String street = addr.replaceAll("[^a-zA-Z ]", "");
	String str = addr;
	String house =  str.replaceAll("[^0-9]", "");
	out.println(street);
 
	//String path = "i:/dir" + id;  
	//MultipartRequest m = new MultipartRequest(request.getParameter("file"), path);  
	if(id != null && fname != null && lname != null && request.getParameter("dob") != null && gender!= null && contact != null) {
		java.util.Date dob = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dob"));
		java.sql.Date sqlDate_updated = new java.sql.Date(dob.getTime());
		
	String sql = "INSERT INTO people(id, fname, lname, dob, gender, contact) VALUES (?,?,?,?,?,?)";
	PreparedStatement ps = dbCon.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, fname);
	ps.setString(3, lname);
	ps.setDate(4, sqlDate_updated); 
	ps.setString(5, gender);
	ps.setInt(6, Integer.parseInt(contact));
	
	
	ps.executeUpdate();
	
	sql = "SELECT pincode FROM areas WHERE area = '" + session.getAttribute("area") + "'";
	ResultSet rs = dbCon.sqlQuery(sql);
	int pincode = 0;
	if(rs.next()) {
		pincode = rs.getInt(1);
	}
	
	sql = "INSERT INTO address(street, house, pincode, id) VALUES(?,?,?,?)";
	ps = dbCon.prepareStatement(sql);
	ps.setString(4, id);
	ps.setInt(3, pincode);
	ps.setString(1, street);
	ps.setString(2, house);
	ps.executeUpdate();
	
	response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", "home.jsp");
	} else {
		response.setStatus(response.SC_MOVED_TEMPORARILY);
	    response.setHeader("Location", "fill.jsp");
	}
	dbCon.close();
	/*
	out.println(id);
	out.println(fname);
	out.println(lname);
	out.println(dob);
	out.println(gender);
	out.println(contact);*/
	//Date date=Date.valueOf(dob);
	//out.println(date);
%>