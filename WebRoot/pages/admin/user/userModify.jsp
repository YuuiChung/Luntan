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
    
    <title>后台-查看某个用户详细内容</title>
    
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
      <s:form action="needLogin/admin/modifyUser.do" method="post">
          <input type="hidden" name="method" value="modifyUser">
          <input type="hidden" name="validate" value="yes">
          <input type="hidden" name="userId" value="${select.id}">
          <table border="0" width="90%" height="630" cellspacing="0" cellpadding="0">
	          <tr height="60">  <td colspan="4" style="text-indent:5">■ 修改用户信息</td></tr>
    	      <tr height="70">
	                <td align="right" width="35%">用户ID：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="1">${select.id}</td>
	                <td colspan="2" rowspan="2" valign="bottom" style="padding-bottom:10">
	                    <img id="head" src="images/face/user/${select.userFace}">
	                </td>
	          </tr>
	          <tr>
	                <td align="right">用户头像：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="2">
	                <s:select list="#session.headFace" name="userFace" headerKey="user0.gif" headerValue="--请选择头像--"></s:select>
	                </td>
	          </tr>
	          <tr>
	                <td align="right">用户名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    	            <td colspan="3"><s:textfield name="userName" value="%{#session.select.userName}" size="40"></s:textfield></td>
    	      </tr>
	          <tr>
	                <td align="right">旧密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3" colspan="3">${select.oldPassword}</td>
	          </tr>
	          <tr>
	                <td align="right">新密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><s:password name="userPassword" size="40" redisplay="false"></s:password></td>
	          </tr>
	          <tr>
	                <td align="right">确认密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><s:password name="aginPassword" size="40" redisplay="false"></s:password></td>
	          </tr>
   	          <tr>
	                <td align="right">用户性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td>
	                     <s:radio name="userSex" list="%{#{'男':'男','女':'女'}}" value="男"></s:radio>
	                </td>
	                <td align="right">用户权限：&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td>
	                <s:select list="#session.backUserAble" name="userAble" headerKey="" headerValue="--请选择用户权限--" ></s:select>
					</td>
	          </tr>
   	          <tr>
	                <td align="right">E-mail：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><s:textfield name="userEmail" size="50"></s:textfield></td>
	          </tr>
   	          <tr>
	                <td align="right">来自：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><s:textfield name="userFrom" size="60"></s:textfield></td>
	          </tr>
	          <tr>
	                <td align="right">备注：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                <td colspan="3"><s:textfield name="userPs" size="60"></s:textfield></td>
	          </tr>
    	      <tr>
	                <td>&nbsp;</td>
	                <td colspan="3">
	                    <s:submit value="修改用户"></s:submit>
	                    <s:submit value="重新填写"></s:submit>
	                    <a href = "javascript;" onclick="javascript:window.history.go(-1)">[返回]</a>
    	            </td>
	          </tr>	      	      
          </table>
      </s:form>
    </center>
  </body>
</html>