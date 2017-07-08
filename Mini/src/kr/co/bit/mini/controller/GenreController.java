package kr.co.bit.mini.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.mini.movie.dao.MovieDAO;
import kr.co.bit.mini.movie.vo.MovieVO;

public class GenreController implements Controller {

	@Override
	public String HandleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String genre = request.getParameter("genre");
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		MovieDAO dao = new MovieDAO();
		
		List<MovieVO> genreList = dao.selectGenreByPageNo(genre, pageNo);
		
		request.setAttribute("genreList", genreList);
		
		System.out.println("genreList : " + genreList.size());
		
		for(int i = 0; i<genreList.size(); i++){
			System.out.println(genreList.get(i).getMovieId());
		}
		
		//System.out.println(genre);
		
		//pageNo �� pNum �ʿ�
		
		int pNum = dao.cntGenre(genre);
		
		System.out.println(pNum);
		
		return "/jsp/movie/genreList.jsp?genre="+genre+"&pageNo="+pageNo+"&pNum="+pNum;
	}

}
