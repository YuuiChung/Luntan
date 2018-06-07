<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  String backMainPage=(String)session.getAttribute("backMainPage");
  if(backMainPage==null||backMainPage.equals(""))
	  backMainPage="default.jsp";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编程体验BBS-论坛 后台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link style="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/bbs.js"></script>  
  </head>
  <body bgcolor="#AA8D60">
    <center>
      <table border="0" width="800" cellspacing="0" cellpadding="0">
        <tr>
            <td rowspan="3" width="172" align="center" valign="top" background="images/admin/back.jpg"><jsp:include page="left.jsp"/></td>
            <td align="center"><jsp:include page="top.jsp"/></td>
        </tr>
        <tr height="33"><td width="center" align="center" background="images/admin/message.jpg"><html:errors property="adminOpR"/></td></tr>        
        <tr height="430"><td align="center" valign="top" background="images/admin/content.jpg"><jsp:include page="<%=backMainPage %>"/></td></tr>
        <tr><td width="center" colspan="2"><jsp:include page="end.jsp"/></td></tr>
      </table>
    </center>
  </body>
</html>