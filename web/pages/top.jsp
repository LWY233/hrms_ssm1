<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<link href="${path}/static/css/style.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${path}/static/js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		});	
	});	
	</script>


</head>

<body style="background:url(${path}/static/images/topbg.gif) repeat-x;">

    <div class="topleft">
        <a href="main.html" target="_parent"><img src="${path}/static/images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
        <c:if test="${loginUser.userType<3}">
            <li><a href="${path}/default" target="rightFrame" class="selected"><img src="${path}/static/images/icon01.png" title="" /><h2>工作台</h2></a></li>
        </c:if>
        <li><a href="${path}/department/search" target="rightFrame"><img src="${path}/static/images/icon02.png" title="" /><h2>部门管理</h2></a></li>
        <li><a href="${path}/money/show"  target="rightFrame"><img src="${path}/static/images/icon03.png" title="" /><h2>薪资管理</h2></a></li>
        <li><a href="${path}/rap/show"  target="rightFrame"><img src="${path}/static/images/icon04.png" title="" /><h2>奖惩管理</h2></a></li>
        <li><a href="${path}/checkin/leave" target="rightFrame"><img src="${path}/static/images/icon05.png" title="" /><h2>请假记录</h2></a></li>
        <li><a href="${path}/employees/search"  target="rightFrame"><img src="${path}/static/images/icon06.png" title="" /><h2>人员查询</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="${path}/static/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="${path}/logout" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${loginUser.uno}</span>
    
    </div>    
    
    </div>
</body>
</html>

