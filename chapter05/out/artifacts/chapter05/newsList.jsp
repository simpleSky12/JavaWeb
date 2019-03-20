<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%--<c:if test="${newsList==null}">--%>
	<%--<c:redirect url="/NewsServlet"></c:redirect>--%>
<%--</c:if>--%>


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
	<jsp:include page="common/top.jsp"></jsp:include>
<!--主体-->
<div id="content" class="main-content clearfix">
	<jsp:include page="common/slide.jsp"></jsp:include>
    <div class="main-content-right">
    <form  action="${pageContext.request.contextPath}/NewsServlet" method="post" id="fm">
        <!--即时新闻-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
		 	          <div>
		 				新闻分类：
			              <select name="categoryId">
				              <option value="0" >全部</option>
				              <c:forEach items="${categories}" var="category">
					              <option value='${category.id}'  <c:if test="${category.id == categoryId}">selected="selected"</c:if> >
						              ${category.name}
					              </option>
				              </c:forEach>
			              </select>
		 				新闻标题<input type="text" name="title" value="${title}"/>
		 					<button type="submit" class="page-btn" id="btn1">GO</button>
		 					<button type="button" onclick="location.href='${pageContext.request.contextPath}/NewsServlet?action=add'" class="page-btn">增加</button>
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
                <c:forEach items="${newsPage.pageData}" var="news" varStatus="status">
	                <c:if test="${news.status==1}">
		                <c:if test="${status.index%2==0}">
			                <tr style="background: pink;">
		                </c:if>
		                <c:if test="${status.index%2!=0}">
			                <tr>
		                </c:if>
		                <td>
			                <a href="${pageContext.request.contextPath}/NewsServlet?id=${news.id}&action=detail">${news.title}</a>
		                </td>
		                <td>${news.author}</td>
		                <td>
			                <fmt:formatDate value="${news.createDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
		                </td>
		                <td>
			                <fmt:formatDate value="${news.modifyDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
		                </td>
		                <td>
			                <a href="${pageContext.request.contextPath}/NewsServlet?id=${news.id}&action=modify">修改</a>
			                <a href="javascript:delNews(${news.id})">删除</a>
		                </td>
		                </tr>
	                </c:if>
                </c:forEach>
	               
                </tbody>
            </table>
           <div class="page-bar">
		       <input type="hidden" value="${newsPage.totalPage}" id="totalPage"/>
				<ul class="page-num-ul clearfix">
					<li>共${newsPage.totalCount}条记录&nbsp;&nbsp;${newsPage.pageNum} / ${newsPage.totalPage}页 </li>
					<li>
						<c:if test="${newsPage.pageNum>1}">
							<a href="javascript:rollPage(1)">首页</a>
							<a href="javascript:rollPage(${newsPage.pageNum-1})">上一页</a>
						</c:if>
						<c:if test="${newsPage.pageNum<newsPage.totalPage}">
							<a href="javascript:rollPage(${newsPage.pageNum+1})">下一页</a>
							<a href="javascript:rollPage(${newsPage.totalPage})">最后一页</a>&nbsp;&nbsp;
						</c:if>
					</li>
				</ul>
			 <span class="page-go-form">
				 <label>跳转至<input type="text" name="pageNum" id="pageNum" class="page-key" value="${newsPage.pageNum}" /></label>页
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
