<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-订单处理记录.css" />
	</head>
	<body>
			<div id="top">
			</div>
			<div id="main">
				<form action="" method="post">
					<table width="100%" border="1" cellspacing="0px" bordercolor="#ADADAD">
						<tr>
							<th>姓名</th>
							<th>性别</th>
							<th>身份证</th>
							<th>联系方式</th>
							<th>查看详情</th>
						</tr>
						<tr id="tr_input">
							<td>小明</td>
							<td>男</td>
							<td>123456</td>
							<td>13754265492</td>
							<td><input type="button" name="" id="" value="查看详情" /></td>
						</tr>
					</table>
				</form>
				</div>
				<br /><br /><br />
				<div id="button">
				<input type="button" value="首页" />
				<input type="button" value="上一页" />
				<input type="button" value="第1页" />
				<input type="button" value="第2页" />
				<input type="button" value="下一页" />
				<input type="button" value="尾页" />
				</div>
	</body>
</html>

