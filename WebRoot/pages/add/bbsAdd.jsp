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
    
    <title>发表帖子</title>
    
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
      <!-- 发表帖子 -->
	  <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="all" style="margin-top:8">
      <s:form action="needLogin/addBbs.action" method="post">
          <input type="hidden" name="method" value="addBbs">
          <input type="hidden" name="validate" value="yes">
		  <tr bgcolor="#F0F0F0" height="30"><td colspan="2" style="text-indent:5" background="images/index/side_h.png"><b><font color="black">■ 发表帖子</font></b></td></tr>          
          <tr>
              <td width="27%" bgcolor="#F9F9F9" align="center" valign="top">
                  <table style="margin-top:10">
                      <tr>
                      	  <td valign="top" width="99%">
                      	          发帖许可：<br><br>         	                  
           	                      <li>请不要发表危害祖国的非法信息！</li>
           	                      <li>请不要发表侵犯个人名誉的信息！</li>
           	                      <li>请不要发表不文明内容！</li>           	                  
           	              </td>
                      </tr>
                      <tr height="40"><td align="center">违反以上规则所发生的后果自负！</td></tr>
                  </table>
              </td>
              <td>
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="rows">
                      <tr height="30">
                          <td width="15%" align="center">【主题】</td>
                          <td align="left">　　<s:textfield name="bbsTitle" size="77" maxlength="35" styleId="title"></s:textfield></td>
                      </tr>
                      <tr bgcolor="#F9F9F9">
                          <td align="center">【表情】</td>
                          <td align="left">　　<%@ include file="face.jsp" %></td>
                      </tr>
                      <tr height="30">
                          <td align="center">【内容】</td>
                          <td align="center"><%@ include file="font.jsp"%></td>
                      </tr>
                      <tr height="30" bgcolor="#F9F9F9">
                          <td colspan="2" align="right" valign="bottom"><%@ include file="count.jsp" %></td>
                      </tr>
                      <tr><td colspan="2" align="center"><s:textarea name="bbsContent" rows="15" cols="79" styleId="content" onkeydown="check(content,ContentUse,ContentRem,1000)" onkeyup="check(content,ContentUse,ContentRem,1000)" onchange="check(content,ContentUse,ContentRem,1000)"></s:textarea></td></tr>
                      <tr height="30" align="center">
                          <td colspan="2">
                              <s:submit value="发表帖子"></s:submit>
                              <s:reset value="重新填写"></s:reset>
                          </td>
                      </tr>
                  </table>
              </td>
          </tr>
      </s:form>
      </table>
    </center>
  </body>
</html>