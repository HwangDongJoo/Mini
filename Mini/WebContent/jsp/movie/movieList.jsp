<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie Time</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="/Mini/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="/Mini/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="/Mini/js/jquery-1.11.1.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script src="/Mini/js/responsiveslides.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- 
<script type="text/javascript" src="/Mini/js/jquery-1.11.1.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"> -->
<!-- <style>
img {
	width: 100px;
	height: 150px;
}

ul li div {
	float: right;
	margin-right: 500px;
}
</style> -->
<script>


function sendPhoto(title, index){
	console.log("obj : " + index);
	//alert($('#title').val());
	$.ajax({
		url : "https://apis.daum.net/contents/movie",
		type : "get",
		data : {
			//f049cbebc7cdc8cfb0828d6f23eda98a
			//afc8f3f26b1f2010beb23ff666fcbd2f
			//3a1e2c6471827438a45bd064b214680e
			//ca04355fcc9192c0eee3f0cebf5c7144
			apikey : "3a1e2c6471827438a45bd064b214680e",
			q : title,
			result : 1,
			output : "json",
			async : false
		},
		dataType : "jsonp",
		success : function(jsonData) {
			callback(jsonData, index);
		},
		error : function(){
			alert('에러');
		}
	});
}

var cnt = 0;
function callback(jsonData, index){
	var itemList = jsonData.channel.item;
	for(var i =0; i<itemList.length; i++){
		
		var item = itemList[i];
		
	
		var thumb = item.thumbnail;
		var title = item.title[0].content;
		var story = item.story;
		
		//console.log(thumb[0].content);
		/* console.log(thumb[0].content); */
		
		
		//console.log(i + ' : ' +  $('button').eq(i));
		//var node = document.createElement("img");
   		//node.src = thumb;
   		//document.getElementById(title).appendChild(node);
		//.eq(cnt++)
		
		
		$('.img-responsive').eq(index).attr('src', thumb[0].content);
		//console.log(document.getElementsByClassName('.img-responsive'));
	}
}

function popmodal(title,movieId) {
	$('div.modal').modal({
		remote : '/Mini/jsp/movie/layer.jsp?title='+encodeURIComponent(title)+'&movieId='+movieId
	});
}

function prevPage(){
	<c:choose>
	<c:when test="${ param.pageNo eq 1 }">
		alert("첫번째 페이지입니다.");
	</c:when>		
	<c:otherwise>
	location.href = "<%= request.getContextPath()%>/movie/movieList.do?pageNo=${ param.pageNo - 1}";</c:otherwise>
	</c:choose>
}

function nextPage(){
	<c:choose>
	<c:when test="${ param.pageNo eq 81 }">
		alert("마지막 페이지입니다.");
	</c:when>		
	<c:otherwise>
	location.href = "<%= request.getContextPath()%>/movie/movieList.do?pageNo=${ param.pageNo + 1}";</c:otherwise>
	</c:choose>
}

</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topmenu.jsp"></jsp:include>
	</header>
	<section>
	   	
		<%-- <br />
		<div align="center">
			<table id = "table">
				<c:forEach items="${ list }" var="movie" varStatus="status">
					<tr class="list">
					<tr class="list" id="${ status.index }">
					<button onclick="popmodal('${ movie.title }')" class="btn btn-default" id="popbutton" value="${ movie.title }">${ movie.title }</button>
					<!-- <span id="imgArea"></span> -->
					<tr>
						<td width="30%"><span id="imgArea"></span></td>
						<td>
							<div>
								&nbsp;<input type="hidden" id="title"
									value="${ movie.title }">
									<a id="showModal">${ movie.title }</a>
								<button class="btn btn-default" id="popbutton" value="${ movie.title }">${ movie.title }</button>
								<br /> <br />&nbsp;&nbsp;별점<br />
							</div>
						</td> 
					</tr>
					<td><button class="btn btn-default" id="popbutton" value="title" onclick="popmodal('${movie.title}','${movie.movieId}')">${movie.title}</button></td>
					<input id="title" type="hidden" value="${ movie.title }"/>
							<script>
								sendPhoto('${ movie.title }');
							</script>
							</tr>
				</c:forEach>
			</table>
		</div>
		<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
				</div>
			</div>
		</div> --%>
		
		   <div class="container">
      <div class="container_wrap">
         <div class="content">
            <h2 class="m_3">
               Now in the Movie
               </h2>

               <!--      MovieList      -->
               <div class="movie_top">
                  <div class="col-md-9 movie_box">
                     <!-- Movie variant with time -->
                     <div class="movie movie-test movie-test-dark movie-test-left">
                     <c:forEach items="${ list }" var="movie" varStatus="loop">
                        <div class="movie__images" >
                           <a href="javascript:popmodal('${ movie.title }', ${ movie.movieId })" class="movie-beta__link" >
                              <img alt=""
                              src="/Mini/images/1.jpg" class="img-responsive" alt="" />
                             <script>
                             	
                              	sendPhoto('${ movie.title }', '${loop.index}');
                              </script> 
                           </a>
                        </div>
                        <div class="movie__info">
                           <a href="javascript:popmodal('${ movie.title }', ${ movie.movieId })" class="movie__title">${ movie.title }</a>
                           <p class="movie__time">${ movie.titleEng }</p>
                           <p class="movie__option">
                              ${ movie.year } | ${ movie.status }<br/>
                              ${ movie.director }
                           </p>
                           <ul class="list_6">
                              <li>Rating : &nbsp;&nbsp;
                                 <p>
                                    <img src="/Mini/images/rating1.png" alt="">
                                 </p>
                              </li>
                              <div class="clearfix"></div>
                           </ul>
                        </div>
                        <div class="clearfix"></div>
                        
                        </c:forEach>
                     </div>
					<div align="center">
					<a href="javascript:prevPage()">◀</a>
					<c:choose>
					<c:when test="${ param.pageNo eq 81 }">
						<c:set var="beginPage" value="${ 81 }" scope="request"></c:set>
						<c:set var="endPage" value="${ 81 }" scope="request"></c:set>
					</c:when>
					<c:when test="${ param.pageNo mod 5 eq 1 }">
						<c:set var="beginPage" value="${ param.pageNo }" scope="page"></c:set>
						<c:set var="endPage" value="${ param.pageNo + 4 }" scope="page"></c:set> 
					</c:when>
					<c:when test="${ param.pageNo mod 5 eq 0 }">				
						<c:set var="beginPage" value="${ param.pageNo - 4 }" scope="request"></c:set>
						<c:set var="endPage" value="${ param.pageNo }" scope="request"></c:set> 	
					</c:when>			
					<c:otherwise>
						<c:set var="beginPage" value="${ param.pageNo - (param.pageNo mod 5 - 1) }" scope="request"></c:set>
						<c:set var="endPage" value="${ param.pageNo + (5 - param.pageNo mod 5) }" scope="request"></c:set> 
					</c:otherwise>
					</c:choose>
						<c:forEach begin="${ beginPage }" end="${ endPage }" var="pNum">
						<a href="<%= request.getContextPath()%>/movie/movieList.do?pageNo=${ pNum }">&nbsp;${ pNum }&nbsp;</a>|
					</c:forEach>
					<a href="javascript:nextPage()">▶</a>
					</div>
                     <div class="clearfix"></div>
                     <!-- Movie variant with time -->
                  </div>

                  <div class="clearfix"></div>
                  
               </div>
         </div>
      </div>
   </div>
		<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>