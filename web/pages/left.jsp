<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
  	<link href="${path}/static/css/style.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${path}/static/js/jquery.js"></script>

	<script type="text/javascript">
	$(function(){	
		//导航切换
		$(".menuson li").click(function(){
			$(".menuson li.active").removeClass("active");
			$(this).addClass("active");
		});
		
		$('.title').click(function(){
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if($ul.is(':visible')){
				$(this).next('ul').slideUp();
			}else{
				$(this).next('ul').slideDown();
			}
		});
	});
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>菜单栏</div>
    
    <dl class="leftmenu">
        
    <c:forEach items="${menus}" var="menu">
    	<dd><div class="title"><span><img src="${path}/static/images/leftico04.png" /></span>${menu.title}</div>
			<c:if test="${!empty menu.childs}">
				<ul class="menuson">
					<c:forEach items="${menu.childs}" var="menuchild">
			        	<li><cite></cite><a href="${path}/${menuchild.code}" target="rightFrame">${menuchild.title}</a><i></i></li>
			        </c:forEach>
			    </ul>
 			</c:if>
		</li>
	</c:forEach> 
    </dl>
</body>
</html>