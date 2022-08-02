<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>All Books</title>
</head>
<body>
	<header><center><h1>Your Library</h1></center></header><br><br>
	<section class="book_detail">
		<form method="post" action="search.jsp">
			<input type="text" name="searchChar">&nbsp;
			<button name="search" value="search">Search</button>
		</form>
		<c:if test="${not empty param.search}">
		<h3>Available Books :</h3>
		<sql:query var="books">
			SELECT * FROM BOOK WHERE Title LIKE ?
			<sql:param value="${param.searchChar}%" />
		</sql:query>
		<table>
			<c:forEach items="${books.rows}" var="row">
				<tr>
					<th>${row.BookId}.</th>
					<th colspan="2">${row.Title}</th>
					<td rowspan="2">
						<form action="add.jsp" method="post"> 
							<input type="hidden" name="bookId" value="${row.BookId}">
							<button name="addBook" value="add">Add to Favourites</button>
						</form>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>By ${row.Author}</td>
					<td> Genre - ${row.Genre}</td>
				</tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
			</c:forEach></c:if>
			<form action="all_books.jsp" method="post">
				<tr>
					<td></td>
					<td>
						<button>Go Back</button>
					</td>
				</tr>
			</form>
		</table>
	</section>
</body>
</html>