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
    
    <title>添加论坛类别</title>
    
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
      <s:form action="needLogin/admin/addClass.do" method="post">
          <input type="hidden" name="method" value="addClass">
          <input type="hidden" name="validate" value="yes">
          <table border="0" width="90%" cellspacing="0" cellpadding="0" bordercolor="lightgrey" rules="none">
	          <tr height="60">  <td colspan="2" style="text-indent:5">■ 添加论坛类别</td></tr>
	          <tr height="50">
	                <td align="right">论坛类别名称：&nbsp;&nbsp;</td>
    	            <td><s:textfield name="className" size="50"></s:textfield></td>
    	      </tr>
    	      <tr>
	                <td></td>
    	      </tr>
	          <tr height="50">
	                <td align="right">论坛类别介绍：&nbsp;&nbsp;</td>
	                <td><s:textfield name="classIntro" size="50"></s:textfield></td>
	          </tr>
    	      <tr>
	                <td></td>
    	      </tr>	          
    	      <tr height="50">
	                <td>&nbsp;</td>
	                <td>
	                    <s:submit value="添加"></s:submit>
	                    <s:submit value="重置"></s:submit>
	                    <a href = "javascript;" onclick="javascript:window.history.go(-1)">[返回]</a>
    	            </td>
	          </tr>	      	      
          </table>
      </s:form>
    </center>
  </body>
</html>