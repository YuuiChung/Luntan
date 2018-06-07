<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>页尾</title>
    
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
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr><td align="center"><div class="model footer">
    <p>
        <a class="" href="#">设为首页</a>
        -
        <a href="http://pinyin.sogou.com/">搜狗输入法</a>
        -
        <a href="http://www.nfsysu.cn/">支付中心</a>
        -
        <a href="http://www.nfsysu.cn/">军事社区</a>
        -
        <a href="http://www.nfsysu.cn/">广告服务</a>
        -
        <a href="http://www.nfsysu.cn/">社区地图</a>
        -
        <a href="http://www.nfsysu.cn/">客服中心</a>
        -
        <a href="mailto:1123934927@qq.com">联系方式</a>
        -
        <a href="http://www.sohu.com/about/privacy.html">保护隐私权</a>
        -
        <a href="mailto:1123934927@qq.com">About Mr_Chung</a>
        -
        <a href="http://www.nfsysu.cn/">南苑介绍</a>
    </p>
    <p>
        <span class="fontArial">©</span>
        2016 Mr_Chung Inc. All rights reserved. 南苑社区
       	 版权所有
    </p>
    <p>
        南苑社区客服电话：13794422494 客服邮箱：
        <a href="mailto:1123934927@qq.com">1123934927@qq.com</a>
    </p>
</div></td></tr>
      </table>
    </center>
  </body>
</html>