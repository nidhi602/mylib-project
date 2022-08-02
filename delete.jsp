<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<body>
	<c:if test="${not empty param.delete}" >
		<sql:update>
			DELETE FROM USER WHERE Username = ?
			<sql:param value="${user_session}" />
		</sql:update>
		<c:remove var="user_session" />
		<c:redirect url="home.jsp" />
	</c:if>
</body>
</html>