<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>新闻系统</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    
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
<!--主体-->
<div id="content" class="main-content clearfix">
    <jsp:include page="common/slide.jsp"></jsp:include>
    <div class="main-content-right">
        <form action="${pageContext.request.contextPath}/NewsServlet?id=${news.id}" method="post">
	        <input type="hidden" name="action" value="modifyTo"/>
            <p>新闻标题： <input type="text" name="title" value="${news.title}"/></p>
            <p>
                新闻分类：
                <select name="categoryId">
				    <c:forEach items="${categories}" var="category">
					    <option value='${category.id}' <c:if test="${news.categoryId == category.id}"> selected="selected" </c:if> >${category.name}</option>
				    </c:forEach>
                </select>
            </p>
            <p>新闻摘要： <input type="text" name="summary"  value="${news.summary}"/></p>
            <p>新闻内容：
                <textarea rows="10" cols="20" name="content" class="ckeditor" >${news.content}</textarea>
            </p>
            <p>作者：${news.author}</p>
            <input type="submit" value="提交"/>
        </form>
   </div>
</div>
<!--底部-->
<div class="main-footer-box">
    24小时客户服务热线：010-68988888 常见问题解答 新闻热线：010-627488888<br />
    文明办网文明上网举报电话：010-627488888 举报邮箱：jubao@bj-aptech.com.cn<br />
    Coyright&copy;1999-2007 News China gov,All Right Reserved.<br />
    新闻中心版权所有
</div>
  </body>
</html>
