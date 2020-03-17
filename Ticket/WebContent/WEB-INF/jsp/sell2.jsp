<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>销售电影票</h1>
	<form action="${pageContext.request.contextPath }/manage/buyTicket">
		<c:forEach var="ticket" items="${TICKETS }" varStatus="rows">
			<c:if test="${ticket.sign == 0 }">
				${ticket.seat }号座位未销售
				<input type="checkbox" name="seats" value="${ticket.seat }" />
			</c:if>
			<c:if test="${ticket.sign == 1 }">
				<span style="color:#FF0000;">
					${ticket.seat }号座位已销售
					<input type="checkbox" disabled="disabled" />
				</span>
			</c:if>
			<c:if test="${rows.count % 5 == 0 }">
				<br />
			</c:if>
		</c:forEach>
		<br /> 
		<input type="submit" value="购买" />
	</form>
	<br />
	<form action="${pageContext.request.contextPath }/manage/clearTicket">
		<input type="submit" value="清场" />
	</form>
</body>
</html>