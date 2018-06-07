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
    
    <title>列表查看用户</title>
    
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
      <s:form action="needLogin/admin/getUserList.do" method="post">
      <input type="hidden" name="method" value="getUserList">
	  <input type="hidden" name="type" value="show">
      <table border="0" width="580" cellspacing="0" cellpadding="0">
          <tr>
              <td align="right">
			          选择用户权限：
			          <s:select list="#session.backListAble" name="showAble" headerKey="" headerValue="--请选择用户权限--"></s:select>
					  <s:submit value="显示"></s:submit>		          
			  </td>
	      </tr>
	  </table>
      </s:form>

      <table border="1" width="580" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="rows">
          <tr height="29"><td background="images/admin/backLT.jpg" colspan="6" style="text-indent:5"><b><font color="white">■ 查看用户</font></b></td></tr>	      	      
	      <tr height="30" bgcolor="#F0F0F0">
	          <td width="15%" align="center">用户ID</td>
	          <td width="30%" align="center">用户名</td>
	          <td width="20%" align="center">用户密码</td>
   	          <td width="15%" align="center">用户权限</td>
	          <td width="20%" align="center" colspan="2">操作</td>
	      </tr>
	      <s:if test="#session.backUserList.size() == 0">
              <tr height="80" align="center"><td colspan="6"><li>没有用户可显示！</li></td></tr> 
          </s:if>
          <s:else>
              <tr>
                  <td colspan="6">
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" rules="rows">                            
                  <s:iterator id="backUserSingle" value="#session.backUserList" >
                      <tr height="35" bgcolor="#FBFBFB">
                            <td width="15%" align="center">${backUserSingle.id}</td>
                            <td width="30%" style="text-indent:5"><a href="needLogin/admin/modifyUser.do?method=modifyUser&userId=${backUserSingle.id}">${backUserSingle.userName}</a></td>
                            <td width="20%" align="center">${backUserSingle.oldPassword}</td>
                            <td width="15%" align="center">
                            	<s:if test='%{#backUserSingle.userAble == "0"}'>
                                    普通用户
                                </s:if>
                                <s:if test='%{#backUserSingle.userAble == "1"}'>
                                   版主
                                </s:if>
                                <s:if test='%{#backUserSingle.userAble == "2"}'>
                                    管理员
                                </s:if>
                            </td>
                            <td align="center"><a href="needLogin/admin/modifyUser.do?method=modifyUser&userId=${backUserSingle.id}">√修改</a></td>
                            <td align="center"><a href="needLogin/admin/deleteUser.do?method=deleteUser&userId=${backUserSingle.id}" onclick="javaScript:return confirm('确认要删除该信息?')">×删除</a></td>
                      </tr>
                  </s:iterator>
                  </table>
                  </td>
              </tr>
              </s:else>
	      <tr height="19" style="background-image:url('images/admin/backLE.jpg')"><td colspan="6"></td></tr>	                          
      </table>
    </center>
  </body>
</html>