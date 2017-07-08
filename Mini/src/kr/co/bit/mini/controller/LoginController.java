package kr.co.bit.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.mini.member.dao.MemberDAO;
import kr.co.bit.mini.member.vo.MemberVO;

public class LoginController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDAO dao = new MemberDAO();
		MemberVO userVO = dao.selectUser(id, password);
		
		String msg = "";
		String url = "";
		
		if(userVO.getId()==null){		//아이디 또는 비밀번호가 다를 때
			msg = "아이디 또는 비밀번호가 잘못되었습니다.";
			url = request.getContextPath() + "/member/loginForm.do";
		} else {						//로그인에 성공했을 때
			msg = userVO.getNickname() + "님 환영합니다!!!";
			url = request.getContextPath();
			
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/jsp/member/login.jsp";
	}

}
