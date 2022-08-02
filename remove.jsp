<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>Remove From Favourites</title>
</head>
<body>
	<header><center><h1>Your Library</h1></center></header><br>
	<center>
	<c:if test="${not empty param.removeBook}">
		<sql:update>
	 		DELETE FROM FAVOURITES WHERE Uname = ? AND Id = ?
			<sql:param value="${user_session}" />
			<sql:param value="${param.bookId}" />
		</sql:update>
		<h3>Book removed from Favourites!</h3>
		<br><br><a href="favourites.jsp">Go Back</a>
	</c:if></center>
</body>
</html>