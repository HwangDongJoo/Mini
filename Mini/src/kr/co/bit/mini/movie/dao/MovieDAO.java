package kr.co.bit.mini.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.mini.movie.vo.MovieVO;
import kr.co.bit.mini.util.ConnectionFactory;

public class MovieDAO {
	
	/**
	 * DB�� ��� ��ȭ ������ �����´�
	 * @return
	 */
	public List<MovieVO> selectAll(){
		List<MovieVO> list = new ArrayList<>();	//����Ʈ ����
		//sql��
		String sql = "select * from movie where rownum <= 20 order by 1 desc";
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			){
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				MovieVO movieVO = new MovieVO();
				movieVO.setMovieId(rs.getInt("movie_id"));
				movieVO.setTitle(rs.getString("title"));
				movieVO.setTitleEng(rs.getString("title_eng"));
				movieVO.setYear(rs.getInt("year"));
				movieVO.setGenre(rs.getString("genre"));
				movieVO.setStatus(rs.getString("status"));
				movieVO.setDirector(rs.getString("director"));
				movieVO.setCompany(rs.getString("company"));
				list.add(movieVO);
			}
			
			rs.close();		//resultset �ݾ���
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * ��ȭ�� ���������� �����ֱ� ����
	 * @param movieId
	 * @return
	 */
	public MovieVO selectOneMovie(int movieId){
		MovieVO movieVO = new MovieVO();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * from movie where movie_id = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			ResultSet rs = pstmt.executeQuery();
			
			movieVO.setMovieId(rs.getInt("movie_id"));
			movieVO.setTitle(rs.getString("title"));
			movieVO.setTitleEng(rs.getString("title_eng"));
			movieVO.setYear(rs.getInt("year"));
			movieVO.setGenre(rs.getString("genre"));
			movieVO.setStatus(rs.getString("status"));
			movieVO.setDirector(rs.getString("director"));
			movieVO.setCompany(rs.getString("company"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return movieVO;
	}
	
	/**
	 * �帣�� ��ȭ����Ʈ�� �����ֱ� ����
	 * 
	 * @param genre
	 * @return
	 */

	public List<MovieVO> selectByGenre(String genre) {
		List<MovieVO> list = new ArrayList<>(); // ����Ʈ ����

		StringBuilder sql = new StringBuilder();
		sql.append("select * from movie where genre like '%" + genre + "%'");
		System.out.println("sql is " + sql.toString());

		try {

			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieVO movieVO = new MovieVO();
				movieVO.setMovieId(rs.getInt("movie_id"));
				movieVO.setTitle(rs.getString("title"));
				movieVO.setTitleEng(rs.getString("title_eng"));
				movieVO.setYear(rs.getInt("year"));
				movieVO.setGenre(rs.getString("genre"));
				movieVO.setStatus(rs.getString("status"));
				movieVO.setDirector(rs.getString("director"));
				movieVO.setCompany(rs.getString("company"));
				list.add(movieVO);
			}

			rs.close(); // resultset �ݾ���

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;

	}
	
	/**
	 * ��ȭ����Ʈ�� ����¡ �Ͽ� �����ֱ� ����
	 * @param pageNo
	 * @return
	 */
	
	public List<MovieVO> selectByPageNo(int pageNo){
		
		List<MovieVO> list = new ArrayList<>();
		
		int begin = 5*pageNo -4;
		int end = begin + 4; 
		
		if(end>405){
			return null;
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select movie_id, title, title_eng, year, genre, status, director, company "
					+ "from (select rownum as rnum, A.movie_id, A.title, A.title_eng, A.year, A.genre, A.status, A.director, A.company "
					+ "from (select movie_id, title, title_eng, year, genre, status, director, company from movie order by movie_id) A where rownum<=?) X "
					+ "where X.rnum >=? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, begin);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieVO movieVO = new MovieVO();
				movieVO.setMovieId(rs.getInt("movie_id"));
				movieVO.setTitle(rs.getString("title"));
				movieVO.setTitleEng(rs.getString("title_eng"));
				movieVO.setYear(rs.getInt("year"));
				movieVO.setGenre(rs.getString("genre"));
				movieVO.setStatus(rs.getString("status"));
				movieVO.setDirector(rs.getString("director"));
				movieVO.setCompany(rs.getString("company"));
				list.add(movieVO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	/**
	 * 영화리스트를 페이징 하여 보여주기 위함
	 * @param pageNo
	 * @return
	 */
	
	public List<MovieVO> selectGenreByPageNo(String genre, int pageNo){
		
		List<MovieVO> list = new ArrayList<>();
		
		int begin = 5*pageNo -4;
		int end = begin + 4; 
		
		if(end>405){
			return null;
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select movie_id, title, title_eng, year, genre, status, director, company "
					+ "from (select rownum as rnum, A.movie_id, A.title, A.title_eng, A.year, A.genre, A.status, A.director, A.company "
					+ "from (select movie_id, title, title_eng, year, genre, status, director, company from movie"+" where genre like '%" + genre + "%'"+" order by movie_id) A where rownum<=?) X "
					+ "where X.rnum >=?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, begin);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieVO movieVO = new MovieVO();
				movieVO.setMovieId(rs.getInt("movie_id"));
				movieVO.setTitle(rs.getString("title"));
				movieVO.setTitleEng(rs.getString("title_eng"));
				movieVO.setYear(rs.getInt("year"));
				movieVO.setGenre(rs.getString("genre"));
				movieVO.setStatus(rs.getString("status"));
				movieVO.setDirector(rs.getString("director"));
				movieVO.setCompany(rs.getString("company"));
				list.add(movieVO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	// movieId�� movieTitle ����

		public String selectTitleById(int movieId) {

			String movieTitle = null;
			StringBuilder sql = new StringBuilder();
			sql.append("select title from movie where movie_id = ?");

			try {

				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, movieId);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					movieTitle = rs.getString(1);
				}

				rs.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return movieTitle;
		}
		
		public int cntGenre(String genre){
			
			int pageNo = 0;
			int cnt = 0;

			StringBuilder sql = new StringBuilder();
			sql.append("select count(*) from movie where genre like '%" + genre + "%'");
			Connection conn = null;
			PreparedStatement pstmt = null;
		
			try {
				conn = new ConnectionFactory().getConnection();
				pstmt = conn.prepareStatement(sql.toString());
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()){
					cnt = rs.getInt(1);
				}
				
				rs.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			System.out.println("cnt : " + cnt);
			
			if((cnt) % 5 == 0){
				pageNo = (cnt/5);
			}
			else{
				pageNo = (cnt/5)+1;
			}
			
			return pageNo;
			
		}
		
		public int cntPage(){
			
			int pageNo = 0;
			int cnt = 0;

			StringBuilder sql = new StringBuilder();
			sql.append("select count(*) from movie");
			Connection conn = null;
			PreparedStatement pstmt = null;
		
			try {
				conn = new ConnectionFactory().getConnection();
				pstmt = conn.prepareStatement(sql.toString());
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()){
					cnt = rs.getInt(1);
				}
				
				rs.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			System.out.println("cnt : " + cnt);
			
			if((cnt) % 5 == 0){
				pageNo = (cnt/5);
			}
			else{
				pageNo = (cnt/5)+1;
			}
			
			return pageNo;
			
		}
		
}
