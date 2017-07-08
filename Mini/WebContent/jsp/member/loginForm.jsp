<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<link href="/Mini/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="/Mini/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="/Mini/js/jquery-1.11.1.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script src="/Mini/js/responsiveslides.min.js"></script>
<script src="/Mini/js/checkForm.js"></script>
<script>
	function checkForm(){
		var obj = document.loginForm;
		if(isNull(obj.id, "아이디를 입력하세요.")) return false;
		if(isNull(obj.password, "비밀번호를 입력하세요.")) return false;
		return true;
	}
</script>
<body>
	<header>
		<jsp:include page="/jsp/include/topmenu.jsp"></jsp:include>
	</header>
	<section>
		<!--
		<div class="register">
		<form class="" name="loginForm" method="post" onsubmit="return checkForm()" action="<%= request.getContextPath() %>/member/login.do">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password"/></td>
				</tr>
			</table><br/>
			<input type="submit" value="로그인"/>
			
		</form>
		</div>
		-->
		<div class="container">
		<div class="container_wrap">
		<div class="content">
      	     <div class="register">
			   <div class="col-md-6 login-left">
			  	 <h3>처음 오신 분</h3>
				 <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
				 <a class="acount-btn" href="<%= request.getContextPath() %>/member/joinForm.do">Create an Account</a>
			   </div>
			   <div class="col-md-6 login-right">
			  	<h3>기존 회원</h3>
				<p>If you have an account with us, please log in.</p>
				<form name="loginForm" method="post" action="<%= request.getContextPath() %>/member/login.do" onsubmit="return checkForm()">
				  <div>
					<span>ID<label>*</label></span>
					<input type="text" name="id"> 
				  </div>
				  <div>
					<span>Password<label>*</label></span>
					<input type="password" name="password"> 
				  </div>
				  <a class="forgot" href="#">Forgot Your Password?</a>
				  <input type="submit" value="로그인" >
			    </form>
			   </div>	
			   <div class="clearfix"> </div>
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