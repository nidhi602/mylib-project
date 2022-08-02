<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>Sign Up</title>
	<script type="text/javascript" src="signup_JS_validate.js"></script>
</head>
<body>
	<header><center><h1>Your Library</h1></center></header>
	<main><center>
		<form action="signup_check.jsp" method="post">
			<table>
				<tr>
					<th>Name</th>
					<td>
						<div style="color: red" id="errorMsg1"></div>
						<input type="text" name="name" onblur="validate(this.name, 'errorMsg1')" onfocus="haveFocus(this.name, 'errorMsg1')" value="${param.name}" required>
					</td>
				</tr>
				<tr>
					<th>Age</th>
					<td>
						<div style="color: red" id="errorMsg2"></div>
						<input type="number" name="age" onblur="validate(this.name, 'errorMsg2')" onfocus="haveFocus(this.name, 'errorMsg2')" value="${param.age}" required>
					</td>
				</tr>
				<tr>
					<th>Gender</th>
					<td><input type="radio" name="gender" value="M" checked>Male<br>
						<input type="radio" name="gender" value="F">Female</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td>
						<div style="color: red" id="errorMsg3"></div>
						<input type="text" name="email" onblur="validate(this.name, 'errorMsg3')" onfocus="haveFocus(this.name, 'errorMsg3')" value="${param.email}" required>
					</td>
				</tr>
				<tr>
					<th>Contact</th>
					<td>
						<div style="color: red" id="errorMsg4"></div>
						<input type="text" name="contact" onblur="validate(this.name, 'errorMsg4')" onfocus="haveFocus(this.name, 'errorMsg4')" value="${param.contact}" required>
					</td>
				</tr>
				<tr>
					<th>Username</th>
					<td>
						<div style="color: red" id="errorMsg5">${usernameError}</div>
						<input type="text" name="username" onblur="validate(this.name, 'errorMsg5')" onfocus="haveFocus(this.name, 'errorMsg5')" required>
					</td>
				</tr>
				<tr>
					<th>Password</th>
					<td>
						<div style="color: red" id="errorMsg6"></div>
						<input type="password" name="password" onblur="validate(this.name, 'errorMsg6')" onfocus="haveFocus(this.name, 'errorMsg6')" required>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button name="signup" value="signup">Sign up</button>
					</td>
				</tr>
			</table>
		</form></center>
	</main>
</body>
</html>