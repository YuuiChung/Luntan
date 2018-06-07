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

<title>首页中内容显示区中的内容</title>

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
		<table border="0" width="100%" cellspacing="0" cellpadding="0"
			style="margin-top:8">
			<s:iterator id="classSingle" value="#session.classType">
				<tr>
					<td>
						<table rules="none" border="1" width="100%" cellspacing="0"
							cellpadding="3" bordercolor="lightgrey">
							<tr height="30">
								<td style="text-indent:5" background="images/index/side_h.png"><b><font
										color="black">■ ${classSingle.className }</font>
								</b>
								</td>
							</tr>
							<tr bgcolor="#F9F9F9">
								<td height="60" align="center"><s:if
										test="#session.mapBoard[#classSingle.classId].size() == 0">
										<li>该论坛类别暂无版面显示！</li>
									</s:if> <s:else>
										<s:iterator id="boardSingle"
											value="#session.mapBoard[#classSingle.classId]">
											<table border="1" width="100%" cellspacing="0"
												cellpadding="4" bgcolor="#F9F9F9" bordercolor="#EEEEEE"
												rules="cols">
												<tr height="35">
													<td align="center" width="60" rowspan="2"><img
														src="images/index/logo.jpg">
													</td>
													<td><img src="images/index/btitle.jpg"> <a
														href="listShow.action?showpage=1&classId=${classSingle.classId}&boardId=${boardSingle.boardId}&boardPcard=${boardSingle.boardPcard}"
														style="underline" title="进入版面！">${boardSingle.boardName}</a>
													</td>
													<td rowspan="2" width="20%" align="center">
														<table border="0" width="90%" cellspacing="3"
															cellpadding="0">
															<tr>
																<td>帖子总数：<b><font color="blue">${boardSingle.boardBbsnum}</font>
																</b>
																</td>
															</tr>
															<tr>
																<td>精华帖子：<b><font color="green">${boardSingle.boardBbsgoodnum}</font>
																</b>
																</td>
															</tr>
															<tr>
																<td>未 回 复：<b><font color="red">${boardSingle.boardBbsundonum}</font>
																</b>
																</td>
															</tr>
														</table></td>
												</tr>
												<tr height="25" background="images/index/masterB.jpg">
													<td style="text-indent:60"><img
														src="images/index/master.jpg"> <a
														href="getUserSingle.action?userName=${boardSingle.boardMaster}">
															版主：${boardSingle.boardMaster} </a>
													</td>
												</tr>
											</table>
										</s:iterator>
									</s:else></td>
							</tr>
							<tr height="25">
								<td style="text-indent:10" background="images/index/boardE.jpg"><font
									color="#F9F9F9)">论坛介绍：${classSingle.classIntro}</font>
								</td>
							</tr>
						</table></td>
				</tr>
				<tr height="3">
					<td></td>
				</tr>
			</s:iterator>
		</table>
	</center>
</body>
</html>