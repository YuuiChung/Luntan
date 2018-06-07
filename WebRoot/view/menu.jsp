<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String[] weekdays={"","日","一","二","三","四","五","六"};
    String[] days=new String[42];
    for(int i=0;i<42;i++)
    	days[i]="";

    Date currentDay = new Date();
    int year=1900+currentDay.getYear();
    int month=currentDay.getMonth();
    int today=currentDay.getDate();
    int weekday=currentDay.getDay()+1;
    
    String now=year+"年"+(month+1)+"月"+today+"日"+" 星期"+weekdays[weekday];
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>菜单栏</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript">
        function showTime(showWhere){
            var now=new Date();
	        var hour=now.getHours();
	        var minu=now.getMinutes();
	        var sec=now.getSeconds();
         
            if(hour<10) hour="0"+hour;
         	if(minu<10) minu="0"+minu;
         	if(sec<10) sec="0"+sec;
         	
         	showWhere.value=hour+":"+minu+":"+sec;
            setTimeout("showTime(time)",1000)
        }
      </script>
</head>
<body onload="showTime(time)" bgcolor="#F0F0F0">
	<center>
		<table border="0" width="100%" cellspacing="0" cellpadding="0"
			style="margin-top:1">
			<tr height="38">
				<td colspan="2" background="images/index/indexS.jpg">
					<table border="0" width="100%" height="100%" cellspacing="0"
						cellpadding="0">
						<tr height="50%" style="font-size:10pt">

							<td align="left"><div id="nav">
									<ul class="about">
										<li><a href="goIndex.action"></a>
										</li>
										<li><a href="http://www.nfsysu.cn/"></a>
										</li>
										<li><a href="goodListShow.action?showpage=1"></a>
										</li>
										<li><a href="lookMyBbs.action?showpage=1"></a>
										</li>
										<li><a href="user/isAdminLogin.action"></a>
										</li>
									</ul>
									<ul class="black">
										<li>首页</li>
										<li>新闻动态</li>
										<li>精华帖子</li>
										<li>我的帖子</li>
										<li>进入后台</li>
									</ul>
									<div class="nav_bg">
										<ul class="white">
											<li>首页</li>
											<li>新闻动态</li>
											<li>精华帖子</li>
											<li>我的帖子</li>
											<li>进入后台</li>
										</ul>
									</div>
								</div>
							</td>
							<td align="left">时间：<%=now %> <input type="text"
								style="border:0;background-color:#F7F7F7" disable="true"
								id="time" size="9"></td>
						</tr>
					</table></td>
			</tr>
			<tr height="40">
				<td align="left"
					style="background: url(images/index/indexP.jpg) repeat-x"><marquee
						onmouseover=this.stop() onmouseout=this.start() scrollamount="1"
						scrolldelay="10" direction="left" width="470">
						<img src="images/index/pcard.gif"> 欢迎登陆南苑军训乐园，在这我们畅所欲言！！！
					</marquee></td>
			</tr>
			<tr>
				<td><div id="banner">
						<img src="images/index/banner1.jpg" alt="轮播器第一张" /> <img
							src="images/index/banner2.jpg" alt="轮播器第二张" /> <img
							src="images/index/banner3.jpg" alt="轮播器第三张" />
						<ul>
							<li>●</li>
							<li>●</li>
							<li>●</li>
						</ul>
						<span></span> <strong></strong>
					</div>
				</td>
			</tr>
			<s:form action="/user/search.do" method="post">
				<input type="hidden" name="validate" value="yes">
				<tr height="38">
					<td colspan="2" background="images/index/indexS.jpg" align="center">
						<table border="0" width="98%">
							<tr>
								<td width="25%">欢迎登录： <s:if test="#session.logoner == null">
                        		游客，您还没有登录！
                        	</s:if> <s:else>
	                        	${session.logoner.userName}
                        	</s:else></td>
								<td align="right">条件：
								<s:select list="#session.searchSQL" name="subsql" headerKey="" headerValue="--请选择--" ></s:select>
									关键字： <s:textfield name="sqlvalue" size="30" ></s:textfield>
									<s:radio name="searchType" list="%{#{'like':'模糊','all':'精确'}}" ></s:radio>
									  <s:submit
										value=" "
										style="background-image:url('images/index/bs.jpg');width:49;height:21;border:0" ></s:submit>
								</td>
							</tr>
						</table></td>
				</tr>
			</s:form>
		</table>
	</center>
</body>
</html>