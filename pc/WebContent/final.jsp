<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cognizant.user.bean.*" %>
    <%@ page import="com.cognizant.userDao.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.cognizant.productDao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td {
  border: 1px solid black;
  text-align: center;
}
table{
width: 90%;

border-color: gray;
}
table th{
background-color: #0597C6;
color:white;
border-color: gray;
}
table td{
border-color: gray;
}
button{
width: 3cm;
 height: 0.5cm;
  border-radius: 30pt;
color:white;
background-color:#0597C6;
cursor:pointer; }
button:hover{
opacity:0.6;
}
</style>
</head>
<body>
<%
UserDao ud=new UserDao();
ProductDao pd=new ProductDao();
List<User> list=new ArrayList<User>();ArrayList<Integer> list2=new ArrayList<Integer>();ArrayList<Integer> list1=new ArrayList<Integer>();
list=ud.getUser();
for(User u:list)
{
	if(session.getAttribute("key1").equals(u.getUsername()))
	{
Enumeration<String> e=request.getParameterNames();
while(e.hasMoreElements())
{   
	String v=e.nextElement();
	if(v.equalsIgnoreCase("select1")){
	String [] str=request.getParameterValues(v);
	
for(int i=0; i<str.length; i++)
{
list1.add(Integer.parseInt(str[i]));	
}
}
	if(v.equalsIgnoreCase("quantity")){
		String [] str=request.getParameterValues(v);
		
	for(int i=0; i<str.length; i++)
	{
	list2.add(Integer.parseInt(str[i]));	
	}
	}
}
u.setPid(list1);
u.setRequired(list2);
}
	}

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/INFINITY","root","root");
	for(int i=0;i<list1.size();i++)
	{PreparedStatement ps=con.prepareStatement("insert into "+ session.getAttribute("key1")+ "(prod_id,req) values("+list1.get(i)+","+list2.get(i)+")" );
     if(ps.executeUpdate()>0)
     {
    	 pd.reduceStock(list1.get(i),list2.get(i));
    	 response.sendRedirect("final.jsp");
     }
	}
}

catch(Exception e)
{
	if(e.getClass().getCanonicalName().equals("com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"))
	{try
	   {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/INFINITY","root","root");
		for(int i=0;i<list1.size();i++)
		{System.out.println(session.getAttribute("key1"));
		 int a=0;
		 int b=0;
		 PreparedStatement ps1=con.prepareStatement("Select req from "+session.getAttribute("key1")+" where prod_id=?");
		 System.out.println("ok");
		 ps1.setInt(1,list1.get(i));
		 ResultSet rs=ps1.executeQuery();
		 if(rs.next())
		 {
		  a=rs.getInt("req");
		  b=list2.get(i)+a;
		 }
	     PreparedStatement ps=con.prepareStatement("UPDATE "+session.getAttribute("key1")+" set req=? where prod_id=?" );
	     ps.setInt(1,b);
	     ps.setInt(2,list1.get(i));
	     if(ps.executeUpdate()>0)
	     {
	    	 pd.reduceStock(list1.get(i),list2.get(i));
	    	 response.sendRedirect("final.jsp");
	     }
		}
	}
	catch(Exception e1)
	{
		System.out.println(e1);
	}
	}
}
	%>"
<table>
<%
String uname=session.getAttribute("key1").toString();
try{
Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/INFINITY","root","root");
	PreparedStatement ps=con.prepareStatement("select product.name,product.prod_id,product.instock,"+uname+".req from product INNER JOIN "+uname+" ON product.prod_id="+uname+".prod_id");
    ResultSet rs=ps.executeQuery();
    out.print("<table>");
    out.println("<tr><th>PRODUCT NAME</th><th>PRODUCT ID</th><th>INSTOCK</th><th>REQUIRED</th></tr>");
    while(rs.next())
    {
    	out.print("<tr><td>"+rs.getString("name")+"</td><td>"+rs.getInt("prod_id")+"</td><td>"+rs.getInt("instock")+"</td><td>"+rs.getInt("req")+"</td><td><a href='remove.jsp?val="+rs.getInt("prod_id")+"'><button>REMOVE</button></a></td></tr>");
    	
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</table>


</body>
</html>