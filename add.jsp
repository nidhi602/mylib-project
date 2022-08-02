<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>Add To Favourites</title>
</head>
<body>
	<header><center><h1>Your Library</h1></center></header><br>
	<center>
	<c:if test="${not empty param.addBook}" >
		<sql:query var="books">
			SELECT * FROM FAVOURITES WHERE Uname = ? AND Id = ?
			<sql:param value="${user_session}" />
			<sql:param value="${param.bookId}" />
		</sql:query>
		<c:choose>
			<c:when test="${books.rowCount == 0}">
				<sql:update>
			 		INSERT INTO FAVOURITES (Uname, ID) VALUES (?, ?)
					<sql:param value="${user_session}" />
					<sql:param value="${param.bookId}" />
				</sql:update>
				<h3>Book added to Favourites!</h3>
			</c:when>
			<c:otherwise>
				<h3>Book already exists in Favourites!</h3>
			</c:otherwise>
		</c:choose>
		<br><br><a href="all_books.jsp">Go Back</a>
	</c:if></center>
</body>
</html>