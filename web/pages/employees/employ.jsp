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
    <li><a href="#">查看人员信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab2">查看人员信息</a></li> 
    <c:if test="${loginUser.userType<3}">
    	<li><a href="#tab1">修改人员信息</a></li>
    </c:if>
  	</ul>
    </div> 
  	<div id="tab2" class="tabson">
  	<form action="${path}/employees/select" method="post">
	    <ul class="seachform">
		    <li><label>员工编号</label><input name="eno" value="" type="text" class="scinput" /></li>
		
		    <li><label>身份证号</label><input name="idCard" value="" type="text" class="scinput" /></li>
		    
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li> 
	    </ul>
    </form>
    <br/><br/>
    <ul class="forminfo">
	    <li><label>员工编号</label><input name="eno" type="text" value="${employ.eno}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>员工姓名</label><input name="ename" type="text" value="${employ.ename}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>性别</label><input name="esex" type="text" value="${employ.esex}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>民族</label><input name="nationality" type="text" value="${employ.nationality}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
 		
 		<li><label>出生日期</label><input name="brity" type="text" value="${employ.brity}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>政治面貌</label><input name="politicalParty" type="text" value="${employ.politicalParty}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>文化程度</label><input name="cultureLevel" type="text" value="${employ.cultureLevel}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>籍贯</label><input name="familyPlace" type="text" value="${employ.familyPlace}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	     
	    <li><label>身份证号</label><input name="idCard" type="text" value="${employ.idCard}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>电话</label><input name="mobile" type="text" value="${employ.mobile}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>到岗日期</label><input name="hiredate" type="text" value="${employ.hiredate}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>职务</label><input name="title" type="text" value="${employ.title}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	     
	    <li><label>上级编号</label><input name="upperno" type="text" value="${employ.upperno}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>所在部门</label><input name="did" type="text" value="${employ.departments.dname}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>合同编号</label><input name="uid" type="text" value="${employ.uid}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
	    
	    <li><label>用户编号</label><input name="cid" type="text" value="${employ.cid}" class="dfinput" disabled="disabled" style="width:518px;"/></li>
 		
 		<li><label>&nbsp;</label><input name="" type="button" onclick="JavaScript:history.back(-1)" class="btn" value="返回"/></li>
 	</ul>
    
    </div> 
    <c:if test="${loginUser.userType<3}"> 
    <div id="tab1" class="tabson">
    	<form action="${path}/employees/select" method="post">
		    <ul class="seachform">
			    <li><label>员工编号</label><input name="eno" value="" type="text" class="scinput" /></li>
			
			    <li><label>身份证号</label><input name="idCard" value="" type="text" class="scinput" /></li>
			    
			    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li> 
		    </ul>
	    </form>
	    <br/><br/>
	    <form action="${path}/employees/update" method="post" id="forminfo">
		    <ul class="forminfo">
			    <li><label>员工编号</label><input name="eno" type="text" value="${employ.eno}" class="dfinput" required="required" readonly="readonly" style="width:518px;"/></li>
	    
			    <li><label>员工姓名</label><input name="ename" type="text" value="${employ.ename}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>性别</label><input name="esex" type="text" value="${employ.esex}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>民族</label><input name="nationality" type="text" value="${employ.nationality}" class="dfinput" required="required" style="width:518px;"/></li>
		 		
		 		<li><label>出生日期</label><input name="brity" type="text" value="${employ.brity}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>政治面貌</label><input name="politicalParty" type="text" value="${employ.politicalParty}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>文化程度</label><input name="cultureLevel" type="text" value="${employ.cultureLevel}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>籍贯</label><input name="familyPlace" type="text" value="${employ.familyPlace}" class="dfinput" required="required" style="width:518px;"/></li>
			     
			    <li><label>身份证号</label><input name="idCard" type="text" value="${employ.idCard}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>电话</label><input name="mobile" type="text" value="${employ.mobile}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>到岗日期</label><input name="hiredate" type="text" value="${employ.hiredate}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>职务</label><input name="title" type="text" value="${employ.title}" class="dfinput" required="required" style="width:518px;"/></li>
			     
			    <li><label>上级编号</label><input name="upperno" type="text" value="${employ.upperno}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>所在部门</label><input name="did" type="text" value="${employ.did}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>合同编号</label><input name="uid" type="text" value="${employ.uid}" class="dfinput" required="required" style="width:518px;"/></li>
			    
			    <li><label>用户编号</label><input name="cid" type="text" value="${employ.cid}" class="dfinput" required="required" style="width:518px;"/></li>
		 		
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
