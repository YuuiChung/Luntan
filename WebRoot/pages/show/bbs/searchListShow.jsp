<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示搜索结果</title>
    
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
          <tr height="30"><td colspan="5" background="images/index/side_h.png" style="text-indent:5"><b><font color="black">■ 搜索帖子</font></b></td></tr>
          <tr height="30" align="center" bgcolor="#F0F0F0">
              <td width="7%">状态</td>
              <td width="35%">帖子标题</td>
              <td width="8%">回复数</td>
              <td width="25%">发布者</td>
              <td width="25%">最后回复</td>
          </tr>
          <!-- 搜索帖子列表不存在 -->
          <s:if test="#session.searchlist.size() == 0">
              <tr height="180"><td align="center" colspan="5" bgcolor="#F9F9F9"><li>对不起，未找到符合条件的帖子！</li></td></tr>
          </s:if>
          <!-- 搜索帖子列表存在 -->
          <s:else>
			  <tr>
                  <td colspan="5">
                      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" rules="all">                                    
	                  <!-- 遍历搜索帖子列表 -->
	                  <s:iterator id="searchSingle" value="#session.searchlist">
                      <tr height="30" bgcolor="#F9F9F9">
                          <td width="7%" align="center">
                          	  <s:if test='%{#searchSingle.bbsIsGood == "1"}'>
                  	    		  精华
	                  	      </s:if>
                        	  <s:if test='%{#searchSingle.bbsIsTop == "1"}'>
                  	    		  置顶
	                  	      </s:if> 
                   		      <s:if test='%{#searchSingle.bbsIsGood != "1" && #searchSingle.bbsIsTop != "1"}'>
                  	    		  普通
	                  	      </s:if>                     
                          </td>
                          <td width="35%" style="text-indent:10">
	                          <img src="images/face/bbs/${searchSingle.bbsFace}">
                              <a href="user/openShow.do?method=openShow&bbsId=${searchSingle.bbsId}">${searchSingle.bbsTitle}</a>
                          </td>
                          <td width="8%" align="center">${searchSingle.bbsAnswerNum}</td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${searchSingle.bbsSender}">                              
                                  <b>${searchSingle.bbsSender}</b>
                                  <br>${searchSingle.bbsSendTime}
                              </a>
                          </td>
                          <td width="25%" align="center">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${searchSingle.bbsLastUpdateUser}">                                                        
                                  <b>${searchSingle.bbsLastUpdateUser}</b>
                                  <br>${searchSingle.bbsLastUpdateTime}                                 
                              </a>
                          </td>
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
                      <jsp:param name="gowhich" value="user/search.do"/>
                  </jsp:include>
              </td>
          </tr>
          <tr height="10"><td colspan="6"></td></tr>           
      </table>
    </center>
  </body>
</html>