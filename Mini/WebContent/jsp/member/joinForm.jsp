<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
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
		var obj = document.joinForm;
		if(isNull(obj.id, "아이디를 입력하세요")) return false;
		if(isNull(obj.password, "비밀번호를 입력하세요")) return false;
		if(isNull(obj.repassword, "비밀번호 확인를 입력하세요")) return false;
		if(isNull(obj.name, "이름을 입력하세요")) return false;
		if(isNull(obj.nickname, "닉네임을 입력하세요")) return false;
		if(isNull(obj.birthDate, "생년월일 입력하세요")) return false;
		if(isNull(obj.emailId, "이메일을 입력하세요")) return false;
		if(isNull(obj.emailDomain, "도메인을 선택해주세요")) return false;
		if(isNull(obj.addr, "주소를 입력하세요")) return false;
		if(obj.password.value != obj.repassword.value){
			alert("비밀번호가 잘못되었습니다.");
			obj.password.focus();
			return false;
		}
		
		return true;
	}
	
	function onCancle(){
		if(confirm("정말로 회원가입을 취소 하시겠습니까?")){
			location.href="/Mini";
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topmenu.jsp"></jsp:include>
	</header>
	<section >
		<!-- <div>
			<form name="joinForm" method="post" action="<%= request.getContextPath() %>/member/join.do" onsubmit="return checkForm()">
				<table border="1" width="100%">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id"/><span></span></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password"/></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="repassword"/></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" name="nickname"/></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="birthDate"/></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="phone"/></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="emailId"/>
							<select name="emailDomain">
								<option value="">도메인</option>
								<option value="@naver.com">네이버</option>
								<option value="@nate.com">네이트</option>
								<option value="@daum.net">다음</option>
								<option value="@gmail.com">구글</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="addr" size="100"/></td>
					</tr>
				</table>
				<br/><br/>
				<input type="submit" value="가입하기"/>
				<input type="button" value="취소하기" onclick="onCancle()"/>
			</form>
		</div> -->
		<div class="container">
		<div class="dontainer_wrap">
		<div class="content" >
      	     <div class="register">
		  	  <form name="joinForm" method="post" action="<%= request.getContextPath() %>/member/join.do" onsubmit="return checkForm()"> 
				 <div class="register-top-grid">
					<h3>Personal Information</h3>
					 <div>
						<span><label>ID</label></span>
						<input type="text" name="id">
					 </div>
					 <div>
						<span><label>비밀번호</label></span>
						<input type="password" name="password"> 
					 </div>
					 <div>
						 <span><label>비밀번호 확인</label></span>
						 <input type="password" name="repassword"> 
					 </div>
					 <div>
					 	<span><label>이름</label></span>
					 	<input type="text" name="name"/>
					 </div>
					 <div>
					 	<span><label>닉네임</label></span>
					 	<input type="text" name="nickname"/>
					 </div>
					 <div>
					 	<span><label>생년월일</label></span>
					 	<input type="text" name="birthDate" placeholder="ex)19910101"/>
					 </div>
					 <div>
					 	<span><label>전화번호</label></span>
					 	<input type="text" name="phone" placeholder="ex)01011111111"/> 
					 </div>
					 <div>
					 	<span><label>email account</label></span>
					 	<input type="text" name="emailId"/>
					 </div>
					 <div>
					 	<span><label>email domain</label></span>
					 	<select name="emailDomain">
								<option value="">도메인</option>
								<option value="@naver.com">네이버</option>
								<option value="@nate.com">네이트</option>
								<option value="@daum.net">다음</option>
								<option value="@gmail.com">구글</option>
							</select>
					 </div>
					 <div>
					 	<span><label>주소</label></span>
					 	<input type="text" name="addr"/>
					 </div>
					 <div class="register-but">
								<input type="submit" value="submit"/>
							 </div>
					 <div class="clearfix"> </div>
					   
					 </div>
				</form>
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