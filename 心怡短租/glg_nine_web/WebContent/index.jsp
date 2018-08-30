<%@page import="com.Nine.Sky_lnn.bean.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Nine.Sky_lnn.service.*"%>
<%@page import="com.Nine.Sky_lnn.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
   Yhxxb yhuser=new Yhxxb();
   
   yhuser=(Yhxxb)session.getAttribute("yhxx");
   
   boolean judge=false;
   if(yhuser!=null){
	   judge=true;
   }else{
	   yhuser=new Yhxxb("","","","","","");
   }
   
   boolean dl = false;
   
%>
<!-- 查询当前用户订单 -->
<%
	DdxxbDao ddxxbDao = new DdxxbDao();
	Yhxxb yhxx = (Yhxxb)request.getSession().getAttribute("yhxx");
	ArrayList<Ddxxb> dqyhdd = null; //当前用户订单
	ArrayList<Fjxxb> dqyhfj = null; //当前用户订单对应的房间信息
	if(null != yhxx){
		dqyhdd = ddxxbDao.listById(yhxx.getGrbh());
		/* for(Ddxxb i : dqyhdd){
			String fjbh = i.getFjbh();
			Fjxxb fjxxb = new FjxxbDao().selectById(fjbh);
			if(null != fjxxb){
				dqyhfj.add(fjxxb);
			}else{
				dqyhfj.add(new Fjxxb());
			}
		} */
	}
	request.getSession().setAttribute("dqyhdd", dqyhdd);
	
%>

<%
    DdxxbService ddxxbService=new DdxxbService();
    ArrayList<Ddxxb> list=ddxxbService.listAll();
    
/*     FjxxbService fjxxbService = new FjxxbService();
	Fjxxb fjxxb = new Fjxxb();
	ArrayList<Fjxxb> listBegin = fjxxbService.listByObj(fjxxb);
	request.setAttribute("listBegin", listBegin); */ 
%>




<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
		<link rel="icon" href="img/logotitle.ico" type="image/x-icon" />
		<title>心怡短租</title>

		<script type="text/javascript" src="${pageContext.request.contextPath }/laydate/laydate.js" ></script>
		<%-- <script src="${pageContext.request.contextPath }/lib/jquery-3.3.1.min.js"></script> --%>
		<script src="https://cdn.staticfile.org/jquery/3.3.1/jquery.min.js"></script>
		<%-- <script src="${pageContext.request.contextPath }/lib/js/bootstrap.min.js"></script> --%>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css" />
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<%-- 		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/css/bootstrap.min.css"/> --%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/motai.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js" ></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/foot.css">
		<script src="${pageContext.request.contextPath }/js/script_foot.js"></script>
		<script>
			var nowShow = 1;
			function showtime(index){
				if (Number(index)) {
					clearTimeout(sid);
					nowShow = index;
				}
				for (var i = 1;i<5;i++) {
					if(i ==nowShow)
					document.getElementById("img"+nowShow).style.display = "block";
					else
					document.getElementById("img"+i).style.display = "none";
					
				}
				if (nowShow == 4) 
					nowShow = 1;
				 else
					nowShow++;
				
				sid = setTimeout('showtime()',3000);
			}
			
			 lay('#version').html('-v'+ laydate.v);
   			 
			laydate.render({
	     		 elem: '#test7'
	      		,range: true
	    	});
			
			laydate.render({
	     		 elem: '#ddydsj'
	      		,range: true
	    	});
			
			
		</script>
	</head>
	<body onload="showtime()">
		
		 <div id="top">
			<div id="top_logo">
				<img alt="logo" src="${pageContext.request.contextPath }/img/index/top/logo.jpg" width="274" height="49" style="vertical-align:middle;">
			</div>
		<div id="top_links">
			<div id="top_op">
				<ul>
				<% if(!judge){ %>
					<li >
						<img alt="" src="${pageContext.request.contextPath }/img/index/top/user.jpg">：
						<a href="login.jsp?n=1" style="text-decoration: none;color: #ADADAD;"><span>登录</span></a>/<a href="register.jsp"  style="text-decoration: none;color: #ADADAD;"><span>注册</span></a>
					</li>
					<% }else{ dl=true;%>
					<li id="user_tx" >
						<img alt="" id="yhtx" src="/glg_nine_web/upload/${yhuser.tx}" style="width: 30px;border-radius: 50%;margin-top: -6px;height: 30px;">
						<span ><%=yhuser.getYhm() %>,欢迎您</span>
					</li>
					<%} %>
					<li>
						<img src="${pageContext.request.contextPath }/img/index/top/month.jpg">：
						<span id="yue_fen"></span>
					</li>
					<li>
						<img alt="今天是" src="${pageContext.request.contextPath }/img/index/top/date.jpg">：
						<span id="day_day"></span>
					</li>
				</ul> 
				<div id="top_user" >
						<div  data-toggle="modal" data-target="#myModa_grxx" id="top_user_grxx">个人信息</div>
						<div  data-toggle="modal" data-target="#myModa_xgmm" id="top_user_xgmm">修改密码</div>
						<div id="wddd" data-toggle="modal" data-target="#myModa_lsdd">我的订单</div>
				</div>
			</div>
			<div id="top_close">
			
				<a href="${ pageContext.request.contextPath }/dengluServlet?m=dele"  target="_parent">
					<img alt="退出系统" title="退出系统" src="${pageContext.request.contextPath }/img/index/top/close.jpg" style="position: relative; top: 10px; left: 25px;">
				</a>
			</div>
		</div>
	</div>
	
	<!--
    	top模态框start
    -->
    <div class="modal fade" id="myModa_grxx" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="${pageContext.request.contextPath }/XgGrxxServlet?m=Xg" method="post" name="grbh_form">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						个人信息
					</h4>
				</div>
				<div class="modal-body" style="text-align: ;">
				
				<table id="table-grxx">
					<tr>
						<td class="yhxx1">个人编号:<input type="text" class="yhxx"  id="grbh" value="<%=yhuser.getGrbh() %>" readonly="readonly" name="grbh"/></td>
					</tr>
					<tr>
						<td class="yhxx1">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:<input type="text" class="yhxx" id="zh" value="<%=yhuser.getZh()%>"readonly="readonly" name="zh" /></td>
					</tr>
					<tr>
						<td class="yhxx1">用&nbsp;&nbsp;户&nbsp;&nbsp;名:<input type="text" class="yhxx" id="yhm" value="<%=yhuser.getYhm()%>"readonly="readonly" name="yhm" /><span id="yhmspan"></span></td>
					</tr>
					<tr>
		                <td class="yhxx1" readonly="readonly">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别
								<select name="xb" style="margin-top: 20px;" >
									<option value="男" ${param.xb == "男"?"selected='selected'":"" }>男</option>
									<option value="女"${param.xb == "女"?"selected='selected'":"" }>女</option>
								</select>
						</td>
		            </tr>
					<tr>
						<td class="yhxx1">联系方式:<input type="text" class="yhxx" id="lxfs" value="<%=yhuser.getLxfs()%>"readonly="readonly" name="lxfs" /><span id="lxfsspan" name="lxfs"></span></td>
					</tr>
					<tr>
						<td class="yhxx1">注册时间:<input type="text" class="yhxx" id="zcsj" value="<%=yhuser.getZcsj()%>"readonly="readonly" /></td>
					</tr>
					<tr>
						<!--<td class=""><input type="button" class="" id="xiugai" value="修改" style="font-size: 20px;" /></td>
						<td class=""><input type="reset"  class="" id="login_ret" value="重 置" style="font-size:20px;"></td>-->
					</tr>
				</table>
	
				
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="reset" class="btn btn-default" id="login_ret" value="关闭" data-dismiss="modal" style=";margin-right: 10px;">关闭
					</button>
					<button  id="xiugai" value="修改"  type="button" class="btn btn-primary"  style="margin-left: 10px;"  >
						修改
					</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

 <div class="modal fade" id="myModa_lsdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						我的订单
					</h4>
				</div>
				<div class="modal-body" style="text-align: ;">
				<!-- 显示用户订单 -->
				<c:if test="${not empty dqyhdd}">
					<c:forEach items="${ dqyhdd}" var="user" varStatus="st">
						<div class="${user.ddzt=='预约成功'?'wdtz_cg':''}${user.ddzt=='预订失败'?'wdtz_sb':''}${user.ddzt=='待处理'?'wdtz_dcl':''}" data-toggle="modal" data-target="#myModa_grxx_lsdd${st.index }">
							<span>订单编号：${user.ddbh}</span> <p></p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; “亲爱的${user.xm}${user.xb=='男'?'先生':'女士'}，您的订单${user.ddzt}！<p/>
							<i></i>
						</div>
					</c:forEach>
				</c:if>

				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;关闭&nbsp;&nbsp;&nbsp;&nbsp;
					</button>
				</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>


<div class="modal fade" id="myModa_xgmm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="${pageContext.request.contextPath }/XgGrxxServlet?m=Xgmm&zh=${yhuser.zh }"  method="post" name="xgmm_form">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改密码
					</h4>
				</div>
				<div class="modal-body" style="text-align: ;">
				
				<table id="table-grxx" style="margin-left:80px">
					
					<tr>
						<td class="yhxx1">原&nbsp;&nbsp;密&nbsp;&nbsp;码：<input type="password" class="yhxx" id="ymm" value="" name="ymm" /><span id="ymmspan" style="font-size:15px;color:red;"></span></td>
					</tr>
					
					<tr>
						<td class="yhxx1">新&nbsp;&nbsp;密&nbsp;&nbsp;码：<input type="password" class="yhxx" id="xmm" value="" name="xmm" /><span id="xmmspan" style="font-size:15px;color:red;"></span></td>
					</tr>
					<tr >
						<td class="yhxx1" >确认密码：<input type="password" class="yhxx" id="remm" value="" /><span id="remmspan" style="font-size:15px;color:red;"></span></td>
					</tr>
			
						<!--<td class=""><input type="button" class="" id="xiugai" value="修改" style="font-size: 20px;" /></td>
						<td class=""><input type="reset"  class="" id="login_ret" value="重 置" style="font-size:20px;"></td>-->
					</tr>
				</table>
	
				
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="reset" class="btn btn-default" id="login_ret1" value="重 置"  style=";margin-right: 10px;">重置
					</button>
					<button  id="ggmm" value="修改"  type="button" class="btn btn-primary"  style="margin-left: 10px;"  >
						修改
					</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

	<c:if test="${not empty dqyhdd}">
		<c:forEach items="${ dqyhdd}" var="user" varStatus="st">
			<div class="modal fade" id="myModa_grxx_lsdd${st.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
							<h4 class="modal-title" id="myModalLabel">
								订单信息
							</h4>
						</div>
						<div class="modal-body" style="text-align: center;">
						<div id="room_xq">
							<img src="img/room/room1.jpg"/>
							
							<div class="nr ddxx">
								<div>
									<b>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</b>${user.xm}
								</div>
								<div>
									<b>联系方式：</b>${user.lxfs}
								</div>
								<div>
									<b>入住人数：</b>${user.rzrs}
								</div>
								<div>
									<b>预定时间：</b>${user.rzsj} - ${user.tfsj}
								</div>
								<div>
									<b>订单状态：</b>${user.ddzt}
								</div>
								
							</div>
						</div>
						</div>
						<div class="modal-footer" style="text-align: center;">
							<button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;关闭&nbsp;&nbsp;&nbsp;&nbsp;
							</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal -->
			</div>
		</c:forEach>
	</c:if>



<div class="modal fade" id="myModa_OK" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog " style=" margin-top:200px;width:300px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					系统消息
				</h4>
			</div>
			<div class="modal-body" style="text-align: center;overflow: visible;height:100px">
				<p style="font-size:20px;margin-top:20px;"><img alt="" style="width:25px;height:25px;" src="${pageContext.request.contextPath }/img/succee.png">&nbsp;&nbsp;操作成功！</p>


			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<div class="modal fade" id="myModa_NO" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog " style=" margin-top:200px;width:300px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					系统消息
				</h4>
			</div>
			<div class="modal-body" style="text-align: center;overflow: visible;height:100px">
				<p style="font-size:20px;margin-top:20px;"><img alt="" style="width:25px;height:25px;" src="${pageContext.request.contextPath }/img/fail.png">&nbsp;&nbsp;操作失败！</p>


			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
    
   
    <!--
    	top模态框end
    -->
    
    <!--
    	作者：az624151713@qq.com
    	时间：2018-08-07
    	描述：轮播
    -->
   
   	<div id="lunbo">
   		<div id="oneleftimg">
			<img id="img1" src="${pageContext.request.contextPath }/img/lunbo/b5.jpg" style="display: block;" border="1"/>
			<img id="img2" src="${pageContext.request.contextPath }/img/lunbo/b6.jpg" style="display: none;" border="1"/>
			<img id="img3" src="${pageContext.request.contextPath }/img/lunbo/b7.jpg" style="display: none;" border="1"/>
			<img id="img4" src="${pageContext.request.contextPath }/img/lunbo/b5.jpg" style="display: none;" border="1"/>
		</div>
   	</div>
   	
   	<!--
       	作者：az624151713@qq.com
       	时间：2018-08-08
       	描述：第三部分
       -->
   
   	<div id="xuanxiang">
   		<div id="xx">
			<div class="demo">
			  <div>
			  		 目的地：
			    <input type="text" value="" size="36" id="getcity_name" name="getcity_name" mod="address|notice" mod_address_source="hotel" mod_address_suggest="@Beijing|北京|53@Shanghai|上海|321@Shenzhen|深圳|91@Guangzhou|广州|80@Qingdao|青岛|292@Chengdu|成都|324@Hangzhou|杭州|383@Wuhan|武汉|192@Tianjin|天津|343@Dalian|大连|248@Xiamen|厦门|61@Chongqing|重庆|394@" mod_address_reference="getcityid" />
			  </div>
			  <div>
			  		关键字：
			  	<input type="text" value="" id="key_name">
			  </div>
			</div>
			<div id="jsContainer" class="jsContainer" style="height:0">
			  <div id="tuna_alert" style="display:none;position:absolute;z-index:999;overflow:hidden;"></div>
			  <div id="tuna_jmpinfo" style="visibility:hidden;position:absolute;z-index:120;"></div>
			</div>
		</div>
   	</div>
   
   	<div id="room">
   		<div style="height:100px;font-size:30px;text-align: center;background: url(img/jiu.jpg);margin-top:-50px;margin-bottom: 20px;color:#FFFFFF"><span style="line-height: 3.5;letter-spacing: 10px;">@蓝桥2班9组全体人员欢迎大家入住！</span></div>
   		<div id="room_1">
			<c:if test="${not empty listBegin}">
				<c:forEach items="${listBegin }" var="roomInfo" varStatus="st">
					<div class="room" data-toggle="modal" data-target="#myModal${st.index}"  onclick="document.getElementById('container${st.index}').onclick()">
						<img src="/glg_nine_web/upload/${roomInfo.fjtp}"/>
						<p>${roomInfo.fyjs}</p>
						<div>城市：${roomInfo.cs}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;可住人数：${roomInfo.kzrs}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格：￥${roomInfo.jq}/晚</div>	
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach items="${requestScope.list}" var="user" varStatus="st">
					<tr>
						<td>${st.index + pager.startRowNum }</td>
						<td>${user.ddzt}</td>
						<td>${user.xm }</td>
						<td>${user.xb }</td>
						<td>${user.sfzh }</td>
						<td>${user.lxfs }</td>
						<td>
							<a href="">详情</a>
							<a href="">修改</a>
							<a href="">删除</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
   		</div>
   	</div>
   	<div style="clear:both;"></div>
   	<!-- 模态框 房间详情（Modal） -->
   	<c:if test="${not empty listBegin}">
		<c:forEach items="${listBegin }" var="roomInfo" varStatus="st">
			<div class="modal fade" id="myModal${st.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
							<h4 class="modal-title" id="myModalLabel">
								房间信息
							</h4>
						</div>
						<div class="modal-body" style="text-align: center;">
						<div id="room_xq">
							<img src="/glg_nine_web/upload/${roomInfo.fjtp}"/>
							<div id="room_xq_bt">
								<ul>
								<li><span class="glyphicon glyphicon-home" aria-hidden="true"></span>
									<b>${roomInfo.cs}</b>
								</li>
								<li>
									<span class="glyphicon glyphicon-user"></span>
									<b>可住${roomInfo.kzrs}人</b>
								</li>
								<li>
									<span class="glyphicon glyphicon-map-markerglyphicon glyphicon-" aria-hidden="true"></span>
									<b>￥${roomInfo.jq}/晚</b>
								</li>
								</ul>
							</div>
							
							<div class="nr">
								<ul>
									<li><b>房源介绍</b></li>
									<li>
										<div>
										<span>房源介绍:</span>${roomInfo.fyjs}
										</div>
										<div>
										<span>被单更换:</span>一客一换
										</div>
										<div>
										<span>床类型:</span>${roomInfo.clx}
										</div>
										<div>
										<span>是否地下室:</span>否
										</div>
									</li>
								</ul>
								<ul>
									<li><b>配套设施</b></li>
									<li>
										${roomInfo.wx=="1"?"无线wifi ":""}
										${roomInfo.kt=="1"?"空调 ":""}
										${roomInfo.bx=="1"?"冰箱 ":""}
										${roomInfo.xyj=="1"?"洗衣机 ":""}
										${roomInfo.ds=="1"?"电视 ":""}
										${roomInfo.rs=="1"?"24小时热水 ":""}
										${roomInfo.dn=="1"?"电脑 ":""}
										${roomInfo.zc=="1"?"早餐 ":""}
										${roomInfo.zf=="1"?"做饭 ":""}
										${roomInfo.wsj=="1"?"卫生间 ":""}
									</li>
								</ul>
								<ul>
									<li><b>收费说明</b></li>
									<li>
										${roomInfo.sfsm}
									</li>
								</ul>
								<ul style="height: 80px;">
									<li><b>入住须知</b></li>
									<li>
										 <div>
										<span>接待时间:</span>${roomInfo.jdsj}
										</div>
										<div>
										<span>最少入住:</span>${roomInfo.zsrzts}天
										</div>
										<div>
										<span>退房时间:</span>${roomInfo.tfsj}以前
										</div>
										<div>
										<span>最多入住:</span>${roomInfo.zdrzts}天
										</div>
										<div>
										<span>入住时间:</span>${roomInfo.rzsj}以后
										</div>
										<div>
										<span>联系方式:</span>${roomInfo.lxfs}
										</div>
									</li>
								</ul>
								<ul style="height: 300px;">
									<div id="container${st.index}" style="height: 300px;" onclick="setTimeout(function(){new BMap.Map('container${st.index}').centerAndZoom('${roomInfo.cs}', 13);},500);"></div>
									
								</ul>
							</div>
						</div>
						</div>
						<div class="modal-footer" style="text-align: center;">
							<button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;关闭&nbsp;&nbsp;&nbsp;&nbsp;
							</button>
							<button id="dg" type="button" class="btn btn-primary" style="margin-left: 10px;" data-toggle="modal" data-target="#myModa2${st.index}">
								&nbsp;&nbsp;&nbsp;&nbsp;订购&nbsp;&nbsp;&nbsp;&nbsp;
							</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal -->
			</div>
		</c:forEach>
	</c:if>

   	<!-- 模态框 写订单（Moda2） -->
   	<c:if test="${not empty listBegin}">
		<c:forEach items="${listBegin }" var="roomInfo" varStatus="st">
			<div class="modal fade" id="myModa2${st.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<form action="${pageContext.request.contextPath}/DdclServlet?m=add&fjbh=${roomInfo.fjbh}&grbh=${yhxx.grbh}" method="post" name="dd_form">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="myModalLabel">
									填写订单
								</h4>
							</div>
							<div class="modal-body" style="text-align ;">
							
							<div id="dg_form">

								<ul>
									<li>预订时间：<input type="text" class="demo-input" placeholder="日期范围"  id="yudingshijian${st.index}" name="ydsj"value=""/></li>
									<div class="dg_form_eorr" >
										<span id="ddydsjspan${st.index}"></span>
									</div>
								<li>联系方式：<input type="text" id="ddlxfs${st.index}" name="lxfs" /></li>
								<div class="dg_form_eorr">
										<span id="ddlxfsspan${st.index}" value="111111"></span>
								</div>
								<li>入住人数：
								<input type="text" name="rzrs" id="ddrzrs${st.index}" value="" />
								</li>
									<div class="dg_form_eorr">
									<span id="ddrzrsspan${st.index}"></span>
									</div>
								<li>
									姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="xm" id="ddxm${st.index}" />
								</li>
								<div class="dg_form_eorr">
										<span id="ddxmspan${st.index}"></span>
									</div>
								<li>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
									<input type="radio" name="xb" class="1" value="男" checked/>男
									<input type="radio" name="xb" class="1" value="女" />女
								</li>
								<div class="dg_form_eorr">
									
									</div>
								<li>
									身份证号：<input type="text" name="sfzh" id="ddsfzh${st.index}" />
								</li>
								<div class="dg_form_eorr">
									<span id="ddsfzhspan${st.index}"></span>
									</div>
								</ul>
								<li style="text-align:center;">
								<button  data-toggle="modal" data-target="#pay" type="button" class="btn btn-primary djfk" style="width:200px；">
									点击付款
								</button>
								
								</li>
								</div>
							</div>
							<div class="modal-footer" style="text-align: center;">
								<button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;关闭&nbsp;&nbsp;&nbsp;&nbsp;
								</button>
								<button   type="submit" class="btn btn-primary ddtj" name="ddtj"  style="margin-left: 10px;"  >
									&nbsp;&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;&nbsp;&nbsp;
								</button>
							</div>
						</form>
					</div><!-- /.modal-content -->
				</div><!-- /.modal -->
			</div>
			<script type="text/javascript">
				laydate.render({
		     		 elem: '#yudingshijian${st.index}'
		      		,range: true
		    	});	
				function checkYdsj${st.index}(){
					var ddydsj= $("#yudingshijian${st.index}");
					
					var span=$("#ddydsjspan${st.index}");
					if(""==ddydsj.val()){
						span.text("预定时间不能为空");
						return false;
					}else{
						span.text("*");
						return true;
					}
				}
				function checkLxfs${st.index}(){
					var span = $("#ddlxfsspan${st.index}");
					
				    var lxfs = $("#ddlxfs${st.index}");
				    
					var a=/^0?(13|14|15|18|17)[0-9]{9}$/
				   if(a.test(lxfs.val())){
				   		span.text("*");
				   	return true;
				   }else{
					   span.text("联系方式有误");
				   	return false;
				   }
				}
				function checkRzrs${st.index}() {
					var rzrs = $("#ddrzrs${st.index}");
					var span=$("#ddrzrsspan${st.index}");
					var a=/^\d+$/;
					
					if (""==rzrs.val()) {
						span.text("入住人数不能为空");
						return false;
					}else if (a.test(rzrs.val())) {
						span.text("*");
						return true;
					}else{
						span.text("请输入数字");
						return false;
					}
				}
				function checkXm${st.index}() {
					var xm = $("#ddxm${st.index}");
					var span=$("#ddxmspan${st.index}");
					var a=/^[\u4E00-\u9FA5]{1,4}$/;
					if (""==xm.val()) {
						span.text("姓名不能为空");
						return false;
					}else if(a.test(xm.val())){
						span.text("*");
						return true;
					}else{
						span.text("姓名要为汉字");
						return false;
					}
				}
				function checkSfzh${st.index}() {
					var sfzh = $("#ddsfzh${st.index}");
					var span=$("#ddsfzhspan${st.index}");
					var a=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
					if (""==sfzh.val()) {
						span.text("身份证号不能为空");
						return false;
					}else if(a.test(sfzh.val())){
						span.text("*");
						return true;
					}else{
						span.text("身份证号输入错误");
						return false;
					}
				   return false;
				}
				$("#yudingshijian${st.index}").blur(checkYdsj${st.index});
				$("#ddlxfs${st.index}").blur(checkLxfs${st.index});
				$("#ddrzrs${st.index}").blur(checkRzrs${st.index});
				$("#ddxm${st.index}").blur(checkXm${st.index});
				$("#ddsfzh${st.index}").blur(checkSfzh${st.index});
			</script>
		</c:forEach>
	</c:if>
<div class="modal fade" id="pay" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					支付
				</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<img src="${pageContext.request.contextPath }/img/e.png" class="payimg"/>
				<h2>￥100</h2>
			</div>
			<div class="modal-footer" style="">
				<button type="button" class="btn btn-default gb" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary zfcg" data-dismiss="modal">
					支付成功
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script> 
	$(".ddtj").attr("disabled",true);
	$(".zfcg").attr("disabled",true);
	$(".djfk").click(function(){
		setTimeout(function(){
			$(".payimg").attr("src","${pageContext.request.contextPath }/img/e2.png");
			$(".ddtj").attr("disabled",false);
			$(".zfcg").attr("disabled",false);
		},5000);
	});
	
	$(".ddtj").click(function(){
		setTimeout(function(){
			$(".ddtj").attr("disabled",true);
			$(".payimg").attr("src","${pageContext.request.contextPath }/img/e.png");
		},2000);
		
	});
	
	$(".gb").click(function(){
		setTimeout(function(){
			$(".ddtj").attr("disabled",true);
			$(".payimg").attr("src","${pageContext.request.contextPath }/img/e.png");
		},2000);
		
	});
</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=86zC5ZC7PlXKE4qU3YfvTkCdq6ZOHahE"></script>
   	<!--
       	作者：az624151713@qq.com
       	时间：2018-08-08
       	描述：QQ
       -->
       
       <div id="sideouterPanel">
	<div id="sidePanel">
		<div class="side-qq"><!--QQ-->
			<span></span>
			<div>
				<a target="QQframe" href="tencent://message/?uin=624151713&Site=网站名称&Menu=yes">
					<img src="img/s-qq.png"/>
				</a>
				<span>咨询客服<br/>624151713</span>
				<iframe name="QQframe" style="display:none;">我是隐藏的，你看不到我</iframe>
			</div>
		</div>
		
		<div class="side-tel"><!--电话-->
			<span></span>
			<div>
				<img src="img/s-tel.png"/>
				<span>服务热线<br/>13010001000</span>
			</div>
		</div>
		
		<div class="side-ewm"><!--二维码-->
			<div>
				<img src="img/s-ewm.png"/>
			</div>
		</div>
		
		
		<div class="side-top"><!--回到顶部-->
			<a href="#top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
			
		</div>
	</div>
	</div>
	 	<script>
	 	$(".room").click(function(){
 			if(!<%=dl%>){
 				alert("请登录");
 				window.location.href='login.jsp';
 				
 			}
 		});
	 	</script>
		<script src="${pageContext.request.contextPath }/js/yhxx.js"></script>
	    <script src="${pageContext.request.contextPath }/js/fixdiv.js"></script>
		<script src="${pageContext.request.contextPath }/js/address.js"></script>
		<%-- <script src="${pageContext.request.contextPath }/js/ttdd.js"></script> --%>
		
		<!-- foot_start -->
		<div>
		<div style="margin-top: 100px"></div>

		<div class="wave-box">
		
			<div class="marquee-box marquee-up" id="marquee-box">
				<div class="marquee">
					<div class="wave-list-box" id="wave-list-box1">
						<ul>
							<li><img height="60" alt="波浪" src="images/wave_02.png"></li>
						</ul>
					</div>
					<div class="wave-list-box" id="wave-list-box2">
						<ul>
							<li><img height="60" alt="波浪" src="images/wave_02.png"></li>
						</ul>
					</div>
				</div>
			</div>
		
			<div class="marquee-box" id="marquee-box3">
				<div class="marquee">
					<div class="wave-list-box" id="wave-list-box4">
						<ul>
							<li><img height="60" alt="波浪" src="images/wave_01.png"></li>
						</ul>
					</div>
					<div class="wave-list-box" id="wave-list-box5">
						<ul>
							<li><img height="60" alt="波浪" src="images/wave_01.png"></li>
						</ul>
					</div>
				</div>
			</div>
		
		</div>
			<div class="footer">
			<div class="auto clearfix">
		
				<!-- footer主要-->
				<div class="five-superiority">
					<ul class="five-superiority-list clearfix">
						<li class="compensate_ico">
							<a href="#compensate">
								<span class="superiority-icon"></span>
								<span>到店无房赔偿</span>
							</a>
						</li>
						<li class="retreat_ico">
							<a href="#refund">
								<span class="superiority-icon"></span>
								<span>退款保证</span>
							</a>
						</li>
						<li class="technology_ico">
							<a class="superiority-text" href="#afterService">
								<span class="superiority-icon"></span>
								<span>7x24小时技术支持</span>
							</a>
						</li>
						<li class="prepare_ico">
							<a href="#ico">
								<span class="superiority-icon"></span>
								<span>快速准备</span>
							</a>
						</li>
						<li class="service_ico">
							<a href="#secret">
								<span class="superiority-icon"></span>
								<span>VIP免押入住</span>
							</a>
						</li>
					</ul>
				</div>
		
				<div class="footer-floor1">
					<div class="footer-list">
						<ul>
							<li class="flist-title">友情链接</li>
							<li><a href="#"><strong>爱彼迎</strong></a></li>
							<li><a href="#"><strong>蚂蚁短租</strong></a></li>
							<li><a href="#"><strong>小猪短租</strong></a></li>
							<li><a href="#"><strong>孔夫子旧书网</strong></a></li>
							<li><a href="#"><strong>节假日租房</strong></a></li>
						</ul>
						<ul>
							<li class="flist-title">云解决方案</li>
							<li><a href="#">订单解决方案</a></li>
							<li><a href="#">路线解决方案</a></li>
							<li><a href="#">房况解决方案</a></li>
							<li><a href="#">租金解决方案</a></li>
							<li><a href="#">客服解决方案</a></li>
						</ul>
						<ul>
							<li class="flist-title">技术与支持</li>
							<li><a href="#" target="user/">自助查询</a></li>
							<!--<li><a href="http://icp.niaoyun.com/">备案中心</a></li>-->
							<li><a href="#">意见反馈</a></li>
							<li><a href="">会员服务</a></li>
							<li><a href="#">IDC公司</a></li>
							<li><a href="#">帮助中心</a></li>
						</ul>
						<ul class="flist-4">
							<li class="flist-title">关于我们</li>
							<li><a href="#">公司简介</a></li>
							<li><a href="#">新闻动态</a></li>
							<li><a href="#">加入我们</a></li>
							<li><a href="#">服务协议</a></li>
							<li><a href="#">广告加盟</a></li>
						</ul>
						<div class="clear-float"></div>
					</div>
					<div class="footer-right">
						<div class="telephone" title="服务热线">
							<span></span>
							<div class="tel-number">400-888-8888</div>
						</div>
						<div class="official-plat">
							<p class="weixin" style="background-image: "><span id="wx-corner"></span></p>
		
							<p class="weibo" style="background-image: "><span id="wb-corner"></span></p>
							<ul>
								<li><a href="#a_null"><span class="weixin-logo"></span>天空民宿官方微信</a></li>
								<li title="点击打开官方微博"><a href="#" target="_blank"><span class="weibo-logo"></span>天空民宿官方微博</a></li>
								<li title="点击打开官方客服"><a target="QQframe" href="tencent://message/?uin=624151713&Site=天空民宿&Menu=yes"><span class="qq-logo"></span>天空民宿官方客服</a>
									<iframe name="QQframe" style="display:none;">我是隐藏的，你看不到我</iframe>
								</li>
							</ul>
						</div>
					</div>
					<div class="clear-float"></div>
				</div>
			</div>
			<div class="footer-floor2">
				<p>© Copyright 2018 lanqiao09.top nine版权所有</p>
		<p></p>
			</div>
		</div>
		
		</div>
		<!-- 触发提示窗 -->
		<a id="success" data-toggle="modal" data-target="#myModa_OK"></a>
		<a id="failed" data-toggle="modal" data-target="#myModa_NO"></a>
		
		<!-- foot_end -->
		<!--  <script src="${pageContext.request.contextPath }/js/ttdd.js"></script>-->
		<script src="${pageContext.request.contextPath }/js/HomeMohu.js"></script>
	</body>
		<!-- 个人头像上传（隐藏状态） -->
	<form style="display:none" action="${pageContext.request.contextPath}/ImageUploadServlet?m=updateUserPic" method="post" enctype="multipart/form-data" id="form1">
		<input type="file" name="yhtx" id="pic"/>
	</form>
	
	<script type="text/javascript">
		$(function(){
			if('${param.status}' == "success"){
				$("#success").click();
			}else if('${param.status}' == "failed"){
				$("#failed").click();
			}
		});
	</script>
	<script>
		$(function(){
			$("#yhtx").click(function(){
				$("#pic").click();//点击管理员头像时，触发文件域的点击事件，打开文件选择窗口
			});
			
			$("#pic").change(function(){//选择本地图片，点击打开【保存】时，触发change事件，进行图片校验
				var reg = /\.(png|jpg|jpeg|bmp)$/;//支持的图片格式
				var tx = $.trim($("#pic").val());
				if(tx == ""){
					alert("请选择图片");
				}else if(reg.test(tx) == false){
					alert("图片格式不正确（支持png、jpg、jpeg、 bmp等格式）");
				}else{
					$("#form1").submit();
				}
			});
			
			var pic = "${param.pic}";
			if("" != pic){
				switch(pic){
				case "0":
					alert("上传失败");
					break;
				case "1":
					alert("不是图片文件");
					break;
				case "2":
					alert("图片太大，最多只能是4M");
					break;
				default:
					$("#yhtx").attr("src","${pageContext.request.contextPath}/upload/"+pic);
				}
			}
		});
	</script>
</html>