package com.bit2015.mysite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bit2015.mysite.vo.GuestBookVo;
import com.bit2015.mysite.vo.MemberVo;

import sun.dc.pr.PRError;




public class GuestBookDao {
	List<GuestBookVo> list = new ArrayList<GuestBookVo>();
	
	public List<GuestBookVo> getList()
	{
 
		try {
			//1.드라이브 연결
			Connection conn = getConnection();
			//2.sql 준비 
			String sql = "select * from GUESTBOOK ORDER BY reg_date";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				Long no = rs.getLong(1);
				String name = rs.getString(2);
				String password = rs.getString(3);
				String message = rs.getString(4);
				String regDate = rs.getString(5);
				
				GuestBookVo vo = new GuestBookVo(no, name, password, message, regDate);
				
				list.add(vo);
			}
			//4. 자원정리 
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql 오류 : "+ e);
		}
		return list; 
	}
	
	public void insert(GuestBookVo vo)
	{
		try {
			Connection conn = getConnection();
			
			String sql = "insert into guestbook values(guestbook_seq.nextval,?,?,?,SYSDATE)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getMessage());
			
			int result =  pstmt.executeUpdate();
			if(result < 0)
			{
				System.out.println("sql 오류 ");
			}
			else{
				System.out.println(" insert 성공 ");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql 오류 : "+ e);
		}
	}
	
	public void delete(String no, String password)
	{
		Long seqNo = Long.parseLong(no);
		Connection conn;
		try {
			
			conn = getConnection();
			
			String sql = "delete from guestbook where no = ? AND password = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, seqNo);
			pstmt.setString(2, password);
			
			int result =  pstmt.executeUpdate();
			
			if(result <= 0)
			{
				System.out.println("sql 오류 ");
			}
			else{
				System.out.println(" delete 성공 ");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql 오류 : "+ e);
		}
	}
	
	
	private Connection getConnection() throws SQLException
	{
		Connection connectoin = null;

		try {
			// 1.드라이버로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			// 2. 커넥션 만들기 (ORACLE DB)
			connectoin = DriverManager.getConnection(dbURL, "webdb",
					"webdb");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("드라이버 로딩 실패 : " + e);
		} 

		return connectoin;
	}
}
