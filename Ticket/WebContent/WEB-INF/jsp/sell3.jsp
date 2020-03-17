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
<form action="${pageContext.request.contextPath }/ticketyTicket" method="post">
	<table border="1">
		<c:forEach begin="0" end="4" varStatus="rows">
			<tr>
				<td>${rows.count  }排</td>
				<c:forEach begin="0" end="4" varStatus="cols" >
					<c:set var="seat" value="${rows.index * 5 + cols.index }"></c:set>
					<c:if test="${tickets[seat].sign == 0 }">
						<td><label>${cols.count }号座未销售<input type="checkbox" name="seats" value="${tickets[seat].seat }"/></label></td>
					</c:if>
					<c:if test="${tickets[seat].sign == 1 }">
						<td bgcolor="gray">${cols.count }号座已售</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table><br>
	<input type="submit" value="购票" /><br><br>
	<input type="button" value="清场" onclick="window.location.href='${pageContext.request.contextPath}/ticket/clearSeats'"/>
</form>
</body>
</html>