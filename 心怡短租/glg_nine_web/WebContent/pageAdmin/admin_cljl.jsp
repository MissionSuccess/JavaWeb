<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 订单内容  -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="${pageContext.request.contextPath }/lib/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/lib/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin_ddnr.css" />
		<style>
			.modal-body div{
				margin-bottom: 20px;
			}
			
			.modal-body input{
				margin-right:20px;
			}
			#reDdzt{
				width: 100px;
				height: 25px;
			}
			#top{
			font-size:25px;
			padding:20px 0px 15px 30px;
			}
			
		</style>
	</head>
	<body>
	
	<div id="main">
		<div id="main1">
			<div id="top">
			处理记录
			</div>
			<div id="select">
				<form action="${pageContext.request.contextPath}/DdclServlet?m=listClr&flag=cljl&pageNo=1" method="post" name="">
					<table width="100%" cellspacing="0">
						<tr>
							<td>订单状态</td>
							<td>
								<select name="ddzt" id="reDdzt">
									<option value="" ${param.ddzt==""?"selected='selected'":""} >全部</option>
									<option ${param.ddzt=="待处理"?"selected='selected'":""} >待处理</option>
									<option ${param.ddzt=="预订成功"?"selected='selected'":""} >预订成功</option>
									<option ${param.ddzt=="预订失败"?"selected='selected'":""} >预订失败</option>
								</select>
							</td>
							<td>姓名</td>
							<td><input id="reXm" name="xm" placeholder="可模糊" value="${param.xm}" /></td>
							<td>联系方式</td>
							<td><input id="reLxfs" name="lxfs" placeholder="可模糊" value="${param.lxfs}" /></td>
						</tr>
						<tr id="tr_input" >
							<td colspan="6" id="">
								<input type="submit" value="查询" />
								<input id="mhReset" type="button" value="重置"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div id="main2">
				<form action="" method="post">
					<table width="100%" border="1" cellspacing="0px" bordercolor="#ADADAD">
						<tr>
							<th width="10%">序号</th>
							<th width="15%">订单状态</th>
							<th width="10%">姓名</th>
							<th width="10%">性别</th>
							<th width="20%">身份证号</th>
							<th width="15%">联系方式</th>
							<th width="20%">操作</th>
						</tr>
						<c:if test="${not empty clrList}">
							<c:forEach items="${requestScope.clrList}" var="user" varStatus="st">
								<tr>
									<td>${st.index + pager.startRowNum }</td>
									<td>${user.ddzt}</td>
									<td>${user.xm }</td>
									<td>${user.xb }</td>
									<td>${user.sfzh }</td>
									<td>${user.lxfs }</td>
									<td>
										<a href="" data-toggle="modal" data-target="#myModa_ddnr_xq${st.index}">详情</a>
										&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<tr>
							<td colspan="7">
								<jsp:include page="pager.jsp">
									<jsp:param name="path" 
									value="${pageContext.request.contextPath}/DdclServlet?m=listClr&flag=cljl&ddzt=${param.ddzt}&xm=${param.xm}&lxfs=${param.lxfs}"/>
								</jsp:include>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<c:if test="${not empty clrList}">
		<c:forEach items="${clrList}" var="dd" varStatus="st" >
			<div class="modal fade" id="myModa_ddnr_xq${st.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<form action="" method="post" name="ddnr_form">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title myModalLabel" >
									订单详情
								</h4>
							</div>
							<div class="modal-body" style="text-align:center ;">
								<div >
									订单编号：<input type="text" name="ddbh" value="${dd.ddbh}" />
									房间编号：<input type="text" name="fjbh" value="${dd.fjbh}"  />
								</div>
								<div >
									个人编号：<input type="text" name="grbh" value="${dd.grbh}"  />
									订单状态：<input type="text" value="${dd.ddzt}" />
								</div>
								<div >
									入住时间：<input type="text" name="rzsj" value="${dd.rzsj}" />
									退房时间：<input type="text" name="ttsj" value="${dd.tfsj}" />
								</div>
								<div >
									入住人数：<input type="text" name="rzrs" value="${dd.rzrs}" />
									姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="xm" value="${dd.xm}" />
								</div>
								<div >
									联系方式：<input type="text" name="lxfs" value="${dd.lxfs}" />
									性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input type="text" name="xb" value="${dd.xb}" />
								</div>
								<div >
									身份证号：<input type="text" name="sfzh" value="${dd.sfzh}" />
									处&nbsp;&nbsp;理&nbsp;&nbsp;人：<input type="text" name="clr" value="${dd.clr}" />
								</div>
							</div>
							<div class="modal-footer" style="text-align: center;" class="submit">
								<button type="button" class="btn btn-default" data-dismiss="modal" value="拒绝"  style=";margin-right: 10px;">
									关闭
								</button>
							</div>
						</form>
					</div><!-- /.modal-content -->
				</div><!-- /.modal -->
			</div>
		</c:forEach>
	</c:if>
	
	
	</body>
	
	
	<script type="text/javascript">
		//重置模糊选项的三个框
		function reMh(){
			$("#reDdzt").children("option").each(function(){
	              var temp_value = $(this).val();
	              if(temp_value == ""){
	                    $(this).attr("selected","selected");
	              }else{
	            	  $(this).removeAttr("selected");
	              }
	         });
			$("#reXm").val("");
			$("#reLxfs").val("");
		}
		
		//设置模态框中的属性全部可读
		function readOnly(){
			$("[name='ddnr_form'] input").each(function(){
				$(this).attr("readonly","readonly");
			});
		}
		
		//表单提交函数
		function submitForm(){
			var val = $(this).val();
			if(val == "同意"){
				$("form").attr("action","${pageContext.request.contextPath}/DdclServlet?m=update&ddzt=预订成功");
			}else{
				$("form").attr("action","${pageContext.request.contextPath}/DdclServlet?m=update&ddzt=预订失败");
			}
			$(this).parent("[name='ddnr_form']").submit();
		}
		
		$(function(){
			$("#mhReset").click(reMh);
			readOnly();
			$("[value='同意']").click(submitForm);
			$("[value='拒绝']").click(submitForm);
		});
	</script>
</html>
