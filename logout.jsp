<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<body>
	<c:if test="${not empty param.logout}" >
		<c:remove var="user_session" />
		<c:redirect url="home.jsp" />
	</c:if>
</body>
</html>