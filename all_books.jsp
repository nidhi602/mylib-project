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
			<sql:query var="books">
				SELECT * FROM BOOK
			</sql:query>
			<header>
				<center>
					<h1>Your Library</h1>
				</center>
			</header><br><br>
			<section class="book_detail">
				<div id="book_links">View : &nbsp;<a href="search.jsp">Search</a>&nbsp;&nbsp;<a
						href="favourites.jsp">Your Favourites</a>&nbsp;&nbsp;<a href="profile.jsp">Your Profile</a>
				</div>
				<br>
				<h3>All Available Books :</h3>
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
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</c:forEach>
				</table>
			</section>
		</body>

		</html>