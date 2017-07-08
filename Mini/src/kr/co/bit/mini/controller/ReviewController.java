package kr.co.bit.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.mini.member.dao.MemberDAO;
import kr.co.bit.mini.member.vo.MemberVO;
import kr.co.bit.mini.review.dao.ReviewDAO;
import kr.co.bit.mini.review.vo.ReviewVO;

public class ReviewController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ReviewDAO reviewDAO = new ReviewDAO();
		ReviewVO reviewVO = new ReviewVO();
		
		request.setCharacterEncoding("utf-8");
		
		
		int reviewId = reviewDAO.selectNo();
		String memberId = request.getParameter("memberId");
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String content = request.getParameter("content");
		double rate = Integer.parseInt(request.getParameter("rate"));
		
		reviewVO.setReviewId(reviewId);
		reviewVO.setMemberId(memberId);
		reviewVO.setMovieId(movieId);
		reviewVO.setContent(content);
		reviewVO.setRate(rate);
						
		System.out.println(reviewVO);
		
		reviewDAO.insertReview(reviewVO);
		
		return "/jsp/review/review.jsp";
	}

}
