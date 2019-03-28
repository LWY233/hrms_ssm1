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
			$(function(){
				$(".select1").change(function(){
					var upperno = $(".select1 option:selected").val();
					$("#upper").val(upperno);
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
    <li><a href="#tab1" class="selected">添加部门</a></li> 
    
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <div class="formtext">Hi，<b>${loginUser.uno}</b>，欢迎您使用添加部门功能！</div>
    
    <ul class="forminfo">
	    <form action="${path}/department/form" method="post" id="">
		    <li><label>部门名称<b>*</b></label><input name="dname" type="text" value="${name}" class="dfinput" required="required" placeholder="请填写部门名称"  style="width:518px;"/><label class="loginlab" style="width:120px;">${dname}</label></li>
		   	
		    <li><label>上级部门<b>*</b></label>
		    	<div class="vocation">
				    <select class="select1">
				    	<option value="">请选择上级部门</option>
				    	<option value="无">无上级部门</option>
				    	<c:forEach items="${depart}" var="dep">
						    <option value="${dep.dname}">${dep.dname}</option>
				    	</c:forEach>
				    </select>
				</div><label class="loginlab" style="width:120px;">${upper}</label>
		    </li>
		    <input type="hidden" id="upper" name="upperno" value=""/>
		    <li><label>部门电话<b>*</b></label><input name="mobile" type="text" value="${mob}" class="dfinput" required="required" placeholder="请填写电话号码"  style="width:518px;"/></li>
		    <label class="loginlab">${msg}</label>
		    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="马上添加"/></li>
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
