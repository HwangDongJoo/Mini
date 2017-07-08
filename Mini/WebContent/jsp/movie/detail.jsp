<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
<link href="/Mini/starRating/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
 
optionally if you need to use a theme, then include the theme file as mentioned below
<link href="/Mini/starRating/themes/krajee-svg/theme.css" media="all" rel="stylesheet" type="text/css" />
 
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
<script src="/Mini/starRating/js/star-rating.js" type="text/javascript"></script>
 
optionally if you need to use a theme, then include the theme file as mentioned below
<script src="/Mini/starRating/themes/krajee-svg/theme.js"></script> -->
 
<!-- optionally if you need translation for your language then include locale file as mentioned below -->
<!-- <script src="/Mini/starRating/js/locales/{lang}.js"></script> -->


<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script>

$(document).on('ready', function(){
	
	 $('#input-3').rating({displayOnly: true, step: 0.5});
	
    $('#input-2').rating({
        step: 1,
        starCaptions: {2: '비추!!', 4: '시간 때우기용', 6: '그럭저럭 볼만해요', 8: '재밌네요', 10: '꼭 보세요 강추!!'},
        starCaptionClasses: {2: 'text-danger', 4: 'text-warning', 6: 'text-info', 8: 'text-primary', 10: 'text-success'}
    });
});

function sendPhoto(title){
	//alert($('#title').val());
	$.ajax({
		url : "https://apis.daum.net/contents/movie",
		type : "get",
		data : {
			//f049cbebc7cdc8cfb0828d6f23eda98a
			//afc8f3f26b1f2010beb23ff666fcbd2f
			//7f816929ac818e4e5c03b34a660323e3
			//ca04355fcc9192c0eee3f0cebf5c7144
			apikey : "3a1e2c6471827438a45bd064b214680e",
			q : title,
			result : 1,
			output : "json"
		},
		dataType : "jsonp",
		success : callback,
		error : function(){
			alert('에러');
		}
	});
}

function callback(jsonData){
	var itemList = jsonData.channel.item;
	for(var i =0; i<itemList.length; i++){
		var item = itemList[i];
		
		var title = item.title[0].content;
		var eng_title = item.eng_title[0].content;
		var thumb = item.thumbnail[0].content;
		var year = item.year[0].content;
		var director = item.director[0].content;
		var actor = item.actor[0].content;
		var more_actor = item.more_actor[0].link;
		var genre = item.genre[0].content;
		var story = item.story[0].content;
		var nation = item.nation[0].content;
		//var open_info = item.open_info;
		var trailer = item.trailer[0];
		var video = item.video;
		var photo1 = item.photo1.link;
		var photo2 = item.photo2[0];
		var photo3 = item.photo3[0];
		var photo4 = item.photo4[0];
		var photo5 = item.photo5[0];
		
/* 		console.log(item.actor[0]);
		console.log(item.more_actor[0]); */
		//console.log(item.write_grades);
		//console.log(item.open_info[1].content);
/* 		console.log(video);
		console.log(photo1); */
		
		//console.log(story[0]);
		/* console.log(thumb[0].content); */
		
		/* alert(title[0].content); */
		
		/* $('#searchResult').append('<hr/>'); */
		//$('#img').append("<img src='"+thumb+"'/>");
		$('.img-responsive').attr('src', thumb);
		$('#title').append(title);
		$('#eng_title').append(eng_title);
		$('#genre').append(genre);
		$('#release_date').prepend(item.open_info[0].content);
		$('#age').prepend(item.open_info[1].content);
		$('#director').append(director);
		$('#actor').append(actor);
		//$('#actor').append("<a href='"+more_actor+"'>더보기</a>");
		
		$('#story').append(story);
		//$('#info').append("<iframe src='"+photo1+"'></iframe>");
		
	}
}

function doAction(title,movieId){
	location.href="/Mini/review/reviewForm.do?type=list&title="+title+'&movieId='+movieId;
}

function checkLogin(){
	var obj = document.reviewForm;

	if(${ empty userVO }){
		alert("로그인이 필요합니다.");
		return false;
	}
	if(obj.rate.value == ""){
		alert("평점을 입력해주세요\n평점은 0점부터 10점까지 가능합니다.")
		obj.rate.focus();
		return false;
	}
	
	if(obj.content.value == ""){
		alert("리뷰 내용을 입력해주세요");
		obj.content.focus();
		return false;
	}

	var rateScore = obj.rate.value;
	
	rateScore = parseFloat(rateScore);
	console.log(rateScore);
	if(rateScore < 0 || rateScore > 10){
		alert("평점은 0점부터 10점까지 가능합니다.");
		return false;
	}
	
	return true;
}


</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topmenu.jsp"></jsp:include>
	</header>
	<section>
		<div class="container">
		<div class="container_wrap">
		<div class="content">
	
		<%-- <div id="info">
			<h2>영화 상세 페이지</h2>
			<table>
				<tr>
					<td rowspan="7" id="img"></td>
					<td id="title"></td>
				</tr>
				<tr>
					<td id="eng_title"></td>
				</tr>
				<tr>
					<td><input id="input-3" name="input-3" value="4" class="rating-loading"><!-- <input id="input-2" name="input-2" value="2.5" class="rating-loading"> --></td>
				</tr>
				<tr>
					<td id="genre"></td>
				</tr>
				<tr>
					<td id="open_info"> 개봉</td>
				</tr>
				<tr>
					<td id="director">(감독) </td>
				</tr>
				<tr>
					<td id="actor">(주연) </td>
				</tr>
			</table>
			<script>
				sendPhoto('${title}');
			</script>
			</div>
			
			리뷰 리스트
			
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
							<input type="hidden" value="${ param.title }" name="title">
							<input type="hidden" value="${ userVO.id }" name="memberId">
							<input type="hidden" value="${ param.movieId }" name="movieId">
						</td>
					</tr>
					<tr>
						<td><textarea rows="10%" cols="100" name="content"></textarea></td>						
					</tr>
					<tr>
						<td>
						<div style="float: left;">
						<input id="input-2" name="rate" value="2.5" class="rating-loading">
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
				<tr><td><a href="#" style="color: gray;">답글쓰기</a></td></tr>
				<c:if test="">
					<textarea rows="10%" cols="100" name="replyForm"></textarea>
				</c:if>
				<tr><td><hr ></td></tr>
			</c:forEach>
		</table>		
		</div> --%>
		
		<div class="movie_top">
      	         <div class="col-md-9 movie_box">
                        <div class="grid images_3_of_2">
                        	<div class="movie_image">
                                <img src="images/single.jpg" class="img-responsive" alt=""/>
                            </div>
                        </div>
                        <div class="desc1 span_3_of_2">
                        	<p class="movie_option" id="title"><strong>제목: </strong> </p>
                        	<p class="movie_option" id="eng_title"><strong>원제: </strong> </p>
                        	<p class="movie_option" id="genre"><strong>장르: </strong> </p>
                        	<p class="movie_option" id="release_date"> </p>
                        	<p class="movie_option" id="age"> </p>
                        	<p class="movie_option" id="director"><strong>감독: </strong> </p>
                        	<p class="movie_option" id="actor" ><strong>주연배우: </strong> </p>
                             
                         </div>
                        <div class="clearfix"> </div>
                        <p class="m_4" id="story"></p>
		                <form name="reviewForm" action="<%= request.getContextPath()%>/movie/review.do">
							<div class="to">
		                     	<input type="text" class="text" value="${ userVO.nickname }" readonly="readonly" >
		                     	<input type="hidden" value="${ param.title }" name="title">
								<input type="hidden" value="${ userVO.id }" name="memberId">
								<input type="hidden" value="${ param.movieId }" name="movieId">
							 	<input type="text" class="text" placeholder="평점" style="margin-left:3%;" name="rate">
							</div>
							<div class="text">
			                   <textarea placeholder="Message:" name="content"></textarea>
			                </div>
			                <div class="form-submit1">
					           <input type="submit" id="submit" value="Submit Your Message" onclick="return checkLogin()"><br>
					        </div>
							<div class="clearfix"></div>
                 		</form>
		                <div class="single">
		                <h1>Reviews</h1>
		                <ul class="single_list">
		                	<c:forEach items="${ reviewList }" var="reviewList" varStatus="loop">
					        <li>
					            <!-- <div class="preview"><a href="#"><img src="images/2.jpg" class="img-responsive" alt=""></a></div> -->
					            <div class="data">
					                <div class="title">${ reviewList.nickName }  /  ${ reviewList.writeDate }  /  ${ reviewList.rate }  /  <a href="#" >reply</a></div>
					                <p>${ reviewList.content }</p>
					            </div>
					            <%-- <div>
					            	<form>
					            	<div class="to">
				                     	<input type="hidden" class="text" value="${ userVO.nickname }" readonly="readonly" >
				                     	<input type="hidden" value="${ param.title }" name="title">
										<input type="hidden" value="${ userVO.id }" name="memberId">
										<input type="hidden" value="${ param.movieId }" name="movieId">
									 	<input type="hidden" class="text" placeholder="평점" style="margin-left:3%;" name="rate">
									</div>
					            	</form>
					            </div> --%>
					            <div class="clearfix"></div>
					        </li>
					        <c:forEach items="${ replyList }" var="replyList" varStatus="loop">
					        	<c:if test="${replyList.reviewId eq buttonId }">
					        		<li class="middle">
							            <div class="data-middle">
							                <div class="title">${ replyList.nickName }  /  ${ replyList.writeDate }</div>
							                <p>${ replyList.content }</p>
							            </div>
							            <div class="clearfix"></div>
						        	</li>
					        	</c:if>
					        	
					        </c:forEach>
					        </c:forEach>
					        
					    </ul>
                      </div>
                      </div>
                     
                      <div class="clearfix"> </div>
                  </div>
			
		</div>
		</div>
		</div>
	</section>
	<script>
		sendPhoto('${param.title}');
	</script>
	<footer>
		<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>