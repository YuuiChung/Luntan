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
    
    <title>显示精华帖子</title>
    
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
      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="rows" style="margin-top:8">
          <tr height="30"><td colspan="5" style="text-indent:5" background="images/index/side_h.png"><b><font color="black">■ 精华帖子</font></b></td></tr>
          <tr height="30" align="center" bgcolor="#F0F0F0">
              <td width="8%">状态</td>
              <td width="35%">帖子标题</td>
              <td width="7%">回复数</td>
              <td width="25%">发布者</td>
              <td width="25%">最后回复</td>
          </tr>
          <s:if test="#session.goodlist.size() == 0">
              <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="5"><li>对不起，帖子列表不存在！</li></td></tr>
          </s:if>
         <s:else>
			  <tr>
                  <td colspan="5">
                      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" rules="all">
                      <s:iterator id="goodSingle" value="#session.goodlist">
                      <tr height="35" bgcolor="#F9F9F9">
                          <td width="8%" align="center">精华</td>
                          <td width="35%" style="text-indent:10">
                              <img src="images/face/bbs/${goodSingle.bbsFace}">
                              <a href="user/openShow.do?method=openShow&bbsId=${goodSingle.bbsId}">${goodSingle.bbsTitle}</a>
                          </td>
                          <td width="7%" align="center">${goodSingle.bbsAnswerNum}</td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${goodSingle.bbsSender}">
                                  <b>${goodSingle.bbsSender}</b>
                                  <br>${goodSingle.bbsSendTime}
                              </a>
                          </td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${goodSingle.bbsLastUpdateUser}">
                                  <b>${goodSingle.bbsLastUpdateUser}</b>
                                  <br>${goodSingle.bbsLastUpdateTime}
                              </a>
                          </td>
                      </tr>
                      </s:iterator>
                      </table>
                  </td>
              </tr>                  
             </s:else>
          <tr height="10"><td colspan="5"></td></tr>
          <tr height="30">          
              <td colspan="6" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/goodListShow.do?method=goodListShow"/>
                  </jsp:include>
              </td>
          </tr>
          <tr height="10"><td colspan="5"></td></tr>
      </table>
    </center>
  </body>
</html>