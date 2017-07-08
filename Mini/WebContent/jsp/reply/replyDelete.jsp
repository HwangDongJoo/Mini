<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("답글이 삭제되었습니다.");
	location.href = "<%= request.getContextPath()%>/movie/detail.do?movieId="+${param.movieId}+"&title="+'${param.title}';
</script>