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
    
    <title>列表查看版面</title>
    
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
      <s:form action="needLogin/admin/getBoardList.do" method="post">
      <input type="hidden" name="method" value="getBoardList">
	  <input type="hidden" name="type" value="show">
      <table border="0" width="580" cellspacing="0" cellpadding="0">
          <tr>
              <td align="right">
			          选择论坛类别：
			          <s:select list="#session.backClassList" name="classId" headerKey="" headerValue="--请选择论坛类别--" listKey="classId" listValue="className"></s:select>
					  <s:submit value="显示"></s:submit>		          
			  </td>
	      </tr>
	  </table>
      </s:form>

      <table border="1" width="580" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="rows">
          <tr height="29"><td background="images/admin/backLT.jpg" colspan="5" style="text-indent:5"><b><font color="white">■ 查看版面</font></b></td></tr>	      
	      <tr height="30" bgcolor="#F0F0F0">
	          <td width="15%" align="center">版面ID</td>
	          <td width="40%" align="center">版面名称</td>
	          <td width="25%" align="center">版主</td>	          
	          <td width="20%" align="center" colspan="2">操作</td>
	      </tr>
	      <s:if test="#session.backBoardList.size() == 0">
              <tr height="80" align="center" bgcolor="#FBFBFB"><td colspan="5"><li>没有版面可显示！</li></td></tr> 
          </s:if>
          <s:else>
              <tr>
                  <td colspan="5">
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" rules="rows">              
                  <s:iterator id="backBoardSingle" value="#session.backBoardList">
                      <tr height="35" bgcolor="#FBFBFB">
                            <td width="15%" align="center">${backBoardSingle.boardId}</td>
                            <td width="40%" style="text-indent:5"><a href="needLogin/admin/modifyBoard.do?method=modifyBoard&boardId=${backBoardSingle.boardId}">${backBoardSingle.boardName}</a></td>
                            <td width="25%" align="center"><a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${backBoardSingle.boardMaster}">${backBoardSingle.boardMaster}</a></td>
                            <td align="center"><a href="needLogin/admin/modifyBoard.do?method=modifyBoard&boardId=${backBoardSingle.boardId}">√修改</a></td>
                            <td align="center"><a href="needLogin/admin/deleteBoard.do?method=deleteBoard&boardId=${backBoardSingle.boardId}" onclick="javaScript:return confirm('确认要删除该信息?')">×删除</a></td>
                      </tr>
                  </s:iterator>
                  </table>
                  </td>
              </tr>
              </s:else>
	      <tr height="19" style="background-image:url('images/admin/backLE.jpg')"><td colspan="5"></td></tr>	                
      </table>
    </center>
  </body>
</html>