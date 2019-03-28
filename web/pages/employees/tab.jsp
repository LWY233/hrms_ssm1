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
    <li><a href="#">添加人员</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">添加人员</a></li> 
    
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <div class="formtext">Hi，<b>${loginUser.uno}</b>，欢迎您使用添加人员功能！</div>
    
    <ul class="forminfo">
	    <form action="${path}/employees/form" method="post">
		   	
		    <li><label>员工姓名<b>*</b></label><input name="ename" type="text" value="" class="dfinput" placeholder="请填写员工姓名" required="required" style="width:518px;"/></li>
		    
		    <li><label>性别<b>*</b></label><input name="esex" type="text" value="" class="dfinput" placeholder="请填写性别" required="required" style="width:518px;"/></li>
		    
		    <li><label>民族<b>*</b></label><input name="nationality" type="text" value="" class="dfinput" placeholder="请填写民族" required="required" style="width:518px;"/></li>
	 		
	 		<li><label>出生日期<b>*</b></label><input name="brity" type="text" value="" class="dfinput" placeholder="请填写出生日期" required="required" style="width:518px;"/></li>
		    
		    <li><label>政治面貌<b>*</b></label><input name="politicalParty" type="text" value="" class="dfinput" placeholder="请填写政治面貌" required="required" style="width:518px;"/></li>
		    
		    <li><label>文化程度<b>*</b></label><input name="cultureLevel" type="text" value="" class="dfinput" placeholder="请填写文化程度" required="required" style="width:518px;"/></li>
		    
		    <li><label>籍贯<b>*</b></label><input name="familyPlace" type="text" value="" class="dfinput" placeholder="请填写籍贯" required="required" style="width:518px;"/></li>
		     
		    <li><label>身份证号<b>*</b></label><input name="idCard" type="text" value="" class="dfinput" placeholder="请填写身份证号" required="required" style="width:518px;"/></li>
		    
		    <li><label>电话<b>*</b></label><input name="mobile" type="text" value="" class="dfinput" placeholder="请填写电话号码" required="required" style="width:518px;"/></li>
		    
		    <li><label>所在部门<b>*</b></label>
		    	<div class="vocation">
				    <select class="select1">
				    	<option value="">请选择所在部门</option>
				    	<c:forEach items="${depart}" var="dep">
						    <option value="${dep.did}">${dep.dname}</option>
				    	</c:forEach>
				    </select>
				</div><label class="loginlab" style="width:120px;">${upper}</label>
		    </li>
		    
		    <li><label>到岗日期<b>*</b></label><input name="hiredate" type="text" value="" class="dfinput" placeholder="请填写到岗日期" required="required" style="width:518px;"/></li>
		    
		    <li><label>职务<b>*</b></label><input name="title" type="text" value="" class="dfinput" placeholder="请填写职务" required="required" style="width:518px;"/></li>
		     	    
		    <input type="hidden" id="upper" name="did" value=""/>
		    
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
