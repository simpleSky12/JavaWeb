<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<jsp:include page="common/top.jsp"></jsp:include>
<!--页面的主体-->
<div id="content" class="main-content clearfix">
	<!--主体的的左边部分-->
    <jsp:include page="common/slide.jsp"></jsp:include>
    <!--页面主体的右部，包括新闻的明细内容和评论内容 -->
    <div class="main-content-right">
        <!--各专题的新闻列表-->
        <div class="main-text-box">
            <div class="article-place"><a href="#">新闻中心</a> > <a href="#">国内</a></div>
      		<div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <div class="article-box">
                    	<!--新闻的标题-->
                        <h1>${news.title}</h1>
                        <div class="source-bar">
                            发布者：${news.author}  分类：${category}  更新时间：<fmt:formatDate value="${news.createDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                        </div>
                        <div class="article-content">
                            <span class="article-summary"><b>摘要：</b>${news.summary}</span>
	                        <c:if test="${!(empty news.picPath)}">
		                        <img onclick="location='${pageContext.request.contextPath}/NewsServlet?action=download&fileName=${news.picPath}'" src="${pageContext.request.contextPath}/upload/${news.picPath}" width="540"/><br/>
	                        </c:if>
                            ${news.content}
                        </div>
                        <div class="comment">
                            <c:forEach items="${comments}" var="comment">
                                <c:if test="${comment.newsId == news.id}">
                                    <dl>
                                        <dt class="comment-top">
                                        <span class="fr">
                                            <fmt:formatDate value="${comment.createDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                        </span>
                                            <b>${comment.ip}</b> <b>${comment.author}</b>
                                        </dt>
                                        <dd class="comment-body">
                                                ${comment.content}
                                        </dd>
                                    </dl>
                                </c:if>
                            </c:forEach>
                        </div>
                        <form action="${pageContext.request.contextPath}/ComServlet?newsId=${news.id}&userName=${loginUser.userName}&ip="  method="post" class="comment-form">
                            <div class="comment-form-header">
                                <span>用户：${loginUser.userName}</span>
                                <h3>发表评论：</h3>
                            </div>
                            <div class="comment-form-content">
                                <textarea class="comment-textarea" name="txt"></textarea>
                                <button type="submit" class="comment-btn" style="color: black; border: 1px solid lawngreen;">评论</button>
                            </div>
                        </form>
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