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
 <form action="${pageContext.request.contextPath }/ticket/buyTicket.do">
	<table border="2px">
	<c:forEach var="list" items="${LIST }" varStatus="a">
		<tr>
			<td>第${a.count}排</td>
		 <c:forEach var="li" items="${list }" varStatus="ad"  >
			<c:if test="${li.sign == 0}">
				<td><label> 第${ad.count}号座位未售<input type="checkbox" name="ids" value="${li.seat }"></label></td>
			</c:if>
			<c:if test="${li.sign == 1}">
				<td bgcolor="#FF0000">本座位已售</td>
			</c:if>
		 </c:forEach>
		</tr>
	</c:forEach>
	</table><br/>
	<input type="submit" value="购买">
	</form><br/>
	<input type="button" value="清场" onClick="location.href='${pageContext.request.contextPath }/ticket/clearSeat.do'"/>
</body>
</html>