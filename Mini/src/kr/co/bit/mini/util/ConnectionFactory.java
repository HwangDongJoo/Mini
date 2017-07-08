package kr.co.bit.mini.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionFactory {
	/**
	 * DB�� �����ϱ� ���� �޼ҵ�
	 * @return
	 */
	public Connection getConnection(){
		Connection conn = null;
		
		//�׽�Ʈ�� ���� localhost�� �־��� �ݵ�� ip�� ��ü�ؾ���
		String url = "jdbc:oracle:thin:@192.168.1.25:1521:xe";
		String id = "SCOTT";
		String password = "TIGER";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	/**
	 * ������ �����ϴ� �޼ҵ�
	 * @param conn
	 * @param stmt
	 */
	public void disConnection(Connection conn, Statement stmt){
		try {
			if(stmt != null) stmt.close();
			if(conn != null) stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
