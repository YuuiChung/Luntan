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
    
    <title>显示某版面中的所有帖子</title>
    
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
      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E0E0E0" rules="rows" style="margin-top:8">          
          <tr height="45" bgcolor="#F9F9F9">
              <!-- 版面公告 -->
              <td colspan="4" style="text-indent:10">
                  版面公告：${boardPcard }
              </td>
              <!-- “发表帖子”超链接 -->
              <td colspan="2" align="center"><a href="needLogin/addBbs.action">[发表帖子]</a></td>
          </tr>
          
          <!-- 版面跳转 -->
          <tr height="30" bgcolor="#F9F9F9">
              <s:form action="user/jumpBoard.do" method="post">              
              <td colspan="6" align="right" background="images/index/boardE.jpg">
                  <input type="hidden" name="method" value="rootListShow">
                  跳转版面:
                  <s:select list="#session.jumpBoard" name="boardId" headerKey="" headerValue="--版面跳转--"></s:select>
                  <s:submit value="跳转"></s:submit>
                  &nbsp;
              </td>
              </s:form>
          </tr>
          
          <!-- ****************显示置顶帖子**************** -->
          <tr height="30"><td colspan="6" style="text-indent:5" background="images/index/side_h.png"><b><font color="black">■ 置顶帖子</font></b></td></tr>
          <tr height="30" align="center">
              <td width="8%">状态</td>
              <td width="35%">帖子标题</td>
              <td width="7%">回复数</td>
              <td width="22%">发表者</td>
              <td width="28%" colspan="2">最后回复</td>
          </tr>
          <!-- 置顶帖子列表不存在 -->
          <s:if test="#session.topbbslist.size() == 0">
              <tr height="70"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>置顶帖子列表不存在！</li></font></td></tr>
          </s:if>
          <!-- 置顶帖子列表存在 -->
          <s:else>
                  <tr>
                      <td colspan="6">
                          <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" rules="all">
                              <!-- 遍历置顶帖子列表 -->
                              <s:iterator id="topBbsSingle" value="#session.topbbslist">
                                  <tr height="35" style="text-indent:5" bgcolor="#FBFBFB">
                       			      <td width="8%" align="center">置顶</td>
			                          <td width="35%" style="text-indent:10">                             
            			                  <img src="images/face/bbs/${topBbsSingle.bbsFace}">
                        			      <a href="openShow.action?showpage=1&bbsId=${topBbsSingle.bbsId}">${topBbsSingle.bbsTitle}</a>
			                          </td>
            			              <td width="7%" align="center">${topBbsSingle.bbsAnswerNum}</td>
                        			  <td width="22%" align="center">
			                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${topBbsSingle.bbsSender}">
            			                      <b>${topBbsSingle.bbsSender}</b>
                        			          <br>${topBbsSingle.bbsSendTime}
                			              </a>
			                          </td>
            			              <td width="28%" align="center" colspan="2">
                        			      <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${topBbsSingle.bbsLastUpdateUser}">
		                            	      <b>${topBbsSingle.bbsLastUpdateUser}</b>
        		                        	  <br>${topBbsSingle.bbsLastUpdateTime}
                        			      </a>
    			                      </td>                          
                			      </tr>
			                  </s:iterator>
			              </table>
			          </td>
			      </tr>              
              </s:else>
          <tr height="30"><td colspan="6" align="right" background="images/index/boardE.jpg"></td></tr>
          
          <!-- ****************显示普通帖子**************** -->
          <tr height="30"><td colspan="6" style="text-indent:5" background="images/index/side_h.png"><b><font color="black">■ 其他帖子</font></b></td></tr>
          <tr height="30" align="center" bgcolor="#F4F4F4">
              <td width="8%">状态</td>
              <td width="35%">帖子标题</td>
              <td width="7%">回复数</td>
              <td width="22%">发布者</td>
              <td width="22%">最后回复</td>
              <td width="6%">操作</td>
          </tr>
          <!-- 普通帖子列表不存在 -->
          <s:if test="#session.otherbbslist.size() == 0">
              <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>对不起，帖子列表不存在！</li></font></td></tr>
          </s:if>
          <!-- 普通帖子列表存在 -->
          <s:else>
                  <tr>
                      <td colspan="6">
                          <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" rules="all">
			 	              <!-- 遍历普通帖子列表 -->
                  		      <s:iterator id="otherBbsSingle" value="#session.otherbbslist">
			                      <tr height="35" bgcolor="#F9F9F9">
            			              <!-- 输出帖子状态 -->
            			              <td align="center" width="8%">
            			              <s:if test='%{#otherBbsSingle.bbsIsGood == "1"}'>
                            	    		  精华
		                        	      </s:if>
        		                    	  <s:else>
                		                	  普通
	                        		      </s:else>                              
			                          </td>
			                          <!-- 输出帖子标题 -->
            			              <td style="text-indent:10" width="35%">
                        			      <img src="images/face/bbs/${otherBbsSingle.bbsFace}">
			                              <a href="user/openShow.do?method=openShow&showpage=1&bbsId=${otherBbsSingle.bbsId}">${otherBbsSingle.bbsTitle}</a>
            			              </td>
            			              <!-- 输出帖子回复数 -->
    			                      <td align="center" width="7%">${otherBbsSingle.bbsAnswerNum}</td>
                			          <!-- 输出帖子发表者 -->
                			          <td align="center" width="22%">
                            			  <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${otherBbsSingle.bbsSender}">
			                                  <b>${otherBbsSingle.bbsSender}</b>
        		                        	  <br>${otherBbsSingle.bbsSendTime}
                        			      </a>
    			                      </td>
                			          <!-- 输出最后回复者 -->
                			          <td align="center" width="22%">
                            			  <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${otherBbsSingle.bbsLastUpdateUser}">
			                                  <b>${otherBbsSingle.bbsLastUpdateUser}</b>
            			                      <br>${otherBbsSingle.bbsLastUpdateTime}
                        			      </a>
			                          </td>
			                          <!-- “删除”超链接 -->
            			              <td align="center" width="6%"><a href="needLogin/deleteRoot.action?bbsId=${otherBbsSingle.bbsId}&bbsSender=${otherBbsSingle.bbsSender}" title="楼主/管理员操作" onclick="javaScript:return confirm('确认要删除该信息?')">×删除</a></td>
			                      </tr>
            			      </s:iterator>
		                  </table>
	                  </td>
	              </tr>                  
              </s:else>       

          <tr height="10" bgcolor="#F4F4F4"><td colspan="6" align="right"></td></tr>                    
          <!-- ****************分页导航栏**************** -->          
          <tr height="30">
              <td colspan="6" align="right" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/listShow.do?method=rootListShow"/>
                  </jsp:include>
              </td>
          </tr>          
          <tr height="10" bgcolor="#F4F4F4"><td colspan="6" align="right"></td></tr>          
      </table>
    </center>
  </body>
</html>