<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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