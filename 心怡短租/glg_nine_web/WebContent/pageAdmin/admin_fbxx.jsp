<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${pageContext.request.contextPath }/lib/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/lib/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-发布信息.css" />
		<title></title>
		<style>
			#top{
			font-size:25px;
			padding:20px 0px 15px 30px;
			}
		</style>
	</head>
	<body>
	<div id="main">
	<div id="top">
	发布信息
	</div>
	<br />
	<form action="${pageContext.request.contextPath}/XxglServlet?m=add" method="post"  name="infoForm"  >
	<div id="main1">
	<br />
	<div id="main_left">
			房源介绍：<input type="text" name="fyjs" id="fyjs" /><span id="fyjsspan"></span><br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			价钱：<input type="text" name="jq" id="jq" /><span id="jqspan"></span><br /><br />
			<!-- 房间图片：<input type="file" name="fjtp" id="fjtp" /><span id="fjtpspan"></span><br /> -->
			<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;城市：
			    &nbsp; <input type="text" value="" size="15" id="homecity_name" name="cs" mod="address|notice" mod_address_source="hotel" mod_address_suggest="@Beijing|北京|53@Shanghai|上海|321@Shenzhen|深圳|91@Guangzhou|广州|80@Qingdao|青岛|292@Chengdu|成都|324@Hangzhou|杭州|383@Wuhan|武汉|192@Tianjin|天津|343@Dalian|大连|248@Xiamen|厦门|61@Chongqing|重庆|394@" mod_address_reference="cityid" mod_notice_tip="中文/拼音" />
			     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      <input id="cityid" name="cityid" type="hidden" value="{$cityid}" />
			  </div>
			  <div id="jsContainer" class="jsContainer" style="height:0">
				  <div id="tuna_alert" style="display:none;position:absolute;z-index:999;overflow:hidden;"></div>
				  <div id="tuna_jmpinfo" style="visibility:hidden;position:absolute;z-index:120;"></div>
				</div><br />
			具体地址：<input type="text" name="jtdz" id="jtdz" /><span id="jtdzspan"></span><br /><br />
			联系方式：<input type="text" name="lxfs" id="lxfs" /><span id="lxfsspan"></span><br /><br />
			可住人数：
			<select name="kzrs">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
			</select><br /><br />
			&nbsp;&nbsp;
			床类型：
			<select name="clx">
				<option value="大床：1张">大床：1张</option>
				<option value="大床：2张">大床：2张</option>
				<option value="大床：3张">大床：3张</option>
				<option value="标准床：1张">标准床：1张</option>
				<option value="标准床：2张">标准床：2张</option>
				<option value="标准床：3张">标准床：3张</option>
			</select><br /><br />
			</div>
			<div id="main_right">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			接待时间：
			<input type="text" class="demo-input" placeholder="时间范围" id="test6" name="jdsj"><span id="test6span"></span><br /><br />
			最少入住天数：<input type="text" name="zsrzts" id="zsrzts" /><span id="fzsrztsspan"></span><br /><br />
			最多入住天数：<input type="text" name="zdrzts" id="zdrzts" /><span id="zdrzts"></span><br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			入住时间：
			<input type="text" class="demo-input" placeholder="" id="test7" name="rzsj"><span id="test7span"></span><br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			退房时间：
			<input type="text" class="demo-input" placeholder="" id="test8" name="tfsj"><span id="test8span"></span><br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收费说明： <textarea name="sfsm" name="sfsm"></textarea><br /><br /><br />
			</div>
			</div>
			<div id="main_bottom">
			
			配套设施：<br />
			<input type="checkbox" name="func" value="kt" />空调
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="func" value="bx" />冰箱
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="func" value="ds" />电视
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="func" value="xyj" />洗衣机
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="func" value="wx" />无线wifi<br />
			<input type="checkbox" name="func" value="dn" />电脑
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="func" value="zc" />早餐
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="func" value="zf" />做饭
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="func" value="wsj"  />卫生间
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="func" value="rs" />24小时热水<br />
			</div>
			<!-- <input type="submit" value="提交"/> -->
		 </form>
		 <div style="margin-left:300px;">
			<form action="${pageContext.request.contextPath}/XxglServlet?m=addPic" method="post" enctype="multipart/form-data" name="picForm"  target="rfFrame" >
				<br />
				房间图片：<input type="file" name="fjtp" id="fjtp"  cellspacing="0" /><span id="fjtpspan"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="main_bottom_input" style="margin-left:270px;">
				<input style="margin-top:-150px;" type="button" id="upload" value="提交" />
				</div>
			</form>
		</div>
		<!-- 提交图片时隐藏跳转界面 -->
		
		<iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>
		<a id="success" data-toggle="modal" data-target="#myModa_OK"></a>
		<a id="failed" data-toggle="modal" data-target="#myModa_NO"></a>
		</div>
		
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
	</body>
	
	<script type="text/javascript">
		$(function(){
			if('${param.status}' == "success"){
				$("#success").click();
			}else if('${param.status}' == "failed"){
				$("#failed").click();
			}
		});
	</script>
	<script src="${pageContext.request.contextPath }/js/fixdiv.js"></script>
	<script src="${pageContext.request.contextPath }/js/address.js"></script>
	<script src="${pageContext.request.contextPath }/js/laydate.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/infopublic.js" ></script> --%>
	<script type="text/javascript">
		laydate.render({
     		 elem: '#test6'
     		,type: 'time'
      		,range: true
    	});
		laydate.render({
     		 elem: '#test7'
      		,type: 'time'
    	});
		laydate.render({
     		 elem: '#test8'
      		,type: 'time'
    	});
	</script>
	<script type="text/javascript">
		function upload(){
			picForm.submit();
			setTimeout(function(){
				infoForm.submit();
			}, 2000);
			//infoForm.submit();
		}
	
		$(function(){
			$("#upload").click(upload);
		});
	</script>
</html>