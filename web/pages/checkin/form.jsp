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
				$(".select1").change(function(){
					var upperno = $(".select1 option:selected").val();
					$("#upper").val(upperno);
				});
				
				$(".btn").click(function(){
					$("#daynumber").val(Math.abs((Date.parse($("#endDate").val())-Date.parse($("#stateDate").val()))/86400000));
					if($(".select1").val()==""){
						alert("请选择所在部门！");
					}else if($("[name='eno']").val()==""&&$("[name='name']").val()==""&&$("[name='because']").val()==""){
						alert("星号所标识的不能省略！");
					}else if($("#stateDate").val()<$("#endDate").val()&&$("#stateDate").val()>=new Date().toLocaleDateString().replace("/", "-").replace("/", "-")){
						$("#forminfo").submit();
					}else{
						alert("开始日期应小于结束日期并且大于等于今天！");
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
    <li><a href="#">请假表</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>请假表</span></div>
    <form action="${path}/leave/leave" method="post" id="forminfo">
	    <ul class="forminfo">
		    <li><label>员工编号<b>*</b></label><input name="eno" type="text" class="dfinput" /></li>
		    <li><label>姓名<b>*</b></label><input name="name" type="text" class="dfinput" /></li>
		    <li><label>所在部门<b>*</b></label>
		    	<div class="vocation">
				    <select class="select1">
				    	<option value="">请选择所在部门</option>
				    	<c:forEach items="${depart}" var="dep">
						    <option value="${dep.did}">${dep.dname}</option>
				    	</c:forEach>
				    </select>
				</div>
		    </li>
		    <input type="hidden" id="upper" name="departmentid" value=""/>
		    <li><label>请假区间<b>*</b></label>
		    	开始日期：<input id="stateDate" name="fromday" type="date" class="dfinput" style="width:200px;"/>
		    	结束日期：<input id="endDate" name="today" type="date" class="dfinput" style="width:200px;"/>
		    </li>
		    <input type="hidden" id="daynumber" name="daynumber" value=""/>
		    <li><label>请假理由<b>*</b></label><textarea name="because" cols="" rows="" class="textinput"></textarea></li>
		    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认保存"/></li>
	    </ul>
	</form>
    </div>
</body>
</html>

