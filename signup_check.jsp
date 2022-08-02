<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>Sign Up</title>
</head>
<body>
	<c:if test="${not empty param.signup}">
		<sql:query var="userInfo">
			SELECT * FROM USER WHERE Username = ?
			<sql:param value="${param.username}" />
		</sql:query>
		<c:choose>
			<c:when test="${userInfo.rowCount == 0}">
				<sql:update>
					INSERT INTO USER (Name , Age, Gender, Email, Contact, Username, Password) VALUES (?, ?, ?, ?, ?, ?, ?)
					<sql:param value="${param.name}" />
					<sql:param value="${param.age}" />
					<sql:param value="${param.gender}" />
					<sql:param value="${param.email}" />
					<sql:param value="${param.contact}" />
					<sql:param value="${param.username}" />
					<sql:param value="${param.password}" />
				</sql:update>
				<c:set var="user_session" value="${param.username}" scope="session" />
				<c:redirect url="profile.jsp" />
			</c:when>
			<c:otherwise>
				<c:set var="usernameError" value="Username already exists! Please choose another." scope="request" />
				<jsp:forward page="signup.jsp" />
			</c:otherwise>
		</c:choose>
	</c:if>
</body>
</html>