<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>Update Profile</title>
</head>
<body>
<jsp:useBean id="user" class="beans.UserBean" >
	<jsp:setProperty name="user" property="*" />
</jsp:useBean>

<header><center><h1>Your Library</h1></center></header>
<br>
<section>
	<h2>Welcome&nbsp;&nbsp;${user_session}!</h2>
	<div class="profile">
		<h3>Update Your Profile :</h3>
		<form action="update_profile.jsp" method="post">
			<input type="hidden" name="submitted" value="true" />
			<table>
				<c:if test="${param.submitted && user.nameValid == 'false'}">
					<tr><td></td>
						<td>
							<font color="red">Name can only contain alphabets.</font>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>Name</th>
					<td>
						<input type="text" name="name" value="${user.name}" required>
					</td>
				</tr>

				<c:if test="${param.submitted && user.ageValid == false}">
					<tr><td></td>
						<td>
							<font color="red">Please enter a valid age between 1 and 120.</font>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>Age</th>
					<td>
						<input type="number" name="age" value="${user.age}" required>
					</td>
				</tr>
				<tr>
					<th>Gender</th>
					<c:choose>
						<c:when test="${param.gender == 'F'}">
							<td><input type="radio" name="gender" value="M">Male<br>
								<input type="radio" name="gender" value="F" checked>Female
							</td>
						</c:when>
						<c:otherwise>
							<td><input type="radio" name="gender" value="M" checked>Male<br>
								<input type="radio" name="gender" value="F">Female
							</td>
						</c:otherwise>
					</c:choose>
				</tr>

				<c:if test="${param.submitted && user.emailValid == false}">
					<tr><td></td>
						<td>
							<font color="red">Invalid email address!</font>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>E-mail</th>
					<td>
						<input type="text" name="email" value="${user.email}" required>
					</td>
				</tr>

				<c:if test="${param.submitted && user.contactValid == false}">
					<tr><td></td>
						<td>
							<font color="red">Please enter a valid contact number.</font>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>Contact</th>
					<td>
						<input type="text" name="contact" value="${user.contact}" required>
					</td>
				</tr>
			</table><table>
				<tr>
					<td><button name="update" value="update">Update Profile</button></td>
					<td><a href="profile.jsp">Go Back</a></td>
				</tr>
			</table>
		</form>			
	</div>
</section>

<c:if test="${param.submitted && user.allValid == true}">
Came here!
	<font color="green">Profile updated successfully!</font>
	<sql:update>
		UPDATE USER SET Name = ?, Age = ?, Gender = ?, Email = ?, Contact = ? WHERE Username = ?
		<sql:param value="${user.name}" />
		<sql:param value="${user.age}" />
		<sql:param value="${param.gender}" />
		<sql:param value="${user.email}" />
		<sql:param value="${user.contact}" />
		<sql:param value="${user_session}" />
	</sql:update>
	<c:redirect url="profile.jsp" />
</c:if>
</body>
</html>