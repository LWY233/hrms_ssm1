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
	<script type="text/javascript" src="${path}/static/js/jquery.js"></script>
	<script type="text/javascript">
		function showTime(){
			var curTime = new Date();
			$("#date").html(curTime.toLocaleString());
			setTimeout("showTime()", 1000);
		}
		$(function(){
			showTime();	
		});
	</script>
</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <span><img src="${path}/static/images/sun.png" alt="天气" /></span>
    <b>${loginUser.uno}早上好，欢迎使用信息管理系统</b>
    <a href="${path}/users/modify">帐号设置</a>
    </div>
    
    <div class="welinfo">
    <span><img src="${path}/static/images/time.png" alt="时间" /></span>
    <i><span>当前时间：</span><span id="date"></span></i>
    </div>
    
    <div class="xline"></div>
    
    <ul class="iconlist">
    
    <li><img src="${path}/static/images/ico01.png" /><p><a href="${path}/department/search">部门管理</a></p></li>
    <li><img src="${path}/static/images/ico02.png" /><p><a href="${path}/checkin/form">请假表</a></p></li>
    <li><img src="${path}/static/images/ico03.png" /><p><a href="${path}/money/show">薪资管理</a></p></li>
    <li><img src="${path}/static/images/ico04.png" /><p><a href="${path}/rap/show">奖惩管理</a></p></li>
    <li><img src="${path}/static/images/ico05.png" /><p><a href="${path}/checkin/leave">请假记录</a></p></li>
    <li><img src="${path}/static/images/ico06.png" /><p><a href="${path}/employees/search">人员查询</a></p></li> 
            
    </ul>
    
    <div class="xline"></div>
    <div class="box"></div>
    
    <div class="welinfo">
    <span><img src="${path}/static/images/dp.png" alt="提醒" /></span>
    <b>信息管理系统使用指南</b>
    </div>
    
    <ul class="infolist">
    <li><span>您可以快速进行查询个人信息操作</span></li>
    <li><span>您可以快速查看个人奖罚和薪资信息</span></li>
    <li><span>您可以进行密码修改、账户设置等操作</span></li>
    </ul>
    
    <div class="xline"></div>
    
</body>
</html>

