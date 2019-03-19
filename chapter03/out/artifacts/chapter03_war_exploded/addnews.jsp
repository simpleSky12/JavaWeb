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
    <img src="${pageContext.request.contextPath}/images/banner.png" />
    </div>

    <!--管理工具栏-->
    <div class="admin-bar">
        <span class="fr"><a href="${pageContext.request.contextPath}/LogoutServlet">退出账户</a></span>
        管理员： ${loginUser}
    </div>
</div>
<!--主体-->
<div id="content" class="main-content clearfix">
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
    <div class="main-content-right">
        <form action="${pageContext.request.contextPath}/action/addNewsAction.jsp" method="post" enctype="multipart/form-data">
        		<p>新闻标题： <input type="text" name="title"/></p>
        		<p>
        			新闻分类：
		 					<select name="categoryId">
		 					
			        				<option value='1' >国内</option>
			        			
			        				<option value='2' >国际</option>
			        			
			        				<option value='3' >娱乐</option>
			        			
			        				<option value='4' >军事</option>
			        			
			        				<option value='5' >财经</option>
			        			
			        				<option value='6' >天气</option>
			        			
	        				</select>
        		</p>
        		<p>新闻摘要： <input type="text" name="summary"/></p>
        		<p>新闻内容：
        			<textarea rows="10" cols="20" name="content" class="ckeditor"></textarea>
        		</p>
        		<p>新闻图片：<input type="file" name="pic"/></p>
        		<p>作者：${loginUser}</p>
        		<input type="submit"/>
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
