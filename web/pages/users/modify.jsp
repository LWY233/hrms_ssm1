<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<link href="${path}/static/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${path}/static/css/select.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${path}/static/js/jquery.js"></script>
	<script type="text/javascript" src="${path}/static/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="${path}/static/js/select-ui.min.js"></script>
	<script type="text/javascript" src="${path}/static/editor/kindeditor.js"></script>
	<script type="text/javascript">
			$(document).ready(function(e) {
			    $(".select1").uedSelect({
					width : 345			  
				});
			});
	  </script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${path}/index">首页</a></li>
    <li><a href="#">添加部门</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">修改密码</a></li> 
    
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <div class="formtext">Hi，<b>${loginUser.uno}</b>，欢迎您使用修改密码功能！</div>
    
    <ul class="forminfo">
	    <form action="${path}/users/update" method="post" id="">
		    <li><label>用户：<b></b></label><input name="uno" type="text" value="${loginUser.uno}" class="dfinput" required="required" style="width:518px;"/></li>
		   	<input type="hidden" name="uid" value="${loginUser.uid}">
		   	<li><label>原始密码：<b></b></label><input name="pwd" type="password" value="" class="dfinput" required="required" style="width:518px;"/></li>

		    <li><label>新密码：<b></b></label><input name="password" type="password" value="" class="dfinput" required="required" style="width:518px;"/></li>
		    <label class="loginlab">${msg}</label>
		    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认修改"/><input style="margin-left: 50px;" name="" type="button" onclick="JavaScript:history.back(-1)" class="btn" value="返回"/></li>
	   	</form>
    </ul>
    
    </div>    
	</div> 
 
	<script type="text/javascript"> 
      	$("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    </div>

</body>
</html>
