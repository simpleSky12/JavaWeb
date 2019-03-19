<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>新闻系统</title>
	<link type="text/css" rel="stylesheet" href="css/common.css"/>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>

<body>
<!--页面顶部-->
<div id="header">
    <div class="main-top">
        <div class="logo"><a href=""><span>新闻大视野</span></a></div>

        <div class="nav">
            <ul class="clearfix">
                <li><a href="#">首页</a></li>
                <li><a href="#">国内</a></li>
                <li><a href="#">国际</a></li>
                <li><a href="#">娱乐</a></li>
                <li><a href="#">军事</a></li>
            </ul>
        </div>
    </div>
    <!--banner-->
    <div class="main-banner">
    <img src="images/banner.png" />
    </div>
    <!--管理工具栏-->
    <div class="admin-bar">
        <span class="fr">退出账户</span>
        管理员：
    </div>
</div>
<!--页面的主体-->
<div id="content" class="main-content clearfix">
	<!--主体的的左边部分-->
	<div class="main-content-left">
        <!--新闻管理-->
        <div class="class-box">
            <div class="class-box-header">
                <h3>新闻管理</h3>
            </div>
            <div class="class-box-content">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/newsList.jsp">新闻管理</a></li>
                    <li class="clear-bottom-line"><a href="#">最新新闻</a></li>
                </ul>
            </div>
        </div>
        <!--//-->
        <!--主题管理-->
        <div class="class-box">
            <div class="class-box-header">
                <h3>分类管理</h3>
            </div>
            <div class="class-box-content">
                <ul>
                    <li><a href="#">分类管理</a></li>
                    <li class="clear-bottom-line"><a href="#">删除主题</a></li>
                </ul>
            </div>
        </div>
        <!--//-->
        <!--账户管理-->
        <div class="class-box">
            <div class="class-box-header">
                <h3>用户管理</h3>
            </div>
            <div class="class-box-content">
                <ul>
                    <li><a href="#">用户管理</a></li>
                    <li class="clear-bottom-line"><a href="#">付费服务</a></li>
                </ul>
            </div>
        </div>
        <!--//-->
    </div>
    <!--页面主体的右部，包括新闻的明细内容和评论内容 -->
    <div class="main-content-right">
        <!--各专题的新闻列表-->
        <div class="main-text-box">
            <div class="article-place"><a href="#">新闻中心</a> > <a href="#">国内</a></div>
      		<div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <div class="article-box">
                    	<!--新闻的标题-->
                        <c:out value="<h1>${title}</h1>" escapeXml="false"></c:out>
                        
                        <div class="source-bar">发布者：${people}  分类：国内  更新时间：2017-09-18</div>
                        <div class="article-content">
                            <span class="article-summary"><b>摘要：</b><c:out value="${title}</span>${title}" escapeXml="false"></c:out>
                        </div>
                        <div class="comment">
                            <dl>
                                <dt class="comment-top">
                                    <span class="fr">2011-09-25 13:33:55</span>
                                    <b>1楼</b> <b>水上漂</b>
                                </dt>
                                <dd class="comment-body">
                                    爱北京，爱中国！
                                </dd>
                            </dl>
                            <dl>
                                <dt class="comment-top">
                                    <span class="fr">2011-09-25 13:33:55</span>
                                    <b>2楼</b> <b>拉娜</b>
                                </dt>
                               <dd class="comment-body">
                                    中国人雄起！
                                </dd>
                            </dl>
                        </div>
                        <div class="comment-form">
                            <div class="comment-form-header">
                                <span>用户：Landodo</span>
                                <h3>发表评论：</h3>
                            </div>
                            <div class="comment-form-content">
                                <textarea class="comment-textarea"></textarea>
                                <button type="submit" class="comment-btn">评论</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--//-->
        
    </div>
</div>
<!--页面底部-->
<div class="main-footer-box">
    24小时客户服务热线：010-68988888 常见问题解答 新闻热线：010-627488888<br />
    文明办网文明上网举报电话：010-627488888 举报邮箱：jubao@bj-aptech.com.cn<br />
    Coyright&copy;1999-2007 News China gov,All Right Reserved.<br />
    新闻中心版权所有
</div>
</body>
</html>