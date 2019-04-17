<html>
<head>
<link rel="stylesheet" href="loginstyle.css">
<title>Login Page</title>
</head>
<body class="bodylogin">
<div class="bodystyle1">
<h1 style="text-align:center; ">VEHICLE REGISTRATION SYSTEM</h1>
<br>
<form id="loginform"  action="Login" method="post">
<div class="textbox">
<i class="fa fa-user" aria-hidden="true"></i>
<label>Employee ID</label>
<br>
<input type="text" class="input" placeholder="Employee Id" name="empid" /> 
</div>
<br>
<div class="textbox">
<i class="fa fa-lock" aria-hidden="true"></i>
<label>Password</label>
<br>

<input type="password" class="input" placeholder="Password" name="password" />
</div>
<input type="submit" class="loginbutton" value="SIGN IN" />
</form>
</div>
<a href="Registration.jsp">New user register here</a>
<footer>
</footer>
</body>
</html>