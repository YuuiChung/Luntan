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
    
    <title>列表查看论坛类别</title>
    
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
      <table border="1" width="580" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="rows">
          <tr height="29"><td background="images/admin/backLT.jpg" colspan="4" style="text-indent:5"><b><font color="white">■ 查看论坛类别</font></b></td></tr>
	      <tr height="30" bgcolor="#F0F0F0">
	          <td width="20%" align="center">类别ID</td>
	          <td width="60%" style="text-indent:15">类别名称</td>
	          <td align="center" colspan="2">操作</td>
	      </tr>
	      <s:if test="#session.backClassList.size() == 0">
	          <tr height="80" bgcolor="#FBFBFB"><td align="center" colspan="4"><li>类别列表不存在！</li></td></tr>
	      </s:if>
	      <s:else>
              <tr>
                  <td colspan="4">
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" rules="rows">
	              <s:iterator id="backClassSingle" value="#session.backClassList">
    	              <tr height="30" bgcolor="#FBFBFB">
	                      <td width="20%" align="center">${backClassSingle.classId}</td>
	                      <td width="60%" style="text-indent:15"><a href="needLogin/admin/modifyClass.do?method=modifyClass&classId=${backClassSingle.classId}">${backClassSingle.className}</a></td>
	                      <td align="center"><a href="needLogin/admin/modifyClass.do?method=modifyClass&classId=${backClassSingle.classId}">√修改</a></td>
	                      <td align="center"><a href="needLogin/admin/deleteClass.do?method=deleteClass&classId=${backClassSingle.classId}" onclick="javaScript:return confirm('确认要删除该信息?')">×删除</a></td>
    	              </tr>	              
	              </s:iterator>
	              </table>
	              </td>
	          </tr>
	          </s:else>
	      <tr height="19" style="background-image:url('images/admin/backLE.jpg')"><td colspan="4"></td></tr>	      
      </table>
    </center>
  </body>
</html>