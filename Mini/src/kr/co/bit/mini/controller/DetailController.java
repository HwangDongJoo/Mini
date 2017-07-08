package kr.co.bit.mini.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.mini.reply.dao.ReplyDAO;
import kr.co.bit.mini.reply.vo.ReplyVO;
import kr.co.bit.mini.review.dao.ReviewDAO;
import kr.co.bit.mini.review.vo.ReviewVO;

public class DetailController implements Controller{

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		
		ReviewDAO reviewDAO = new ReviewDAO();
		ReplyDAO replyDAO = new ReplyDAO();
		double rate = reviewDAO.getMovieAvg(movieId);
		List<ReviewVO> reviewList = reviewDAO.selectByMovieId(movieId);
		
		List<ReplyVO> replyList = replyDAO.selectAll();
		request.setAttribute("replyList", replyList);		
		request.setAttribute("reviewList", reviewList);
		
		for(int i=0;i<reviewList.size();i++){
			System.out.println(reviewList.get(i));
		}
		
		String title = request.getParameter("title");
		request.setAttribute("title", title);
		request.setAttribute("rate", rate);
		return "/jsp/movie/detail.jsp";
	}

}
