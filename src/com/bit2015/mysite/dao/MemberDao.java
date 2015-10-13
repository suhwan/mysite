package com.bit2015.mysite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bit2015.mysite.vo.MemberVo;

public class MemberDao {
	
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
	
	public void insert(MemberVo vo)
	{
		Connection conn = null;
		
		try {
			conn = getConnection();
			
			String sql = "insert into MEMBER (NO, NAME, EMAIL, PASSWORD, GENDER) values(member_no_seq.nextval,?,?,?,?)"; 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getGender());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			System.out.println("sql error : " + e);
		}
		
		
	}
	
	public MemberVo get(String email,String password)
	{
		MemberVo vo = null;
		Connection conn = null;
		try {
			conn = getConnection();
			
			String sql = "select no,name,email from member where email=? AND password=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				vo = new MemberVo();
				vo.setNo(rs.getLong(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			System.out.println("SQL Error: " + e);
		}		
		
		return vo;
		
	}
	
	public MemberVo get(Long no)
	{
		MemberVo vo = null;
		
		return vo;
		
	}
	
	public void update(MemberVo vo )
	{
		Connection conn = null;
		
		try {
			conn = getConnection();
			
			String sql = "update member set name =?,email=? , password=?, gender=? where   no= ?"; 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getGender());
			pstmt.setLong(5, vo.getNo());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			System.out.println("sql error : " + e);
		}
	}
}
