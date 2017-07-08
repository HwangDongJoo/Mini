package kr.co.bit.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.mini.reply.dao.ReplyDAO;
import kr.co.bit.mini.reply.vo.ReplyVO;

public class ReplyDeleteController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyVO replyVO = new ReplyVO();
		
		request.setCharacterEncoding("utf-8");
		int replyId = Integer.parseInt(request.getParameter("replyId"));
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String title = request.getParameter("title");		
		replyDAO.deleteReply(replyId);	
		
	
		return "/jsp/reply/replyDelete.jsp?movieId="+movieId+"&title="+title;
	}

}
