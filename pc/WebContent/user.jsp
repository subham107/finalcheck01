<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cognizant.productBean.*" %>
    <%@ page import="com.cognizant.productDao.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>vendor home page</title>
<script>
  
/*function sendInfo()  
{   
	var add1=document.myform1.add.disabled;
	document.writeln(add1);
	if(add1.equals("disabled"))
		{alert("No items selected");
		return false;
		}
	else 
		return true;
		
}*/

function check(current)
{
	//document.writeln(event.srcElement.id)
	var b=event.srcElement.id;
	//var c=b.toString();
	//var d=c.conacat("hello");
	//document.writeln(b);
	var txtP= document.getElementById("txt".concat(b));
	var add1=document.getElementById("add");
	//document.writeln("txt".concat(b));
	add1.disabled=current.checked ? false : true;
     txtP.disabled = current.checked ? false : true;
    if (!add1.disabled) {
        add1.focus();
      // document.writeln(txtPassportNumber);
    }
    if (!txtP.disabled) {
        txtP.focus();
      // document.writeln(txtPassportNumber);
    }


	
	}

</script>
<style>
table, th, td {
  border: 1px solid black;
  text-align: center;
}
table{
width: 100%;

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

input[type="submit"]{
color:white;
background-color:#0597C6;
cursor:pointer; 
outline:none;
}
input:hover{
opacity:0.6;
}
input [type="checkbox"]{
background-color: yellow;
color: black;}
button{
color:white;
background-color:#0597C6;
cursor:pointer; }
button:hover{
opacity:0.6;
}
</style>
</head>
<body>

<form name="myform1"   action="final.jsp" >
<%
ProductDao pd1=new ProductDao();
List<Product> list=new ArrayList<Product>();
list=pd1.getProduct();
out.println("<table>");
out.println("<tr><th>Select</th><th>Product Name</th><th>Brand</th><th>Category</th><th>Product ID</th><th>Price</th><th>Stock</th><th>Required</th></tr>");
int i=0;
for(Product p1:list)
{    String k="txt".concat(p1.getName());
	out.println("<tr><td><input  type='checkbox' name='select1' id='"+p1.getName()+"' value='"+p1.getProd_id()+"' onclick='check(this)'></td><td>"+p1.getName()+"</td><td>"+p1.getBrand()+"</td><td>"+p1.getCategory()+"</td><td>"+p1.getProd_id()+"</td><td>"+p1.getPrice()+"</td><td>"+p1.getInstock()+"</td><td><input type='number' id='"+k+"' name='quantity' disabled='disabled' value='0' min='1' max='"+p1.getInstock()+"'></td><td style='border:0;'><a href='detail.jsp?val="+p1.getProd_id()+"'><button type='button' style='width: 3cm; height: 1cm; border-radius: 30pt;'><p style='font-family:Arial Black;'>VIEW</p></button></a></td>");
    //i++;
   // out.println(i);
}
	out.println("</table>");

%>
<input type="submit" id="add" style="width: 5cm; height: 2cm; border-radius: 30pt; margin-left: 40%;" disabled="disabled" value="ADD TO CART">

</form>
</body>
</html>