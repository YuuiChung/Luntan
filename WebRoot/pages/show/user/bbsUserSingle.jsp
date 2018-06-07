<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>前台-查看某个用户详细内容</title>
    
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
        <table border="1" width="70%" bgcolor="#F9F9F9" cellspacing="0" cellpadding="0" bordercolor="lightgrey" rules="none" style="margin-top:8">
	        <tr height="60">  <td colspan="2" style="text-indent:5">■ 查看用户信息</td></tr>
 	        <tr height="50">
 	        	<td align="right">用户头像：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
 	        	<td><img src="images/face/user/${bbsUserSingle.userFace}" style="border:1 solid;border-color:#E0E0E0"></td>
 	        </tr>
 	        <tr height="50">
	            <td align="right">用 户 名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    	        <td>${bbsUserSingle.userName}</td>
   	        </tr>
   	        <tr height="50">
	            <td align="right">用户性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td>${bbsUserSingle.userSex}</td>
	        </tr>
   	        <tr height="50">
	            <td align="right">用户权限：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td>
	            	<s:if test='#session.bbsUserSingle.userAble == "0"'>普通用户</s:if>
	            	<s:if test='#session.bbsUserSingle.userAble == "1"'>版主</s:if>
	            	<s:if test='#session.bbsUserSingle.userAble == "2"'>管理员</s:if>
	            </td>
	        </tr>
   	        <tr height="50">
	            <td align="right">E-mail：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td>${bbsUserSingle.userEmail}</td>
	        </tr>
   	        <tr height="50">
	            <td align="right">来　　自：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td>${bbsUserSingle.userFrom}</td>
	        </tr>
	        <tr height="50">
	            <td align="right">备　　注：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	            <td>${bbsUserSingle.userPs}</td>
	        </tr>
            <tr height="60"><td colspan="2" align="center" style="text-indent:20"><a href = "javascript;" onclick="javascript:window.history.go(-1)">返回</a></td></tr>      	      
        </table>
        <br>
    </center>
  </body>
</html>