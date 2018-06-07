<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>页首</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>
	<center>
		<table border="0" width="100%" height="115" cellspacing="0"
			cellpadding="0">
			<tr>
				<td><div id="all_header" class="">
						<div id="header">
							<div class="logo"></div>
							<div class="member">
								个人中心
								<ul class="member_ul">
									<li><a href="needLogin/addBbs.action">发帖</a>
									</li>
									<li><span id="skin_a">换肤</span>
									</li>
									<li><a href="http://www.nfsysu.cn/">帮助</a>
									</li>
									<li><a href="logout.action">退出</a>
									</li>
								</ul>
							</div>
							<div class="reg">
								<a href="pages/reg.jsp">会员注册</a>
							</div>
							<div class="login">
								<a href="pages/login.jsp">个人登录</a>
							</div>
						</div>
					</div>
					<div id="skin">
						<h2>
							<img src="images/index/close.png" class="close">更换皮肤
						</h2>
						<div id="" class="skin_bg">
							<dl>
								<dt>
									<img src="images/index/small_bg1.png"
										big_bg="./images/index/bg1.jpg" bg_color="#E7E9E8">
								<dt>
								<dd>皮肤1</dd>
							</dl>
							<dl>
								<dt>
									<img src="images/index/small_bg2.png"
										big_bg="./images/index/bg2.jpg" bg_color="#ECF0FC">
								<dt>
								<dd>皮肤2</dd>
							</dl>
							<dl>
								<dt>
									<img src="images/index/small_bg3.png"
										big_bg="./images/index/bg3.jpg" bg_color="#E2E2E2">
								<dt>
								<dd>皮肤3</dd>
							</dl>
							<dl>
								<dt>
									<img src="images/index/small_bg4.png"
										big_bg="./images/index/bg4.jpg" bg_color="#FFFFFF">
								<dt>
								<dd>皮肤4</dd>
							</dl>
							<dl>
								<dt>
									<img src="images/index/small_bg5.png"
										big_bg="./images/index/bg5.jpg" bg_color="#F3F3F3">
								<dt>
								<dd>皮肤5</dd>
							</dl>
							<dl>
								<dt>
									<img src="images/index/small_bg6.png"
										big_bg="./images/index/bg6.jpg" bg_color="#EBDEBE">
								<dt>
								<dd>皮肤6</dd>
							</dl>
						</div>
					</div>
					<div id="success">
						<p>成功</p>
					</div>

					<div id="screen"></div></td>
			</tr>
		</table>
	</center>
</body>
</html>