package kr.co.bit.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.mini.member.dao.MemberDAO;
import kr.co.bit.mini.member.vo.MemberVO;

public class JoinController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		MemberVO memberVO = new MemberVO();
		MemberDAO dao = new MemberDAO();
		
		memberVO.setId(request.getParameter("id"));
		memberVO.setPassword(request.getParameter("password"));
		memberVO.setName(request.getParameter("name"));
		memberVO.setNickname(request.getParameter("nickname"));
		memberVO.setBirthDate(request.getParameter("birthDate"));
		memberVO.setPhone(request.getParameter("phone"));
		memberVO.setEmailId(request.getParameter("emailId"));
		memberVO.setEmailDomain(request.getParameter("emailDomain"));
		memberVO.setAddr(request.getParameter("addr"));
		
		//System.out.println(memberVO);
		
		dao.insertMember(memberVO);
		
		return "/jsp/member/join.jsp";
	}

}
