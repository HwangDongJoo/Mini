package kr.co.bit.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.mini.movie.dao.MovieDAO;
import kr.co.bit.mini.reply.dao.ReplyDAO;
import kr.co.bit.mini.reply.vo.ReplyVO;

public class ReplyController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyVO replyVO = new ReplyVO();
		
		int replyId = replyDAO.selectNo();
		String memberId = request.getParameter("memberIdOfReply");
		String replyContent = request.getParameter("replyContent");
		int reviewIdOfReply = Integer.parseInt(request.getParameter("reviewIdOfReply"));
		int movieIdOfReply = Integer.parseInt(request.getParameter("movieIdOfReply"));
		
		MovieDAO movieDAO = new MovieDAO();
		String title = movieDAO.selectTitleById(movieIdOfReply);
		
		replyVO.setReplyId(replyId);
		replyVO.setMemberId(memberId);
		replyVO.setContent(replyContent);
		replyVO.setReviewId(reviewIdOfReply);
		replyVO.setMovieId(movieIdOfReply);		
		replyVO.setTitle(title);
		
		replyDAO.insertReply(replyVO);
	
		return "/jsp/reply/reply.jsp?movieId="+movieIdOfReply+"&title="+title;
	}

}
