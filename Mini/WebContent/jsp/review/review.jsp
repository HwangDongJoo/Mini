<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert('게시글을 저장하였습니다.');
/* 	alert('${param.title}'); */
	location.href = "<%= request.getContextPath()%>/movie/detail.do?movieId="+${param.movieId}+"&title="+'${param.title}';
	<%-- "<%= request.getContextPath()%>/movie/detail.do?movieId="+${param.movieId}+"&title="+${param.title} --%>
</script>