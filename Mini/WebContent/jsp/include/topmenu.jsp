<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<div class="header_top">
		    <div class="col-sm-3 logo"><a href="<%= request.getContextPath()%>"><img src="/Mini/images/logo.png" alt=""/></a></div>
		    <div class="col-sm-6 nav">
			  <ul>
				 <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="Home"><a href="<%= request.getContextPath() %>"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="movie"><a href="<%= request.getContextPath() %>/movie/movieList.do?pageNo=1&pNum=81"> </a> </span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="video"><a href="<%= request.getContextPath() %>/jsp/movie/test.jsp"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="game"><a href="<%= request.getContextPath() %>/movie/movieList.do?pageNo=1&pNum=81"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="tv"><a href="<%= request.getContextPath() %>/movie/movieList.do?pageNo=1&pNum=81"> </a></span></li>
				 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="more"><a href="<%= request.getContextPath() %>/movie/movieList.do?pageNo=1&pNum=81"> </a></span></li>
			 </ul>
			</div>
			<div class="col-sm-3 header_right">
			   <ul class="header_right_box">
			   <c:if test="${ empty userVO }">
			   		<li>
			   			<p><a href="<%= request.getContextPath() %>/member/loginForm.do">로그인</a></p>
			   		</li>
			   </c:if>
			   <c:if test="${ not empty userVO }">
			   		<li>
			   			<p><a href="<%= request.getContextPath()%>/member/myReview.do?memberId=${ userVO.id }">${ userVO.nickname }</a></p>
			   		</li>
			   		<li>
			   			<p><a href="<%= request.getContextPath() %>/member/logout.do ">로그아웃</a></p>
			   		</li>
			   </c:if>
				 <div class="clearfix"> </div>
			   </ul>
			</div>
			<div class="clearfix"> </div>
	      </div>

	<!--  
	<div align="center">
		<table width="80%" border="1" >
			<tr>
				<td rowspan="2"><img src="/Mini/images/logo3.png" width="100px"/></td>
				<td colspan="5">
					<c:if test="${ not empty userVO }">
						[${ userVO.nickname }님 환영합니다.]
					</c:if>
				</td>
			</tr>
			<tr>
				
				<td><a href="<%= request.getContextPath() %>">홈</a></td>
				<td>현재 상영작</td>
				<td><a href="<%= request.getContextPath() %>/movie/movieList.do">박스오피스</a></td>
				<c:if test="${ empty userVO }">
					<td><a href="<%= request.getContextPath() %>/member/loginForm.do">로그인</a></td>
					<td><a href="<%= request.getContextPath() %>/member/joinForm.do">회원가입</a></td>
				</c:if>
				<c:if test="${ not empty userVO }">
					<td>나의 리뷰</td>
					<td><a href="<%= request.getContextPath() %>/member/logout.do">로그아웃</a></td>
				</c:if>
			</tr>
		</table>
	</div>
	-->