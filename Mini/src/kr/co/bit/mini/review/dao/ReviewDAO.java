package kr.co.bit.mini.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.mini.movie.dao.MovieDAO;
import kr.co.bit.mini.review.vo.ReviewVO;
import kr.co.bit.mini.util.ConnectionFactory;

public class ReviewDAO {

	// C

	public void insertReview(ReviewVO reviewVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into review(review_id, member_id, movie_id, content, rate)");
		sql.append(" values(?, ?, ?, ?, ?)");
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, reviewVO.getReviewId());
			pstmt.setString(2, reviewVO.getMemberId());
			pstmt.setInt(3, reviewVO.getMovieId());
			pstmt.setString(4, reviewVO.getContent());
			pstmt.setDouble(5, reviewVO.getRate());
			pstmt.executeQuery();
			System.out.println(reviewVO);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// R	
	public List<ReviewVO> selectByMovieId(int movieId){
		
		List<ReviewVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select member_id, review_id, nickname, rate, content, write_date");
		sql.append(" from review left outer join member on member_id = member.id");
		sql.append(" where movie_id = ?");
		sql.append(" order by review_id desc");
		
		System.out.println(movieId);
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, movieId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String member_id = rs.getString("member_id");
				int review_id = rs.getInt("review_id");
				String nickname = rs.getString("nickname");
				int rate = rs.getInt("rate");
				String content = rs.getString("content");
				String write_date = rs.getString("write_date");

				ReviewVO review = new ReviewVO();
				review.setMemberId(member_id);
				review.setReviewId(review_id);
				review.setNickName(nickname);
				review.setRate(rate);
				review.setContent(content);
				review.setWriteDate(write_date);

				list.add(review);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
		 
	}
	
public List<ReviewVO> selectByMemberId(String memberId){
		
		List<ReviewVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select review_id, nickname, rate, content, write_date, movie_id");
		sql.append(" from review left outer join member on member_id = member.id");
		sql.append(" where member_id = ?");
		sql.append(" order by review_id desc");
		
		System.out.println(memberId);
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, memberId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int review_id = rs.getInt("review_id");
				String nickname = rs.getString("nickname");
				int rate = rs.getInt("rate");
				String content = rs.getString("content");
				String write_date = rs.getString("write_date");
				int movieId = rs.getInt("movie_id");

				ReviewVO review = new ReviewVO();
				review.setReviewId(review_id);
				review.setNickName(nickname);
				review.setRate(rate);
				review.setContent(content);
				review.setWriteDate(write_date);
				review.setMemberId(memberId);
				MovieDAO movieDAO = new MovieDAO();
				String title = movieDAO.selectTitleById(movieId);
				review.setTitle(title);
				System.out.println("movie_id" + movieId + " title : " + title);

				list.add(review);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
		 
	}

	// U

	// D

	

	// U

	

	// D
	public void deleteReview(int reviewId) {
		String sql = "delete from review where review_id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewId);
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	// review_no ����
		public int selectNo() {

			String sql = "select seq_review_id.nextval from dual";
			int no = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = new ConnectionFactory().getConnection();
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				no = rs.getInt(1);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return no;
		}	
		
		
		public double getMovieAvg(int movieId) {
		      String sql = "select avg(rate) from review where movie_id= ?";
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      
		      double avg = 0;

		      try {
		         conn = new ConnectionFactory().getConnection();
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, movieId);
		         ResultSet rs = pstmt.executeQuery();
		         rs.next();
		         avg = rs.getDouble(1);
		      } catch (Exception e) {
		         e.printStackTrace();
		      } 
		      avg = Math.round(avg*10)/10.0;
		      return avg;
		   }
}
