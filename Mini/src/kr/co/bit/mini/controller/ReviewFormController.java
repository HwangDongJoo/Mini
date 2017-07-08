package kr.co.bit.mini.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.mini.review.dao.ReviewDAO;
import kr.co.bit.mini.review.vo.ReviewVO;

public class ReviewFormController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		
		ReviewDAO reviewDAO = new ReviewDAO();
		List<ReviewVO> reviewList = reviewDAO.selectByMovieId(movieId);
		
		request.setAttribute("reviewList", reviewList);		
		
		//원래는 return "/jsp/movie/reviewForm.jsp?movieId = " + movieId;
		return  "/jsp/review/reviewForm.jsp";
	}

}
