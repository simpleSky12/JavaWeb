
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
		<a href="${pageContext.request.contextPath}/LogoutServlet" class="fr">退出账户</a>
		管理员：${loginUser.userName}
	</div>
</div>

</html>
