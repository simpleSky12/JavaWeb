<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script type="text/javascript">
	function delNews(id){
		var res=confirm("确定删除这一条新闻吗？");
		if(res){
			location.href="${pageContext.request.contextPath}/NewsServlet?action=del&id="+id;
		}else{
			return false;
		}
	}
	function goPage(){
		//跳转页码验证
		var pageNum=document.getElementById("pageNum").value;
		pageNum=parseInt(pageNum);//^\d+$
		if(isNaN(pageNum)){//判断是否为数字
			alert("请输入一个数字！");
			return false;//阻止表单提交
		}
		if(pageNum<=0){
			alert("请输入一个正整数！");
			return false;//阻止表单提交
		}
		//获取总页数
		var totalPage=parseInt(document.getElementById("totalPage").value);
		if(pageNum>totalPage){
			alert("一共只有"+totalPage+"页！");
			return false;//阻止表单提交
		}
	}
	function rollPage(page){
		var pageNum=document.getElementById("pageNum");
		pageNum.value=page;//将需要跳转的页码设置到pageNum文本框中，以便向服务器后台提交
		var fm=document.getElementById("fm");
		//提交表单
		fm.submit();
	}
</script>
  
  
  
  <body>
  <%
	  session.setAttribute("title","习大大访美");
	  session.setAttribute("people","习大大");
	  session.setAttribute("title2","习近平要求广大干部夯实\"四基\" 站稳人民立场");
	  session.setAttribute("title3","男子花550万元买豪车 因这事2年后倒赚1650万");
	  session.setAttribute("date1","2008-01-01");
  %>
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
    <form  action="${pageContext.request.contextPath}/newsDetail.jsp" method="post" id="fm">
        <!--即时新闻-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                
		 	          <div>
		 				新闻分类：
		 					<select name="categoryId">
		 							<option value="0">全部</option>
		 							<option value='1' >国内</option>
			        				<option value='2' >国际</option>
			        				<option value='3' >娱乐</option>
			        				<option value='4' >军事</option>
			        				<option value='5' >财经</option>
			        				<option value='6' >天气</option>
	        				</select>
		 				新闻标题<input type="text" name="title"/>
		 					<button type="submit" class="page-btn">GO</button>
		 					<button type="button" onclick="location.href='${pageContext.request.contextPath}/addnews.jsp'" class="page-btn">增加</button>
		 			</div>
			<table cellpadding="1" cellspacing="1" class="admin-list">
				<thead >
					<tr class="admin-list-head">
						<th>新闻标题</th>
                        <th>作者</th>
                        <th>发布时间</th>
                        <th>修改时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                 <tr>
                	<td><a href="${pageContext.request.contextPath}/newsDetail.jsp?id=1">${title}</a></td>
                		<td>${people}</td>
                		<td>${date1}</td>
                		<td>${date1}</td>
                		<td><a href="${pageContext.request.contextPath}/editnews.jsp?id=1">修改</a>
                			<a href="javascript:delNews(1)">删除</a>
                		</td>
                	</tr>
                 <tr>
                	<td><a href="${pageContext.request.contextPath}/newsDetail.jsp?id=1">${title2}</a></td>
                		<td>${people}</td>
                		<td>${date1}</td>
                		<td>${date1}</td>
                		<td><a href="${pageContext.request.contextPath}/editnews.jsp?id=1">修改</a>
                			<a href="javascript:delNews(1)">删除</a>
                		</td>
                	</tr>
                 <tr>
	                 <td><a href="${pageContext.request.contextPath}/newsDetail.jsp?id=1">${title3}</a></td>
	                 <td>${people}</td>
	                 <fmt:formatDate value="${date1}" pattern="yyyy.MM.dd" />
	                 <td>${date1}</td>
	                 <td>${date1}</td>
	                 <td><a href="${pageContext.request.contextPath}/editnews.jsp?id=1">修改</a>
		                 <a href="javascript:delNews(1)">删除</a>
	                 </td>
                	</tr>
                </tbody>
            </table>
           <div class="page-bar">
           <input type="hidden" value="" id="totalPage"/>
			<ul class="page-num-ul clearfix">
				<li>共1条记录&nbsp;&nbsp;1 / 1页 </li>
				<li>
					<a href="javascript:rollPage(1)">首页</a>
					<a href="javascript:rollPage(1)">上一页</a>
					<a href="javascript:rollPage(1)">下一页</a>
					<a href="javascript:rollPage(1)">最后一页</a>&nbsp;&nbsp;
				</li>
			</ul>
		 <span class="page-go-form">
			 <label>跳转至<input type="text" name="pageNum" id="pageNum" class="page-key" /></label>页
		     <button type="submit" class="page-btn" onclick="return goPage();">GO</button>
		</span>
	     
	     </div>
		</div> 
        </div>
       </div>
     </form>
   </div>
   </div>
    
<!--底部-->
<div class="main-footer-box">
    24小时客户服务热线：010-68988888 常见问题解答 新闻热线：010-627488888<br />
    文明办网文明上网举报电话：010-627488888 举报邮箱：jubao@bj-aptech.com.cn<br />
    Coyright&copy;1999-2007 News China gov,All Right Reserved.<br />
    新闻中心版权所有<br />

</div>
  
  </body>
</html>
