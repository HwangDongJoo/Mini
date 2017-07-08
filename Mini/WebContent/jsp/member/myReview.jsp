<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Review</title>
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
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
   function sendPhoto(title) {
      //alert($('#title').val());
      $.ajax({
         url : "https://apis.daum.net/contents/movie",
         type : "get",
         data : {
            //f049cbebc7cdc8cfb0828d6f23eda98a
            //afc8f3f26b1f2010beb23ff666fcbd2f
            apikey : "ca04355fcc9192c0eee3f0cebf5c7144",
            q : title,
            result : 1,
            output : "json"
         },
         dataType : "jsonp",
         success : callback,
         error : function() {
            alert('에러');
         }
      });
   }

   function callback(jsonData) {
      var itemList = jsonData.channel.item;
         var item = itemList[0];
         var thumb = item.thumbnail;
         var title = item.title[0].content;
         var node = document.createElement("img");
         node.src = thumb[0].content;
         node.width = 220;
         node.height = 316;
         document.getElementById(title).appendChild(node);
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
      <div align="center">
         <h3>My Review</h3>
   		<br/>
         <table width="700px">         
            <c:forEach items="${ myReviewList }" var="reviewList"
               varStatus="loop">
               <script>sendPhoto('${ reviewList.title }');</script>   
               <tr>
               	<td id="${ reviewList.title }" rowspan="4" width="20%"></td>
                  <td><span style="color: blue; font-size: 13pt; width: 20%">${ reviewList.nickName }</span>&nbsp;님의
                     리뷰</td>
               </tr>
               <tr>
                  <td style="color: gray; font-size: 12pt;"><span
                     style="color: black;">${ reviewList.rate }</span>/10.0<br /></td>
               </tr>
               <tr>
                  <td><br />${ reviewList.content }</td>
               </tr>
               <tr>
                  <td style="color: gray;"><br />${ reviewList.writeDate }</td>
               </tr>
               <tr>
                  <td colspan="2"><hr></td>
               </tr>
            </c:forEach>
         </table>
      </div>
      </div>
     </div>
     </div>
   </section>
   <footer>
      <jsp:include page="/jsp/include/footer.jsp"></jsp:include>
   </footer>
</body>
</html>