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
		$(document).ready(function(){
		  $(".click").click(function(){
		  $(".tip").fadeIn(200);
		  });
		  
		  $(".tiptop a").click(function(){
		  $(".tip").fadeOut(200);
		});
		
		  $(".sure").click(function(){
		  $(".tip").fadeOut(100);
		});
		
		  $(".cancel").click(function(){
		  $(".tip").fadeOut(100);
		});
		
		});
	</script>


</head>


<body>
	
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${path}/index">首页</a></li>
    <li><a href="#">部门查询</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
    	<c:if test="${loginUser.userType<3}">
        	<li><a href="${path}/department/add"><span><img src="${path}/static/images/t01.png" /></span>添加</a></li>
        </c:if>
        </ul>
       
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>部门编号<i class="sort"><img src="${path}/static/images/px.gif" /></i></th>
        <th>部门名称</th>
        <th>部门人数</th>
        <th>上级部门</th>
        <th>电话</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${depart}" var="de">
        	<tr>
        		<td>${de.did}</td>
        		<td>${de.dname}</td>
        		<td>${de.dnum}</td>
        		<td>${de.upperno}</td>
        		<td>${de.mobile}</td>
        		<td>
        			<a href="${path}/department/depart?did=${de.did}" class="tablelink">查看</a>  
        			<c:if test="${loginUser.userType<3}">  
        				<a href="javascript:if(confirm('确定要删除该数据吗?')){window.location.href='${path}/department/delete?did=${de.did}'}" class="tablelink"> 删除</a>
        			</c:if> 
        		</td>
        	</tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="${path}/static/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
