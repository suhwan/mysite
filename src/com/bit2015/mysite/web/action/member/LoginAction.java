package com.bit2015.mysite.web.action.member;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import com.bit2015.mysite.dao.MemberDao;
import com.bit2015.mysite.vo.MemberVo;
import com.bit2015.web.WebUtil;
import com.bit2015.web.action.Action;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//HttpSession
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			MemberDao dao = new MemberDao();
			MemberVo vo = dao.get(email,password);
			
			if(vo == null)
			{
				WebUtil.redirect(response, "mysite/member?a=loginform");
				return;
			}
			
			// 로그인처리 
			HttpSession session =  request.getSession(true);
			session.setAttribute("authUser", vo);
			
			//mian redirection
			WebUtil.redirect(response, "/mysite/main");
	}

}
