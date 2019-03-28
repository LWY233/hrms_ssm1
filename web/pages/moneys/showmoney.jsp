<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
  	<link href="${path}/static/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${path}/static/css/base.css" rel="stylesheet" type="text/css" />
  	<link href="${path}/static/css/input.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${path}/static/js/jquery.js"></script>
  	<script type="text/javascript" src="${path}/static/js/base.js"></script>
	<style type="text/css">
	.info div {
    padding: 10px 10px;
    float: left;
    width: 1024px;
}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#searchButton").click(function(){
				$("#forminfo").submit();
				
			});
			$(".search").click(function(){
				
				$('[name=page]').val($(this).attr("data-page"));  //点击哪个页面 就赋值 哪个 页面的 data-page  给 input hidden
				$("#searchButton").click();
			});
		});
		
	
		 function lock(obj){
			$.ajax({
    				type:"POST",			//请求方式
    				url:"${path}/${urlmain}/lock",				//请求地址
    				dataType:"json",				//指定返回内容的数据格式
    				data:{"id":$(obj).attr('data-id')},
    				success:function(data,s,e){
    					window.location.reload();   //页面重新加载
    				}
    			});
		} 
	</script>
</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${path}/index">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    <div id="right">
				<div class="info">
					<div class="info_top">
						<label>查询条件</label>
					</div>
					<div class="info_bottom">
						<form action="${path}/${url}" method="post" id="forminfo">
							<input type="hidden" id="page" name="page"/>
							<input type="hidden" id="pageSize" name="pageSize" value="3"/>
						
							<label>员工号 </label>
							<input type="text" <c:if test="${loginUser.userType ==3 }">disabled</c:if> name="eno" value="${employees.eno}" />
							<label>名字</label>
							<input type="text" <c:if test="${loginUser.userType ==3 }">disabled</c:if> name="ename" value="${employees.ename}"/>
							&nbsp;&nbsp;&nbsp;&nbsp;
							
							<c:if test="${loginUser.userType <3 }">
								<a href="${path}/${urlmain}/add" class="btn2"><i class="fa fa-plus" aria-hidden="true"></i> 添加</a>
							</c:if>
							
							<a class="btn1" id="searchButton"><i class="fa fa-search" aria-hidden="true"></i> 查询</a>
						
							<br/>&nbsp;
						</form>
					</div>
				</div>
				
				<div class="info">
					<div class="info_top">
						<label>管理员列表</label>
					</div>
					<div class="info_bottom">
							<table id="example">
							<tr>
								<th>员工号</th>
								<th>姓名</th>
								<th>月份</th>
								<th>基本工资</th>
								<th>加班工资</th>
								<th>补助</th>
								<th>将罚金</th>
								<th>全勤奖</th>
								<th>个人纳税</th>
								<th>实际收入</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${datas.data}" var="d">
								
									<tr>
									<td>${d.employees.eno}</td>
									<td>${d.employees.ename}</td>
									<td>${d.month }</td>
									<td>${d.basemoney }</td>
									<td>${d.workOvertime }</td>
									<td>${d.subsidization }</td>
									<td>${d.rapall }</td>
									<td>${d.qqmoney }</td>
									<td>${d.payment }</td>
									<td>${d.realityMoney }</td>
									<td><c:if test="${d.state==1 }">已发</c:if><c:if test="${d.state==0 }">未发</c:if></td>
									
									<td><c:if test="${loginUser.userType <3 }"><a href="${path}/${urlmain}/update?mid=${d.mid}" style="color:red;"> 修改</a></c:if></td>
									</tr>
							</c:forEach>
							</table>
							<jsp:include page="../common/numpage.jsp"></jsp:include>
							
					</div>
				</div>
			</div>
    
    
    
    
    </div>
</body>
</html>

