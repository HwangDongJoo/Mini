package kr.co.bit.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.mini.review.dao.ReviewDAO;
import kr.co.bit.mini.review.vo.ReviewVO;

public class ReviewDeleteController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO reviewDAO = new ReviewDAO();
		ReviewVO reviewVO = new ReviewVO();
		
		request.setCharacterEncoding("utf-8");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String title = request.getParameter("title");
		request.setAttribute("title", title);
		request.setAttribute("movieId", movieId);
		
		reviewDAO.deleteReview(reviewId);
		
		return "/jsp/review/reviewDelete.jsp";
	}

}
