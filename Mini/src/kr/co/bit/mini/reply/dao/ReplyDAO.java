package kr.co.bit.mini.reply.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.mini.reply.vo.ReplyVO;
import kr.co.bit.mini.util.ConnectionFactory;

public class ReplyDAO {
	// C

		public void insertReply(ReplyVO replyVO) {

			Connection conn = null;
			PreparedStatement pstmt = null;
			StringBuilder sql = new StringBuilder();

			sql.append("insert into reply(reply_id, member_id, content, review_id) ");
			sql.append("values (?, ?, ?, ?)");

			try {

				conn = new ConnectionFactory().getConnection();
				pstmt = conn.prepareStatement(sql.toString());

				pstmt.setInt(1, replyVO.getReplyId());
				pstmt.setString(2, replyVO.getMemberId());
				pstmt.setString(3, replyVO.getContent());
				pstmt.setInt(4, replyVO.getReviewId());
				pstmt.executeQuery();

			} catch (Exception e) {
				// TODO: handle exception
			}

		}
		
		public int selectNo() {

			String sql = "select seq_reply_id.nextval from dual";
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

		// r	
		
		public List<ReplyVO> selectAll() {

			List<ReplyVO> list = new ArrayList<>();
			Connection conn = null;
			PreparedStatement pstmt = null;

			StringBuilder sql = new StringBuilder();

			sql.append("select nickname, write_date, content, review_id, member_id, reply_id "
					+ "from reply left outer join member on reply.member_id = member.id "
					+ "order by reply_id desc");

			try {

				conn = new ConnectionFactory().getConnection();
				pstmt = conn.prepareStatement(sql.toString());
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					ReplyVO replyVO = new ReplyVO();

					replyVO.setNickName(rs.getString(1));
					replyVO.setWriteDate(rs.getString(2));
					replyVO.setContent(rs.getString(3));
					replyVO.setReviewId(rs.getInt(4));
					replyVO.setMemberId(rs.getString(5));
					replyVO.setReplyId(rs.getInt(6));
					

					list.add(replyVO);
				}

			} catch (Exception e) {
				// TODO: handle exception
			}

			return list;
		}
		
		//D
		
		public void deleteReply(int replyId){
			StringBuilder sql = new StringBuilder();
			sql.append("delete from reply where reply_id = ?");
			
			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = new ConnectionFactory().getConnection();
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, replyId);
				pstmt.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			} 		
		}	
}
