package kr.co.bit.mini.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.bit.mini.member.vo.MemberVO;
import kr.co.bit.mini.util.ConnectionFactory;

public class MemberDAO {
	/**
	 * 회원 가입 할 때 DB에 insert하기 위한 메소드
	 * @param memberVO
	 */
	public void insertMember(MemberVO memberVO){
		//sql문
		StringBuilder sql = new StringBuilder();
		sql.append("insert into member(id, password, name, nickname, birth_date, phone, email_id, email_domain, addr) ");
		sql.append(" values (?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			
			System.out.println(memberVO);
			
			pstmt.setString(1, memberVO.getId());
			pstmt.setString(2, memberVO.getPassword());
			pstmt.setString(3, memberVO.getName());
			pstmt.setString(4, memberVO.getNickname());
			pstmt.setString(5, memberVO.getBirthDate());
			pstmt.setString(6, memberVO.getPhone());
			pstmt.setString(7, memberVO.getEmailId());
			pstmt.setString(8, memberVO.getEmailDomain());
			pstmt.setString(9, memberVO.getAddr());
			
			pstmt.executeQuery();
			
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 로그인을 위해 아이디와 비밀번호로 회원을 조회한 후 조회한 내용을 MemberVO에 담는다.
	 * 담은 내용은 login.jsp에서 Session영역으로 전송할 것임
	 * @param id
	 * @param password
	 * @return
	 */
	public MemberVO selectUser(String id, String password){
		MemberVO userVO = new MemberVO();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, name, nickname, to_char(birth_date, 'yyyy-mm-dd') birth_date, ");
		sql.append(" to_char(join_date, 'yyyy-mm-dd') join_date, phone, email_id, email_domain, addr ");
		sql.append(" from member ");
		sql.append(" where id = ? and password = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){	//값은 1개만 있어야 하기 때문에 if문을 사용함
				userVO.setId(rs.getString("id"));
				userVO.setName(rs.getString("name"));
				userVO.setNickname(rs.getString("nickname"));
				userVO.setBirthDate(rs.getString("birth_date"));
				userVO.setJoinDate(rs.getString("join_date"));
				userVO.setPhone(rs.getString("phone"));
				userVO.setEmailId(rs.getString("email_id"));
				userVO.setEmailDomain(rs.getString("email_domain"));
				userVO.setAddr(rs.getString("addr"));
			}
			
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(userVO);
		
		return userVO;
	}
}
