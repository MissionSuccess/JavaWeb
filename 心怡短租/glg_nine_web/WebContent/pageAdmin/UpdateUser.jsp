<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="${pageContext.request.contextPath }/lib/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/lib/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/css/bootstrap.min.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/UpdateUser.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-增加用户.css" />
	</head>
	<body>
		<div id="main">
			<div id="main1">
			<form action="${pageContext.request.contextPath}/YhxxbServlet?m=update" method="post" name="update">
				<div id="menu">
				<div id="a2">
					账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="text" value="${param.zh}" name="zh" readonly="readonly" style="border-radius:5px ;width: 300px;height: 30px;border: solid 1px #DDD;"/>
				</div><br />
				<div id="a3">
					用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名：<input type="text" value="${param.yhm}" name="yhm"  readonly="readonly" style="border-radius:5px ;width: 300px;height: 30px;border: solid 1px #DDD;"/>
				</div><br />
				<div id="a4">
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="text" value="" name="pwd" id="pwd" style="border-radius:5px ;width: 300px;height: 30px;border: solid 1px #DDD;"/>
					<span id="pwdspan"style="font-family: '微软雅黑';font-size: 9px;" ></span>
				</div><br />
				<div id="a5">
					性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
					&nbsp;&nbsp;&nbsp;
					<input type="radio" value="男" name="xb" ${param.xb=="男"?"checked='chedcked'":"" } />男
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" value="女" name="xb" ${param.xb=="女"?"checked='chedcked'":"" }  />女
				</div><br />
				<div id="a6" Style="margin-left: 0px;">
					联&nbsp;系&nbsp;方&nbsp;式：<input type="text" value="${param.lxfs}" id="lxfs" name="lxfs" style="border-radius:5px ;width: 300px;height: 30px;border: solid 1px #DDD;">
					<span id="lxfsspan" style="font-family: '微软雅黑';font-size: 9px;" ></span>
				</div><br />
				<div id="a7">
					注&nbsp;册&nbsp;时&nbsp;间：<input type="text" value="${param.zcsj}" readonly="readonly" style="border-radius:5px ;width: 300px;height: 30px;border: solid 1px #DDD;">
				</div><br />
				<div id="a8" style="padding-left:0px">
					验&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码：<input type="text" value="" id="yz" name="yz" style="border-radius:5px ;width: 300px;height: 30px;border: solid 1px #DDD;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="yzm" value="发送验证码">
				</div>
				<br />
				<br />
				<div id="a0">
					<input type="button" name="" id="ups" value="确定"style="background-color: whitesmoke;width: 60px;height: 35px;border: solid 1px #DDD;border-radius:5px ;" />
				</div>
				</div>
			</form>
			</div>
		</div>
	</body>
	
	<!--邮箱验证  -->
	<form style="display:none" action="${pageContext.request.contextPath}/EmailServlet?m=updateAdminEmail" method="post" id="form1">
		<input type="text" value="${param.zh}" name="zhxx" />
		<input type="text" value="${param.yhm}" name="yhmxx" />
		<input type="text" value="${param.xb}" name="xbxx" />
		<input type="text" value="${param.lxfs}" name="lxfsxx" />
		<input type="text" value="${param.zcsj}" name="zcsjxx" />
		<input type="button" name="adyzm" id="adyzm" />
	</form>
	
	<script type="text/javascript">
	$(function(){
		$("#yzm").click(function(){
			$("#form1").submit();
		});
	});
	</script>
</html>