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
		
		$(function(){
			$(".search").click(function(){
				$('[name=page]').val($(this).attr("data-page"));  //点击哪个页面 就赋值 哪个 页面的 data-page  给 input hidden
				$("#forminfo").submit();
			});
		});
	</script>
</head>


<body>
	
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${path}/index">首页</a></li>
    <li><a href="#">请假信息</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
    	<c:if test="${loginUser.userType<3}">
        	<li><a href="${path}/checkin/form"><span><img src="${path}/static/images/t01.png" /></span>添加</a></li>
        </c:if>
        </ul>
        
    
    </div>
    
    <form action="${path}/${url}" method="post" id="forminfo">
    	<ul class="seachform">
		    <li><label>请假人编号</label><input name="eno" value="" type="text" class="scinput" /></li>
		
		    <li><label>请假人姓名</label><input name="name" value="" type="text" class="scinput" /></li>
		    
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li> 
	    </ul>
    	<input type="hidden" id="page" name="page"/>
    </form>
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>假条编号<i class="sort"><img src="${path}/static/images/px.gif" /></i></th>
        <th>请假人</th>
        <th>请假人编号</th>
        <th>所在部门</th>
        <th>请假事由</th>
        <th>状态</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${datas.data}" var="lea">
        	<tr>
        		<td>${lea.id}</td>
        		<td>${lea.name}</td>
        		<td>${lea.eno}</td>
        		<td>${lea.departments.dname}</td>
        		<td>${lea.because}</td>
        		<td>${lea.state}</td>
        		<td>
        			<a href="${path}/leave/check?id=${lea.id}" class="tablelink">查看</a>  
        			<c:if test="${loginUser.userType<3}">  
        				<a href="javascript:if(confirm('确定要删除该数据吗?')){window.location.href='${path}/leave/delete?id=${lea.id}'}" class="tablelink"> 删除</a>
        			</c:if> 
        		</td>
        	</tr>
        </c:forEach>
        </tbody>
    </table>
    <br/>
    <jsp:include page="../common/numpage.jsp"></jsp:include>
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
