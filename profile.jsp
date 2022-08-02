<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>Profile</title>
</head>
<body>
	<sql:query var="userInfo">
		SELECT * FROM USER WHERE Username = ?
		<sql:param value="${user_session}" />
	</sql:query>
	<header><center><h1>Your Library</h1></center></header>
	<br>
	<section>
		<h2>Welcome&nbsp;&nbsp;${user_session}!</h2><br>
		<div id="book_links">View : &nbsp;<a href="all_books.jsp">All Books</a>&nbsp;&nbsp;<a href="favourites.jsp">Your Favourites</a></div>
		<br>
		<div class="profile">
			<h3>Your Profile :</h3>
			<table><c:forEach items="${userInfo.rows}" var="row">
				<tr>
					<th>Name</th>
					<td>-</td>
					<td>${row.Name}</td>
				</tr>
				<tr>
					<th>Age</th>
					<td>-</td>
					<td>${row.Age}</td>
				</tr>
				<tr>
					<th>Gender</th>
					<td>-</td>
					<td>${row.Gender}</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td>-</td>
					<td>${row.Email}</td>
				</tr>
				<tr>
					<th>Contact</th>
					<td>-</td>
					<td>${row.Contact}</td>
				</tr>
			</table></c:forEach><table>
				<tr>
					<td><form action="update_profile.jsp" method="post">
						<button name="update" value="update">Update Profile</button>
					</form></td>
					<td><form action="change_pwd.jsp" method="post">
						<button name="change" value="change">Change Password</button>
					</form></td>
					<form action="delete.jsp" method="post" onsubmit="{return confirm('Are you sure you want to delete your account?')}">
					<td><button name="delete" value="delete">Delete Account</button>
					</form></td>
				</tr>
				<tr><form action="logout.jsp">
					<td><button name="logout" value="logout">Logout</button></td>
				</form></tr>
			</table>			
		</div>
	</section>
</body>
</html>