<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  String mainPage=(String)session.getAttribute("mainPage");
  if(mainPage==null||mainPage.equals(""))
	  mainPage="default.jsp";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>编程体验BBS-论坛</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link style="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/tool.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/base_drag.js"></script>
<script type="text/javascript" src="js/bbs.js"></script>

</head>
<body bgcolor="#AA8D60">
	<center>
		<table bgcolor="#F0F0F0" border="0" width="800" cellspacing="0"
			cellpadding="0" bordercolor="lightgrey">
			<tr>
				<td><jsp:include page="top.jsp" /></td>
			</tr>
			<tr>
				<td><jsp:include page="menu.jsp" /></td>
			</tr>
			<tr>
				<td><jsp:include page="<%=mainPage%>" /></td>
			</tr>
			<tr>
				<td height="82"><jsp:include page="end.jsp" /></td>
			</tr>
		</table>
	</center>
</body>
</html>