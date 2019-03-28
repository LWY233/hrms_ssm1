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
    <li><a href="#">修改奖罚金</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">修改奖罚金</a></li> 
    
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <div class="formtext">Hi，<b>${loginUser.uno}</b>，欢迎您使用修改薪资功能！</div>
    
    <ul class="forminfo">
	    <form action="${path}/${urlmain }/form2" method="post">
		    <li><label>员工号<b>*</b></label><input name="eno" type="text" readonly="readonly" class="dfinput" required="required" value="${rap.employees.eno} " style="width:518px;"/></li>
		   	<li><label>员工姓名<b>*</b></label><input name="ename" type="text" readonly="readonly" class="dfinput" required="required" value="${rap.employees.ename} "  style="width:518px;"/></li>
		    <li><label>日期<b>*</b></label><input name="month" type="text" value="${rap.month} " class="dfinput" required="required"   style="width:518px;"/></li>
		    <li><label>奖金<b>*</b></label><input name="reward" type="text" value="${rap.reward}" class="dfinput"   style="width:518px;"/></li>
		    <li><label>罚金<b>*</b></label><input name="punishment" type="text" value="${rap.punishment}" class="dfinput" style="width:518px;"/></li>
		    <li><label>理由<b>*</b></label><input name="because" type="text" value="${rap.because}" class="dfinput" required="required" style="width:518px;"/></li>
		   
		    <li>  <label class="loginlab" style="width:200px">${msg}</label></li>
		  <input type="hidden" name="id" value="${rap.id }">
		  <input type="hidden" name="eid" value="${rap.eid }">
		  <input type="hidden" name="beforedate" value="${rap.month }">
		  
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="修改"/> <label>&nbsp;</label><button onclick="JavaScript:history.back(-1)" class="btn">返回</button></li>
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
