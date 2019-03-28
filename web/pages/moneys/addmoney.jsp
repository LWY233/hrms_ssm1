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
				$(".btn").click(function(){
					var str = /\d{4}-(0[1-9]|1[0-2])$/;
					if(str.test($("#mon").val())){
						$("#sub").click();	
					}else{
						alert("请正确填写日期格式！");
					}
				});
			});
	  </script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${path}/index">首页</a></li>
    <li><a href="#">添加薪资</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">添加薪资</a></li> 
    
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <div class="formtext">Hi，<b>${loginUser.uno}</b>，欢迎您使用添加薪资功能！</div>
    
    <ul class="forminfo">
	    <form action="${path}/${urlmain }/form" method="post">
		    <li><label>员工号<b>*</b></label><input name="eno" type="text"  class="dfinput" required="required" placeholder="请填写员工号"  style="width:518px;"/></li>
		   	<li><label>员工姓名<b>*</b></label><input name="ename" type="text"  class="dfinput" required="required" placeholder="请填写员工姓名"  style="width:518px;"/></li>
		  
		    <li><label>基本工资<b>*</b></label><input name="basemoney" type="text" value="0" class="dfinput" required="required"   style="width:518px;"/></li>
		    <li><label>月份<b>*</b></label><input id="mon" name="month" type="text" class="dfinput" required="required" placeholder="格式：2017-01"    style="width:518px;"/></li>
		    <li><label>加班费<b>*</b></label><input name="workOvertime" type="text" value="0" class="dfinput" required="required"   style="width:518px;"/></li>
		    <li><label>补贴费<b>*</b></label><input name="subsidization" type="text" value="0" class="dfinput" required="required"   style="width:518px;"/></li>
		    <input id="upper" name="state" type="hidden" value="0"> 
		     <li><label>薪资发放<b>*</b></label>
		    	<div class="vocation">
				    <select class="select1">
				    	<option value="0">未发</option>
				    	<option value="1">已发</option>
				    </select>
				</div>
		    </li>
		    <li>  <label class="loginlab" style="width:200px">${msg}</label></li>
		  	<input id="sub" type="submit" style="display:none;"/>
		    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="马上添加"/></li>
	
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
