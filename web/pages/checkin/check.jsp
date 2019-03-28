<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE>
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
				$(".btn").click(function(){
					if($("#state").val()=="未审核"){
						$("#state").val("已审核");
						$("#forminfo").submit();
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
    <li><a href="#">审核假条</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>审核中</span></div>
    <form action="${path}/leave/update" method="post" id="forminfo">
	    <ul class="forminfo">
		    <li><label>假条编号<b>*</b></label><input name="id" type="text" class="dfinput" value="${leave.id}" readonly="readonly"/></li>
		    <li><label>姓名<b>*</b></label><input name="" type="text" class="dfinput" value="${leave.name}" readonly="readonly"/></li>
		    <li><label>所在部门<b>*</b></label><input name="" type="text" class="dfinput" value="${leave.departments.dname}" readonly="readonly"/></li>
		    <li><label>请假区间<b>*</b></label>
		    	开始日期：<input name="" type="text" class="dfinput" style="width:200px;" value="${leave.fromday}" readonly="readonly"/>
		    	结束日期：<input name="" type="text" class="dfinput" style="width:200px;" value="${leave.today}" readonly="readonly"/>
		    </li>
		    <li><label>请假理由<b>*</b></label><textarea id="" name="" cols="" rows="" class="textinput" readonly="readonly">${leave.because}</textarea></li>
		    <li><label>审核状态<b>*</b></label><input id="state" name="state" type="text" class="dfinput" value="${leave.state}" readonly="readonly"/></li>
		    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="审核通过"/><input style="margin-left: 50px;" name="" type="button" onclick="JavaScript:history.back(-1)" class="btn" value="返回"/></li>
	    </ul>
	</form>
    </div>
</body>
</html>

