package kr.co.bit.mini.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.mini.review.dao.ReviewDAO;
import kr.co.bit.mini.review.vo.ReviewVO;

public class MyReviewController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");		
		String memberId = request.getParameter("memberId");		
		ReviewDAO reviewDAO = new ReviewDAO();
		List<ReviewVO> myReviewList = reviewDAO.selectByMemberId(memberId);		
		request.setAttribute("myReviewList", myReviewList);
		
		System.out.println("----------myReviewList----------------");
		for(int i = 0; i<myReviewList.size(); i++){
			System.out.println(myReviewList.get(i).getTitle());
		}
		return "/jsp/member/myReview.jsp";
	}
}
