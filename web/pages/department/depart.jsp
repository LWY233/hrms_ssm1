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
		$(document).ready(function(){
		  $("#click").click(function(){
		  	$(".tip").fadeIn(200);
		  });
		  
		  $(".tiptop a").click(function(){
		  	$(".tip").fadeOut(200);
		  });
		
		  $(".sure").click(function(){
		  	 $("#forminfo").submit();
		 	 $(".tip").fadeOut(100);
		  });
		
		  $(".cancel").click(function(){
		  	$(".tip").fadeOut(100);
		  });
		 
		});
	</script>
  </head>
  <body>
  	
  	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${path}/index">首页</a></li>
    <li><a href="#">查看部门</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab2">查看部门信息</a></li> 
    <c:if test="${loginUser.userType<3}">
    	<li><a href="#tab1">修改部门信息</a></li>
    </c:if>
  	</ul>
    </div> 
  	<div id="tab2" class="tabson">
  	<form action="${path}/department/select" method="post">
	    <ul class="seachform">
		    <li><label>部门id</label><input name="did" value="" type="text" class="scinput" /></li>
		
		    <li><label>部门名称</label><input name="dname" value="" type="text" class="scinput" /></li>
		    
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li> 
	    </ul>
    </form>
    <br/><br/>
    <ul class="forminfo">
	    <li><label>部门id</label><input name="did" type="text" value="${dment.did}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>部门名称</label><input name="dname" type="text" value="${dment.dname}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>上级部门</label><input name="upperno" type="text" value="${dment.upperno}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>部门电话</label><input name="mobile" type="text" value="${dment.mobile}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
 		
 		<li><label>&nbsp;</label><input name="" type="button" onclick="JavaScript:history.back(-1)" class="btn" value="返回"/></li>
 	</ul>
    
    </div> 
    <c:if test="${loginUser.userType<3}"> 
    <div id="tab1" class="tabson">
    	<form action="${path}/department/select" method="post">
		    <ul class="seachform">
			    <li><label>部门id</label><input name="did" value="" type="text" class="scinput" /></li>
			
			    <li><label>部门名称</label><input name="dname" value="" type="text" class="scinput" /></li>
			    
			    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li> 
		    </ul>
	    </form>
	    <br/><br/>
	    <form action="${path}/department/update" method="post" id="forminfo">
		    <ul class="forminfo">
			    <li><label>部门id</label><input name="did" type="text" value="${dment.did}" class="dfinput" style="width:518px;"/></li>
			    
			    <li><label>部门名称</label><input name="dname" type="text" value="${dment.dname}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>上级部门</label><input name="upperno" type="text" value="${dment.upperno}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>部门电话</label><input name="mobile" type="text" value="${dment.mobile}" class="dfinput" required="required" style="width:518px;"/></li>
		 		
		 		<li><label>&nbsp;</label><input name="" id="click" type="button" class="btn" value="确认修改"/><input style="margin-left: 50px;" name="" type="button" onclick="JavaScript:history.back(-1)" class="btn" value="返回"/></li>
		 	</ul>
	 	</form>
    </div>
    </c:if>   
	</div> 
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
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    </div> 
  </body>
</html>
