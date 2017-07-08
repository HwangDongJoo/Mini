<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 쓰기</title>
<script>


</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topmenu.jsp"></jsp:include>
	</header>
	<section>
		<form action="<%= request.getContextPath()%>/review/review.do">
			<div align="center">
				<table>
					<tr>
						<td>
							<h3>Review</h3>
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" value="${ userVO.id }" name="memberId">
							<input type="hidden" value="${ param.movieId }" name="movieId">
						</td>
					</tr>
					<tr>
						<td><textarea rows="10%" cols="100" name="content"></textarea></td>						
					</tr>
					<tr>
						<td>
						<div style="float: right;">
						<input type="text" name="rate" size="2">
						</div>
						</td>
					</tr>
					<tr>
						<td><div style="float: right"><input type="submit" value="작성" size="2"></div></td>
					</tr>
				</table>	
			</div>
		</form>
		<div align="center">
		<table width="700px">
			<c:forEach items="${ reviewList }" var="reviewList" varStatus="loop">
				<tr><td><span style="color:blue; font-size: 13pt;">${ reviewList.nickName }</span>&nbsp;님의 리뷰</td></tr>
				<tr><td style="color: gray; font-size: 12pt;"><span style="color: black;">${ reviewList.rate }</span>/10.0<br/></td></tr>
				<tr><td><br/>${ reviewList.content }</td></tr>
				<tr><td style="color: gray;"><br/>${ reviewList.writeDate }</td></tr>
				<%-- <tr><td><a href="#" style="color: gray;">답글쓰기</a></td></tr>
				<c:if test="">
					<textarea rows="10%" cols="100" name="replyForm"></textarea>
				</c:if> --%>
				<tr><td><hr ></td></tr>
			</c:forEach>
		</table>		
		</div>
	</section>
	<footer>
		<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>