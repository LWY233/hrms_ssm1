<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
	<link href="${path}/static/css/style.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="${path}/static/js/jquery.js"></script>
	<script src="${path}/static/js/cloud.js" type="text/javascript"></script>
	
	<script language="javascript">
		$(function(){
            $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	        });
	    });
	</script> 
	
  </head>

<body style="background-color:#1c77ac; background-image:url(${path}/static/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    <form action="${path}/login" method="post">
    <ul>
    	<li><input name="uno" required="required" type="text" class="loginuser" placeholder="用户名"/></li>
    	<li><input name="password" required="required" type="password" class="loginpwd" placeholder="密码" /></li>
    	<label class="loginlab">${msg}</label>
    	<li><input name="" type="submit" class="loginbtn" value="登录"/></li>
    </ul>
    </form>
    
    </div>
    
    </div>
    <div class="loginbm">Copyright © 2010-2019 思软淘官方网站，<a>山西思软科技有限公司</a> All Rights Reserved 晋B2-20080069号</div>
</body>
</html>

