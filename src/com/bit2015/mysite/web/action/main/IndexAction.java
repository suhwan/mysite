package com.bit2015.mysite.web.action.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit2015.web.WebUtil;
import com.bit2015.web.action.Action;

public class IndexAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		WebUtil.forwarding(request, response, "/views/main/index.jsp");

	}

}
