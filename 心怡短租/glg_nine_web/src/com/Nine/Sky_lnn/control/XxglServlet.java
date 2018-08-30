package com.Nine.Sky_lnn.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Nine.Sky_lnn.bean.Fjxxb;
import com.Nine.Sky_lnn.common.Pager;
import com.Nine.Sky_lnn.service.FjxxbService;
import com.Nine.Sky_lnn.util.ImgUploadUtil;
import com.Nine.Sky_lnn.util.LogUtil;

@WebServlet("/XxglServlet")
public class XxglServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private FjxxbService fjxxService = new FjxxbService();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String m = request.getParameter("m");
		if("add".equals(m)) {
			add(request,response);
		}else if("addPic".equals(m)){
			addPic(request,response);
		}else if("delete".equals(m)) {
			delete(request,response);
		}else if("update".equals(m)) {
			update(request,response);
		}else if("listOne".equals(m)) {
			listOne(request,response);
		}else if("listAll".equals(m)) {
			listAll(request,response);
		}
	}
      
	/**
	 * 上传房间图片
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void addPic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理房间图片
		String fjtp = ImgUploadUtil.uploadImage(request, "c:/upload");
		switch(fjtp) {
		case "0":
			System.out.println("图片上传失败！");
			return ;
		case "1":
			System.out.println("上传的不是图片！");
			return ;
		case "2":
			System.out.println("图片太大，最多只能为4M！");
			return ;
		}
		request.getSession().setAttribute("fjtp", fjtp);
		System.out.println("图片地址为："+request.getSession().getAttribute("fjtp"));
	}

	/**
	 * 发布信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*获取传递来的信息*/
		String fyjs = request.getParameter("fyjs");
		String jq1 = request.getParameter("jq");
		//String fjtp = request.getParameter("fjtp"); //房间图片最后处理
		String cs = request.getParameter("cs");
		String jtdz = request.getParameter("jtdz");
		String lxfs = request.getParameter("lxfs");
		String kzrs1 = request.getParameter("kzrs");
		String clx = request.getParameter("clx");
		String jdsj = request.getParameter("jdsj");
		String zsrzts = request.getParameter("zsrzts");
		String zdrzts = request.getParameter("zdrzts");
		String rzsj = request.getParameter("rzsj"); 
		String tfsj = request.getParameter("tfsj"); 
		String sfsm = request.getParameter("sfsm");
		int jq = 200, kzrs = 1;
		try {
			//截取接待时间
			jdsj = jdsj.substring(0,5) + "-" + jdsj.substring(11,16);
			/*处理价钱、可住人数为数值类型*/
			jq = Integer.parseInt(jq1);
			kzrs = Integer.parseInt(kzrs1);
		}catch(Exception e) {
			request.getRequestDispatcher("/pageAdmin/admin_fbxx.jsp?status=failed").forward(request, response);
			return ;
		}
		/*获取房间有的功能*/
		String[] fjfn = request.getParameterValues("func");
		String[] params = new String[10];
		for(int i = 0; i < params.length; i++) {
			params[i] = "0";
		}
		if(null != fjfn) {
			for (String s : fjfn) {
				switch(s) {
					case "wx":
						params[0] = "1";
						break;
					case "kt":
						params[1] = "1";
						break;
					case "bx":
						params[2] = "1";
						break;
					case "xyj":
						params[3] = "1";
						break;
					case "ds":
						params[4] = "1";
						break;
					case "rs":
						params[5] = "1";
						break;
					case "dn":
						params[6] = "1";
						break;
					case "zc":
						params[7] = "1";
						break;
					case "zf":
						params[8] = "1";
						break;
					case "wsj":
						params[9] = "1";
						break;
				}
			}
		}
		
		String wx = params[0];
		String kt = params[1];
		String bx = params[2];
		String xyj = params[3];
		String ds = params[4];
		String rs = params[5];
		String dn = params[6];
		String zc = params[7];
		String zf = params[8];
		String wsj = params[9];
		
		//处理房间图片
		String fjtp = null;
		Object obj = request.getSession().getAttribute("fjtp");
		if(null != obj) {
			fjtp = (String)obj;
		}else {
			LogUtil.info("图片上传失败，信息发布失败！");
			request.getRequestDispatcher("/pageAdmin/admin_fbxx.jsp?status=failed").forward(request, response);
			return ;
		}
		
		Fjxxb fjxxb = new Fjxxb(null, fyjs, jq, fjtp, cs, jtdz, lxfs, kzrs, clx, jdsj, zsrzts, zdrzts, rzsj, tfsj, sfsm, wx, kt, bx, xyj, ds, rs, dn, zc, zf, wsj);
		
		boolean b = fjxxService.add(fjxxb);
		request.getSession().removeAttribute("fjtp");
		if(b) {
			//添加成功
			LogUtil.info("添加成功");
			LogUtil.info(request.getSession().getAttribute("fjtp") == null?(String)request.getSession().getAttribute("fjtp"):"已被清空");
			request.getRequestDispatcher("/pageAdmin/admin_fbxx.jsp?status=success").forward(request, response);
		}else {
			//添加失败
			LogUtil.info("添加失败");
			request.getRequestDispatcher("/pageAdmin/admin_fbxx.jsp?status=failed").forward(request, response);
		}
	}

	/**
	 * 删除信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fjbh = request.getParameter("fjbh");
		boolean b = fjxxService.deleteById(fjbh);
		if(b) {
			//删除成功
			request.getRequestDispatcher("/XxglServlet?m=listOne&flag=whxx&pageNo=1&cs=&fyjs=&status=success").forward(request, response);
		}else {
			//删除失败
			request.getRequestDispatcher("/XxglServlet?m=listOne&flag=whxx&pageNo=1&cs=&fyjs=&status=failed").forward(request, response);
		}
//		yhdlxxbService.deleteById(grbh);
//		request.getRequestDispatcher("/YhdlxxbServlet?m=listOne&flag=zhwh&page=1&username=&sfbz=&zcsj=").forward(request,response);
	}

	/**
	 * 修改信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*获取传递来的信息*/
		String fjbh = request.getParameter("fjbh");
		String fyjs = request.getParameter("fyjs");
		String jq1 = request.getParameter("jq");
		String fjtp = request.getParameter("fjtp");
		String cs = request.getParameter("cs");
		String jtdz = request.getParameter("jtdz");
		String lxfs = request.getParameter("lxfs");
		String kzrs1 = request.getParameter("kzrs");
		String clx = request.getParameter("clx");
		String jdsj = request.getParameter("jdsj");
		String zsrzts = request.getParameter("zsrzts");
		String zdrzts = request.getParameter("zdrzts");
		String rzsj = request.getParameter("rzsj");
		String tfsj = request.getParameter("tfsj");
		String sfsm = request.getParameter("sfsm");
		/*处理价钱、可住人数为数值类型*/
		int jq = Integer.parseInt(jq1);
		int kzrs = Integer.parseInt(kzrs1);
		/*获取房间有的功能*/
		String[] fjfn = request.getParameterValues("func");
		String[] params = new String[10];
		for(int i = 0; i < params.length; i++) {
			params[i] = "0";
		}
		for (String s : fjfn) {
			switch(s) {
				case "wx":
					params[0] = "1";
					break;
				case "kt":
					params[1] = "1";
					break;
				case "bx":
					params[2] = "1";
					break;
				case "xyj":
					params[3] = "1";
					break;
				case "ds":
					params[4] = "1";
					break;
				case "rs":
					params[5] = "1";
					break;
				case "dn":
					params[6] = "1";
					break;
				case "zc":
					params[7] = "1";
					break;
				case "zf":
					params[8] = "1";
					break;
				case "wsj":
					params[9] = "1";
					break;
			}
		}
		String wx = params[0];
		String kt = params[1];
		String bx = params[2];
		String xyj = params[3];
		String ds = params[4];
		String rs = params[5];
		String dn = params[6];
		String zc = params[7];
		String zf = params[8];
		String wsj = params[9];
		Fjxxb fjxxb = new Fjxxb(fjbh, fyjs, jq, fjtp, cs, jtdz, lxfs, kzrs, clx, jdsj, zsrzts, zdrzts, rzsj, tfsj, sfsm, wx, kt, bx, xyj, ds, rs, dn, zc, zf, wsj);
		LogUtil.info(fjxxb.toString());
		boolean b =  fjxxService.update(fjxxb);
		if(b) {
			//更新成功
			LogUtil.info("更新成功！");
			request.getRequestDispatcher("/XxglServlet?m=listOne&flag=whxx&pageNo=1&cs=&fyjs=&status=success").forward(request, response);
		}else {
			//更新失败
			LogUtil.info("更新失败！");
			request.getRequestDispatcher("/XxglServlet?m=listOne&flag=whxx&pageNo=1&cs=&fyjs=&status=failed").forward(request, response);
		}
	}

	/**
	 * 模糊查询(分页)
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void listOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*获取模糊查找信息*/
		String cs = request.getParameter("cs");
		String fyjs = request.getParameter("fyjs");
		String pageNo = request.getParameter("pageNo");
		String flag = request.getParameter("flag");
		//创建用户和页对象
		Fjxxb fjxxb = new Fjxxb(cs,fyjs);
		//Pager pager = (Pager)request.getSession().getAttribute("pager");
		Pager pager = new Pager();
		request.getSession().setAttribute("pager",pager);
		//设置当前页
		if(null != pageNo) {
			pager.setPageNo(Integer.parseInt(pageNo));
		}
		//存入map对象
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("user", fjxxb);
		map.put("pager", pager);
		//将结果保存到list
		ArrayList<Fjxxb> list = fjxxService.listByMap(map);
		request.setAttribute("list", list);
//		for(Fjxxb i : list) {
//			System.out.println(i);
//		}
		
		if("whxx".equals(flag)) {
			request.setAttribute("fjList", list);
			request.getRequestDispatcher("/pageAdmin/admin_whxx.jsp").forward(request,response);
		}else {
//			request.getRequestDispatcher("/pages_admin/accountMgr.jsp").forward(request,response);
			LogUtil.info("==============");
			request.getRequestDispatcher("/pageAdmin/admin_whxx.jsp").forward(request,response);
		}
		
		/*
		if("zhcx".equals(flag)) {
			request.getRequestDispatcher("/pages_admin/accountList.jsp").forward(request,response);
		}else {
			request.getRequestDispatcher("/pages_admin/accountMgr.jsp").forward(request,response);
		}*/
		
	}
	
	/**
	 *  查找全部(不分页)
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void listAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*获取模糊查找信息*/
		String cs = request.getParameter("cs");
		String fyjs = request.getParameter("fyjs");
		String flag = request.getParameter("flag");
		
		Fjxxb fjxxb = new Fjxxb(cs,fyjs);
		
		ArrayList<Fjxxb> list = fjxxService.listByObj(fjxxb);
//		request.setAttribute("list", list);
		
		if(flag.equals("first")) {
			request.setAttribute("listBegin", list);
			request.getRequestDispatcher("/index.jsp").forward(request,response);
			//response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
		
		
	}
	
}
