<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Texturina:wght@800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="mylib_styles.css">
	<title>Change Password</title>
	<script type="text/javascript">
		function validate(callingField, errorP)
		{
			var form = document.forms[0];
			var ele = form.elements[callingField];
			var errP = document.getElementById(errorP);
			var bttn = form.change;
			ele.value = ele.value.trim();
			if(ele.value == "")
			{
				errP.innerHTML = "This is a mandatory field!";
				ele.style.border = "1px solid red";
				bttn.disabled = true;
				return;
			}
			else if(callingField == "newPwd1")
			{
				var patt = /^([\w@*#]{8,15})$/;
				if(!patt.test(ele.value))
				{
					errP.innerHTML = "Password must be 8-15 characters long and must only contain a-z, A-Z, 0-9, @, *, #, _ characters.";
					ele.style.border = "1px solid red";
					ele.value = "";
					bttn.disabled = true;
				}
			}
		}
		function haveFocus(callingField, errorP)
		{
			var form = document.forms[0];
			var ele = form.elements[callingField];
			var errP = document.getElementById(errorP);
			errP.innerHTML = "";
			ele.style.border = "none";
			var bttn = form.change;
			bttn.disabled = false;
		}
	</script>
</head>
<body>
	<header><center><h1>Your Library</h1></center></header>
	<br><br>
	<c:if test="${not empty param.change}">
	<center>
		<table width="600">
			<form action="change_pwd.jsp" method="post">
				<input type="hidden" name="submitted" value="true" />	
				<tr>
					<th class="login">Old Password</th>
					<td><input type="password" name="oldPwd" required></td>
				</tr>
				<tr>
					<th class="login">New Password</th>
					<td>
						<div style="color: red" id="errorMsg1"></div>
						<input type="password" name="newPwd1" onblur="validate(this.name, 'errorMsg1')" onfocus="haveFocus(this.name, 'errorMsg1')" required>
					</td>
				</tr>
				<tr>
					<th class="login">Confirm Password</th>
					<td><input type="password" name="newPwd2" required></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button name="change" value="change">Change</button>
					</td>
				</tr>
			</form>
			<form action="profile.jsp" method="post">
				<tr>
					<td></td>
					<td>
						<button>Go Back</button>
					</td>
				</tr>
			</form>
		</table><br><br>
		<c:if test="${not empty param.submitted}">
			<sql:query var="userInfo">
				SELECT Password FROM USER WHERE Username = ?
				<sql:param value="${user_session}" />
			</sql:query>
			<c:forEach items="${userInfo.rows}"	var="row">
				<c:choose>
					<c:when test="${param.newPwd1 != param.newPwd2}">
						<font color="red" size="4px">Password Confirmation Failed!</font>
					</c:when>
					<c:when test="${param.oldPwd != row.Password}">
						<font color="red" size="4px">Wrong Old Password!</font>
					</c:when>
					<c:otherwise>
						<sql:update>
							UPDATE USER SET Password = ? WHERE Username = ?
							<sql:param value="${param.newPwd1}" />
							<sql:param value="${user_session}" />
						</sql:update>
						<font color="green" size="5px">Password succesfully changed!</font>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
	</center>
	</c:if>
</body>
</html>