<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>导航栏</title>
    
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
      <table border="0" width="100%" height="100%" cellspacing="0" cellpadding="0">
        <tr height="99"><td align="center" colspan="2"><img src="images/admin/logo.jpg" class="left_logo"></td></tr>
        <tr height="35">
              <td align="center"><a href="goIndex.do"><img src="images/admin/adminB.jpg" style="border:0"></a></td>
              <td align="center"><a href="user/logout.do?method=logout"><img src="images/admin/adminE.jpg" style="border:0"></a></td>
        </tr>
        <tr height="33"><td colspan="2"><img src="images/admin/menuT.jpg"></td></tr>            
        <tr>
              <td align="center" valign="top" colspan="2">
                  <table border="0" width="100%" cellspacing="0" cellpadding="0" bordercolor="lightgrey" style="margin-top:1">
                      <tr bgcolor="#F0F0F0" height="33">
			              <td style="text-indent:5" colspan="2" background="images/admin/menu.jpg"><b><font color="white">■ 类别管理</font></b></td>
				      </tr>
				      <tr height="34">  <td style="text-indent:40" colspan="2" background="images/admin/subMenu.jpg"><a href="needLogin/admin/getClassList.do?method=getClassList">查看论坛类别</a></td></tr>
				      <tr height="34">  <td style="text-indent:40" colspan="2" background="images/admin/subMenu.jpg"><a href="needLogin/admin/addClass.do?method=addClass">添加论坛类别</a></td></tr>
				      <tr bgcolor="#F0F0F0" height="33">
				            <td style="text-indent:5" colspan="2" background="images/admin/menu.jpg"><b><font color="white">■ 版面管理</font></b></td>
				      </tr>
				      <tr height="34">  <td style="text-indent:40" colspan="2" background="images/admin/subMenu.jpg"><a href="needLogin/admin/getBoardList.do?method=getBoardList">查看版面</a></td></tr>
				      <tr height="34">  <td style="text-indent:40" colspan="2" background="images/admin/subMenu.jpg"><a href="needLogin/admin/addBoard.do?method=addBoard">添加版面</a></td></tr>
				      <tr bgcolor="#F0F0F0" height="33">
				            <td style="text-indent:5" colspan="2" background="images/admin/menu.jpg"><b><font color="white">■ 用户管理</font></b></td>
				      </tr>
				      <tr height="34">  <td style="text-indent:40" colspan="2" background="images/admin/subMenu.jpg"><a href="needLogin/admin/getUserList.do?method=getUserList">查看/修改/删除用户</a></td></tr>				      
                  </table>
              </td>
        </tr>
      </table>
    </center>
  </body>
</html>