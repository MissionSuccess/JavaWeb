package com.Nine.Sky_lnn.control;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Nine.Sky_lnn.util.EmailUtil;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		
		String m = request.getParameter("m");
		
		switch (m) {
		case "updateAdminEmail":
			updateAdminEmail(request,response);
			break;
		case "updateUserEmail":
			updateUserEmail(request, response);
			break;
		}
	}

	private void updateUserEmail(HttpServletRequest request, HttpServletResponse response) {
//		String zh=request.getParameter("zh");
//		EmailUtil emailUtil = new EmailUtil(zh);
//		String yzm=emailUtil.sendnum();
//		boolean ret=emailUtil.sendMa();
//		System.out.println(zh);
//		System.out.println(yzm);
//		System.out.println(ret);
	}

	private void updateAdminEmail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String zh=request.getParameter("zhxx");
		String yhm=request.getParameter("yhmxx");
		String xb=request.getParameter("xbxx");
		String lxfs=request.getParameter("lxfsxx");
		String zcsj=request.getParameter("zcsjxx");
		EmailUtil emailUtil = new EmailUtil(zh);
		String adyzm=emailUtil.sendnum();
		boolean ret=emailUtil.sendMa();
		System.out.println(zh);
		System.out.println(adyzm);
		System.out.println(ret);
		request.getRequestDispatcher("/pageAdmin/UpdateUser.jsp?zh="+zh+"&yhm="+yhm+"&xb="+xb+"&lxfs="+lxfs+"&zcsj="+zcsj+"&adyzm="+adyzm).forward(request, response);
	}
}
