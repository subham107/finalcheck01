<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cognizant.userDao.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.cognizant.user.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function noback() {
	window.history.forward();
}
setTimeout("noback()", 10);
</script>
<style>
input[type=text]{
border-radius: 20pt;
height: 0.8cm;
width: 7cm;
}
body{
background-color: #0597C6;}
.switch{
display: inline;
}
.top{
text-align:center;
font-size: xx-large;
text-decoration: blink;
 }
.image{
width: 3.3cm;
border-radius:30%;
position: absolute; 
top: 5%;
left: 2%;
bottom: 10%;
height: 3.9cm;
}
.title{
font-family: "Castellar";
font-size: medium;
}
.contain{
color:white;
position :absolute;
right:0%;
top: 10%;
}
button{
width:3cm;
background-color:white;
color:black;
border-radius: 30pt;}
button:hover{
opacity:0.6;
cursor: pointer;
}
</style>
</head>
<body>
<div class="top">
<img src="wolf.png" alt="logo" class="image">
<h1 style="color:white; margin-bottom: 5%;  text-align: center;">GRIZZLY</h1>
<%
UserDao ud=new UserDao();
List<User> list=new ArrayList<User>();
list=ud.getUser();
out.println("<div class='contain'>");
for(User u:list)
{
	if((u.getUsername().equals(session.getAttribute("key1")))&&(u.getPassword().equals(session.getAttribute("key2"))))
	{out.println("Welcome : "+u.getName()+"<br>");
	}
}
%>
<div class="switch">
<a href='logout.jsp' target='_top'><button type='button' style='width: 30%; margin-top: 8%;' onclick="noback()">Logout</button></a>
<a href='addview.html' target="main1"><button type='button'style='width: 30%; margin-top: 8%;' >Home</button></a> 
</div>
<br>
<form action="search.jsp" target='main1'>
<input type="text" name="s1" placeholder=" Search product by name/id/Category">
<button type="submit" style="width:1.5cm; height: 1cm"><img src="search.png" align="middle" style="border-radius: 50pt; width: 0.8cm; height:0.8cm;"></button>
</form>
</div>

<div class="title">

</div>
</body>
</html>