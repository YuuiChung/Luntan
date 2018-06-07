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
    
    <title>分页导航栏</title>
    
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
    <table border="0" width="100%" cellspacing="0">
        <tr>
            <td width="37%" align="center">${page.pageInfo}</td>
            <td align="center" width="37%">${page.pageLink}</td>
            <s:form action="%{param['gowhich']}" method="post">
            <td width="26%">
                转到：
                <s:textfield name="showpage" size="7"></s:textfield>
                <s:submit value="跳转页面"></s:submit>
            </td>
            </s:form>
        </tr>
    </table>
</body>
</html>