package kr.co.bit.mini.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.mini.movie.dao.MovieDAO;
import kr.co.bit.mini.movie.vo.MovieVO;

public class MovieListController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		MovieDAO dao = new MovieDAO();
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		List<MovieVO> list = dao.selectByPageNo(pageNo);
		System.out.println("조회된 pageNo : " + pageNo);
		
		for(int i = 0; i<list.size(); i++){
			System.out.println(list.get(i));
		}
		
		request.setAttribute("list", list);
		
		return "/jsp/movie/movieList.jsp?pageNo="+pageNo;
	}

}
