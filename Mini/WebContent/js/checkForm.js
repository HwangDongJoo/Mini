/**
 * 회원가입, 로그인 form에 빈칸이 존재하는 검사하는 javascript
 */

function isNull(obj, msg){
	if(obj.value == ""){
		alert(msg);
		obj.focus();
		return true;
	}
	return false;
}