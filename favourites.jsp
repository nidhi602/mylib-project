<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>Favourite Books</title>
</head>
<body>
	<sql:query var="books">
		SELECT B.BookId, B.Title, B.Author, B.Genre FROM FAVOURITES F, BOOK B WHERE F.Uname = ? AND F.Id = B.BookId
		<sql:param value="${user_session}" />
	</sql:query>
	<header><center><h1>Your Library</h1></center></header><br><br>
	<section class="book_detail">
		<div id="book_links">View : &nbsp;<a href="all_books.jsp">All Books</a>&nbsp;&nbsp;<a href="profile.jsp">Your Profile</a></div>
		<br>
		<h3>Your Favourites :</h3>
		<table>
			<c:forEach items="${books.rows}" var="row">
				<tr>
					<th colspan="2">${row.Title}</th><td></td>
					<td rowspan="2">
						<form action="remove.jsp" method="post"> 
							<input type="hidden" name="bookId" value="${row.BookId}">
							<button name="removeBook" value="remove">Remove</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>By ${row.Author}</td>
					<td> Genre - ${row.Genre}</td><td></td>
				</tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
			</c:forEach>
		</table>
		<c:if test="${books.rowCount == 0}"><center>
			<br><font size="5px">You currently have no favourite book!</font>
		</center></c:if>
	</section>
</body>
</html>