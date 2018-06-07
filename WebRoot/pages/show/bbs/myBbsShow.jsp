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
    
    <title>显示我的所有帖子</title>
    
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
          <tr height="30"><td colspan="6" background="images/index/side_h.png" style="text-indent:5"><b><font color="black">■ 我的帖子</font></b></td></tr>
          <tr height="30" align="center" bgcolor="#F0F0F0">
              <td width="6%">状态</td>
              <td width="32%">帖子标题</td>
              <td width="7%">回复数</td>
              <td width="25%">发表者</td>
              <td width="25%">最后回复</td>
              <td width="5%">操作</td>
          </tr>
          <s:if test="#session.mybbslist.size() == 0">
              <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="6"><li>对不起，帖子列表不存在！</li></td></tr>
          </s:if>
          <s:else>
			  <tr>
                  <td colspan="6">
                      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" rules="all">                  
                      <s:iterator id="myBbsSingle" value="#session.mybbslist">
                      <tr height="30" bgcolor="#F9F9F9">
                          <td width="6%" align="center">
                          	  <s:if test='%{#myBbsSingle.bbsIsGood == "1"}'>
                  	    		  精华
	                  	      </s:if>
	                  	      <s:if test='%{#myBbsSingle.bbsIsTop == "1"}'>
                  	    		  置顶
	                  	      </s:if>
                   		      <s:if test='%{#myBbsSingle.bbsIsTop != "1" && #myBbsSingle.bbsIsGood != "1"}'>
                  	    		  普通
	                  	      </s:if>                  		      
                          </td>
                          <td width="32%" style="text-indent:10">
						      <img src="images/face/bbs/${myBbsSingle.bbsFace}">
                              <a href="user/openShow.do?method=openShow&bbsId=${myBbsSingle.bbsId}">${myBbsSingle.bbsTitle}</a></td>
                          <td width="7%" align="center">${myBbsSingle.bbsAnswerNum}</td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${myBbsSingle.bbsSender}">
                                  <b>${myBbsSingle.bbsSender}</b>
                                  <br>${myBbsSingle.bbsSendTime}
                              </a>
                          </td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${myBbsSingle.bbsLastUpdateUser}">
                                  <b>${myBbsSingle.bbsLastUpdateUser}</b>
                                  <br>${myBbsSingle.bbsLastUpdateTime}
                              </a>
                          </td>
                          <td width="5%" align="center"><a href="needLogin/deleteRoot.do?method=deleteRootBbs&bbsId=${myBbsSingle.bbsId}&bbsSender=${myBbsSingle.bbsSender}" title="楼主/管理员操作" onclick="javaScript:return confirm('确认要删除该信息?')">删除</a></td>
                      </tr>
	                  </s:iterator>
    				  </table>
    		      </td>
    		  </tr>                               
              </s:else>
          
          <tr height="10"><td colspan="6"></td></tr>
          <tr height="30">          
              <td colspan="6" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="needLogin/my/listShow.do?method=lookMyBbs"/>
                  </jsp:include>
              </td>
          </tr>
          <tr height="10"><td colspan="6"></td></tr>          
      </table>
    </center>
  </body>
</html>