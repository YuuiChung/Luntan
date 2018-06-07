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
    
    <title>查看某个论坛类别详细内容</title>
    
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
      <br>
      <s:form action="needLogin/admin/modifyClass.do" method="post">
          <input type="hidden" name="method" value="modifyClass">
          <input type="hidden" name="validate" value="yes">
          <input type="hidden" name=classId value="${classSingle.classId}">
          <table border="0" width="90%" cellspacing="0" cellpadding="0" bordercolor="lightgrey" rules="none">
	          <tr height="60">  <td colspan="2" style="text-indent:5">■ 修改论坛类别</td></tr>
    	      <tr height="50">
	                <td align="right" width="30%">论坛类别ID：&nbsp;&nbsp;</td>
	                <td style="text-indent:5">${classSingle.classId}</td>
	          </tr>
	          <tr height="50">
	                <td align="right">论坛类别名称：&nbsp;&nbsp;</td>
    	            <td><s:textfield name="className" value="%{#session.classSingle.className}" size="50"></s:textfield></td>
    	      </tr>
    	      <tr>
	                <td></td>
    	      </tr>
	          <tr height="50">
	                <td align="right">论坛类别介绍：&nbsp;&nbsp;</td>
	                <td><s:textfield name="classIntro" value="%{#session.classSingle.classIntro}" size="50"></s:textfield></td>
	          </tr>
    	      <tr>
	                <td></td>
    	      </tr>	          
    	      <tr height="50">
	                <td>&nbsp;</td>
	                <td>
	                    <s:submit value="修改"></s:submit>
	                    <s:submit value="重置"></s:submit>
	                    <a href = "javascript;" onclick="javascript:window.history.go(-1)">[返回]</a>
    	            </td>
	          </tr>	      	      
          </table>
      </s:form>
    </center>
  </body>
</html>