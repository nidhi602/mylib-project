<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>Your Library</title>
</head>
<body>
	<header><center><h1>Your Library</h1></center></header>
	<br><br>
	<center>
		<sql:setDataSource scope="application"
			driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost/library"
			user="root"
			password="admin" />
		<c:if test="${not empty param.login}">
			<sql:query var="userInfo">
				SELECT * FROM USER WHERE Username = ? AND Password = ?
				<sql:param value="${param.username}" />
				<sql:param value="${param.password}" />
			</sql:query>
			<c:choose>
				<c:when test="${userInfo.rowCount == 0}">
					<font color="red" size="5px">Invalid username and/or password!<br></font>
				</c:when>
				<c:otherwise>
					<c:set var="user_session" value="${param.username}" scope="session" />
					<c:redirect url="profile.jsp" />
				</c:otherwise>
			</c:choose>
		</c:if>
		<table>
			<form action="home.jsp" method="post">	
				<tr>
					<th class="login">Username</th>
					<td><input type="text" name="username" required></td>
				</tr>
				<tr>
					<th class="login">Password</th>
					<td><input type="password" name="password" required></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button name="login" value="login">Login</button>
					</td>
				</tr>
			</form>
			<form action="signup.jsp" method="post">
				<tr>
					<td></td>
					<td>
						<button name="signup" value="signup">Sign up</button>
					</td>
				</tr>
			</form>
		</table>
	</center>
</body>
</html>