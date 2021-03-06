package com.Nine.Sky_lnn.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Nine.Sky_lnn.bean.Dlxxb;
import com.Nine.Sky_lnn.bean.Yhxxb;
import com.Nine.Sky_lnn.dao.DlxxbDao;
import com.Nine.Sky_lnn.service.DlxxbService;
import com.Nine.Sky_lnn.service.YhxxbService;
import com.Nine.Sky_lnn.util.EncryptTool;

/**
 * Servlet implementation class XgGrxxServlet
 */
@WebServlet("/XgGrxxServlet")
public class XgGrxxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private YhxxbService yhxxbService=new YhxxbService();
    private DlxxbService dlxxbService=new DlxxbService();
    private EncryptTool encryptTool=new EncryptTool();
	public void	service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m=request.getParameter("m");
		if("Xg".equals(m)) {
			Xg(request, response);
		}else if ("Xgmm".equals(m)) {
			Xgmm(request, response);
		}
	     }

	private void Xgmm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Dlxxb dlxxb=new Dlxxb();
		String xmm=encryptTool.getEncStr(request.getParameter("xmm"));
		String ymm=encryptTool.getEncStr(request.getParameter("ymm"));
		System.out.println(ymm);
		String zh = request.getParameter("zh");
		dlxxb.setZh(zh);
		dlxxb.setPwd(ymm);
		dlxxb=dlxxbService.select(dlxxb);
		if (dlxxb!=null) {
			dlxxb.setPwd(xmm);
			boolean a = dlxxbService.updateMm(dlxxb);
			System.out.println(a);
			response.sendRedirect(request.getContextPath() + "/XxglServlet?m=listAll&flag=first");
		}else {
			System.out.println("XgGrxx没成");
			response.sendRedirect(request.getContextPath() + "/XxglServlet?m=listAll&flag=first");
		}
		
	}

	private void Xg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Yhxxb yhxxb=new Yhxxb();
		String grbh=request.getParameter("grbh");
		String yhm = request.getParameter("yhm");
		String xb = request.getParameter("xb");
		String lxfs = request.getParameter("lxfs");
		System.out.println(xb);
		yhxxb.setYhm(yhm);
		yhxxb.setXb(xb);
		yhxxb.setLxfs(lxfs);
		System.out.println(yhxxb);
		yhxxbService.update(yhxxb);
		Yhxxb yhxxb2 = yhxxbService.selectById(grbh);
		request.getSession().setAttribute("yhxx", yhxxb2);
		response.sendRedirect(request.getContextPath() + "/XxglServlet?m=listAll&flag=first");
	}

}
