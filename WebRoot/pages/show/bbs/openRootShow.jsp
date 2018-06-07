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
    
    <title>查看跟帖</title>
    
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
      <!-- ****************显示根帖信息**************** -->
      <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="all" style="margin-top:8;word-break:break-all">
          <tr height="30"><td colspan="3" background="images/index/side_h.png" style="text-indent:5"><b><font color="black">■ 显示根帖</font></b></td></tr>
          <tr height="30" bgcolor="#F0F0F0">
              <td style="text-indent:5" width="27%">★ 楼主</td>
              <td colspan="2">【主题】${bbsRootSingle.bbsTitle}</td>
          </tr>
          <tr bgcolor="#F9F9F9">
	          <!-- 发帖者信息 -->
              <td rowspan="3" align="center" valign="top">
                  <table width="95%" height="180" border="0" cellspacing="0" cellpadding="0" style="margin-top:3">
                      <tr height="35%">
                          <td align="center" width="30%"><img src="images/face/user/${askUser.userFace}" style="border:1 solid;border-color:#E3E3E3"></td> 
                          <td style="text-indent:10">
                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${sessionScope.bbsRootSingle.bbsSender}">
                                  <b>${askUser.userName}</b>
                              </a>
                          </td>
                      </tr>
                      <tr>
                          <td align="center">性别：</td>
                          <td style="text-indent:10">
                              ${askUser.userSex}
                          </td>
                      </tr>
                      <tr>
                          <td align="center">来自：</td>
                          <td style="text-indent:10">
                              ${askUser.userFrom}
                          </td>
                      </tr>
                      <tr>
                          <td align="center">备注：</td>
                          <td style="text-indent:10">
                              ${askUser.userPs}
                          </td>
                      </tr>
                      <!-- “返回”超链接 -->
                      <tr height="30"><td colspan="2" style="text-indent:70"><a href = "javascript;" onclick="javascript:window.history.go(-1)">[返回]</a></td></tr>
                  </table>
              </td>
              <!-- 根帖信息 -->
              <td width="10%">【表情】<img src="images/face/bbs/${sessionScope.bbsRootSingle.bbsFace}"></td>
              <td height="30" align="right">发表时间：『${bbsRootSingle.bbsSendTime}』&nbsp;</td>
          </tr>
          <tr height="130"><td colspan="2" valign="top" style="padding-top:6;padding-left:6;padding-right:6;padding-bottom:6">${bbsRootSingle.bbsContent}</td></tr>
          
          <!-- 实现对根帖进行操作的超链接 -->
          <tr height="30" bgcolor="#F9F9F9">
              <td align="right" colspan="2">
                  
                  <!-- 如果该贴不是精华帖子，并且不是置顶帖子(实际上就是普通帖子) -->
                  <s:if test='#session.bbsRootSingle.bbsIsGood != "1" && #session.bbsRootSingle.bbsIsTop != "1"'>
                          <!-- 显示“将帖子提前”超链接 -->
                          ◆<a href="needLogin/firstBbs.do?method=toFirstBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}" title="帖子所属者/楼主/管理员操作">将帖子提前</a>&nbsp;
                      </s:if>
                  
                  <!-- 如果该帖不是置顶帖子 -->
                  <s:if test='%{#session.bbsRootSingle.bbsIsTop != "1"}'>
					  <!-- 显示“置顶帖子”超链接 -->
                      ◆<a href="needLogin/admin/doTop.do?method=setTopBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}" title="管理员操作">置顶帖子</a>&nbsp;
                  </s:if>
                  
                  <!-- 如果该帖不是精华帖子 -->
                  <s:if test='%{#session.bbsRootSingle.bbsIsGood != "1"}'>
                      <!-- 显示“设为精华帖”超链接 -->
                      ◆<a href="needLogin/admin/doGood.do?method=setGoodBbs&bbsId=${sessionScope.bbsRootSingle.bbsId}" title="管理员操作">设为精华帖</a>&nbsp;                  
                  </s:if>
                                   
                   <!-- 显示“删除帖子”超链接 -->
                  ◆<a href="needLogin/deleteRoot.action?bbsId=${sessionScope.bbsRootSingle.bbsId}&bbsSender=${sessionScope.bbsRootSingle.bbsSender}" title="帖子所属者/楼主/管理员操作">删除帖子</a>&nbsp;
              </td>
          </tr>
      </table>
      
      <!-- ****************显示回复帖子**************** -->      
      <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" style="margin-top:2;word-break:break-all">
          <tr height="30"><td background="images/index/side_h.png" style="text-indent:5"><b><font color="black">■ 显示回复帖子</font></b></td></tr>
      </table>
      <!-- 不存在回复帖子列表 -->
      <s:if test="#session.answerbbslist.size() == 0">
          <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="all">
              <tr height="70" bgcolor="#F9F9F9"><td align="center"><li>暂时没有回复帖！</li></td></tr>
          </table>
      </s:if>    
      <!-- 存在回复帖子列表 -->
      <s:else>
              <!-- 遍历回复帖子列表 -->
              <s:iterator id="answerbbsSingle" value="#session.answerbbslist" status="L">
              <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="all" style="word-break:break-all">
                  <tr height="25" bgcolor="#F0F0F0">
                      <td style="text-indent:5" width="27%">▲${(page.currentP-1)*page.perR+(L.index+1)} 楼</td>
                      <td colspan="2">【回复主题】${answerSingle.bbsAnswerTitle}</td>              
                  </tr>                  
                  <tr bgcolor="#F9F9F9">
	                  <!-- 回复者信息 -->	                  
                      
                      <td rowspan="3" align="center" valign="top">
                          <table width="95%" height="150" border="0" cellspacing="0" cellpadding="0" style="margin-top:3">
                              <tr height="35%">
                                  <td align="center" width="30%"><img src="images/face/user/${answerMap[answerbbsSingle.bbsAnswerSender].userFace}" style="border:1 solid;border-color:#E0E0E0"></td>
                                  <td style="text-indent:10">
                                      <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${answererName}">
                                          <b>${answerMap[answerbbsSingle.bbsAnswerSender].userName}</b>
                                      </a>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="center">性别：</td>
                                  <td style="text-indent:10">
                                      ${answerMap[answerbbsSingle.bbsAnswerSender].userSex} 
                                  </td>
                              </tr>
                              <tr>
                                  <td align="center">来自：</td>
                                  <td style="text-indent:10">
                                     ${answerMap[answerbbsSingle.bbsAnswerSender].userFrom}
                                  </td>
                              </tr> 
                              <tr>
                                  <td align="center">备注：</td>
                                  <td style="text-indent:10">
                                      ${answerMap[answerbbsSingle.bbsAnswerSender].userPs}
                                  </td>
                              </tr>                             
                          </table>
                      </td>
                      <!-- 回复帖子信息 -->
                      <td width="10%">【表情】<img src="images/face/bbs/${answerbbsSingle.bbsFace}"></td>
                      <td align="right" height="30">回复时间：『${answerbbsSingle.bbsAnswerSendTime}』&nbsp;</td>
                  </tr>
                  <tr height="130"><td colspan="2" valign="top" style="padding-top:6;padding-left:6;padding-right:6;padding-bottom:6">${answerbbsSingle.bbsAnswerContent}</td></tr>
                  <!-- 删除回复帖子超链接 -->
                  <tr height="30" bgcolor="#F9F9F9">
                      <td align="right" colspan="2">
                          ◆<a href="needLogin/admin/deleteAnswer.do?method=deleteAnswerBbs&bbsId=${bbsRootSingle.bbsId}&delbbsAnswerId=${answerbbsSingle.bbsAnswerId}&bbsSender=${answerMap[answerbbsSingle.bbsAnswerSender].userName}">删除回复</a>&nbsp;
                          ◆<a href="openShow.action" >查看根帖</a>&nbsp;
                      </td>            
                  </tr>        
              </table>
              <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3">
                  <tr height="15"><td background="images/index/boardE.jpg"></td></tr>
              </table>
              </s:iterator>         
          </s:else>
      
      <!-- ****************分页导航**************** -->
      <table  border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" >
          <tr height="30">
              <td align="right" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/openShow.do?method=openShow"/>
                  </jsp:include>
              </td>
          </tr>
      </table>
      
      <!-- ****************回复帖子**************** -->
      <table border="1" width="99%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="all">
      <s:form action="needLogin/answerBbs.do" method="post">
          <input type="hidden" name="method" value="answerBbs">
		  <tr bgcolor="#F0F0F0" height="30"><td colspan="2" style="text-indent:5" background="images/index/side_h.png"><b><font color="black">■ 回复【${bbsRootSingle.bbsTitle}】帖子</font></b></td></tr>          
          <tr>
              <td width="27%" bgcolor="#F9F9F9" align="center" valign="top">
                  <table border="0" width="90%" height="100%">
                      <tr>
                      	  <td valign="top">
                      	      <table border="0" width="90%" style="margin-top:10">
                      	          <tr><td>发帖许可</td></tr>
                      	      </table>
                      	  </td>
                      </tr>
                  </table>
              </td>
              <td>
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" rules="rows">
                      <tr height="30">
                          <td width="15%" align="center">【主题】</td>
                          <td align="left">　　<s:textfield name="bbsAnswerTitle" size="77" maxlength="35"></s:textfield></td>
                      </tr>
                      <tr bgcolor="#F9F9F9">
                          <td align="center">【表情】</td>
                          <td><%@ include file="/pages/add/face.jsp" %></td>
                      </tr>
                      <tr height="30">
                          <td align="center">【内容】</td>
                          <td align="center"><%@ include file="/pages/add/font.jsp"%></td>
                      </tr>
                      <tr height="30" bgcolor="#F9F9F9">
                          <td colspan="2" align="right"><%@ include file="/pages/add/count.jsp" %></td>
                      </tr>
                      <tr><td colspan="2" align="center"><s:textarea name="bbsAnswerContent" rows="15" cols="79" styleId="content" onkeydown="check(content,ContentUse,ContentRem,1000)" onkeyup="check(content,ContentUse,ContentRem,1000)" onchange="check(content,ContentUse,ContentRem,1000)"></s:textarea></td></tr>
                      <tr height="30" align="center">
                          <td colspan="2">
                              <s:submit value="回复帖子"></s:submit>
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