package com.bit2015.mysite.dao.test;

import com.bit2015.mysite.dao.MemberDao;
import com.bit2015.mysite.vo.MemberVo;

public class MemberDaoTest {

	public static void main(String[] args)
	{
		//insert
		//inserTest();
		
		//select test
		//selectTest();
		
		//update
		update();
		selectTest();
	}
	
	public static void selectTest()
	{
		MemberDao dao = new MemberDao();
		MemberVo vo = null;
		vo = dao.get("suhwan2@gmail.com", "1234");
		System.out.println(vo);
		
	}
	public static void inserTest()
	{
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		vo.setName("이수환2");
		vo.setEmail("suhwan2@gmail.com");
		vo.setPassword("1234");
		vo.setGender("male");
		dao.insert(vo);
		
	}
	public static void update( )
	{
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		
		vo.setName("이수환2Test");
		vo.setEmail("suhwan2@gmail.com");
		vo.setPassword("1234");
		vo.setGender("male");
		vo.setNo(2L);
		
		dao.update(vo);
	}
	
}
