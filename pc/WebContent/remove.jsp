<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int p=Integer.parseInt(request.getParameter("val"));
String table=session.getAttribute("key1").toString();
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/INFINITY","root","root");
	PreparedStatement ps=con.prepareStatement("delete from "+table+" where prod_id=?");
	
	ps.setInt(1,p);
	ps.executeUpdate();	
}
catch(Exception e)
{
	System.out.println(e);
}
request.getRequestDispatcher("final.jsp").forward(request, response);

%>
</body>
</html>