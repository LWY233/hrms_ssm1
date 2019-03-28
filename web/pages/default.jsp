<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<link href="${path}/static/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${path}/static/js/jquery.js"></script>
	<script type="text/javascript" src="${path}/static/js/jsapi.js"></script>
	<script type="text/javascript" src="${path}/static/js/format+zh_CN,default,corechart.I.js"></script>		
	<script type="text/javascript" src="${path}/static/js/jquery.gvChart-1.0.1.min.js"></script>
	<script type="text/javascript" src="${path}/static/js/jquery.ba-resize.min.js"></script>
	
	<script type="text/javascript">
		gvChartInit();
		jQuery(document).ready(function(){

		jQuery('#myTable5').gvChart({
				chartType: 'PieChart',
				gvSettings: {
					vAxis: {title: 'No of players'},
					hAxis: {title: 'Month'},
					width: 650,
					height: 250
					}
			});
		});
		</script>
</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="index">首页</a></li>
    <li><a href="#">工作台</a></li>
    </ul>
    </div>
    
    
    <div class="mainbox">
    
    <div class="mainleft">
    
    
    <div class="leftinfo">
    <div class="listtitle"><a href="#" class="more1"></a>数据统计</div>
        
    <div class="maintj">  
    <table id='myTable5'>
				<caption>部门人数</caption>
				<thead>
					<tr>
						<th></th>
						<c:forEach items="${depart}" var="de">
							<th>${de.dname}</th>
						</c:forEach>
					</tr>
				</thead>
					<tbody>
					<tr>
						<th></th>
						<c:forEach items="${depart}" var="de">
							<td>${de.dnum}</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>  
    </div>
    
    </div>
    
    
    <div class="leftinfos">
    
   
    <div class="infoleft">
    
    <div class="listtitle"><a href="#" class="more1"></a>待办事项</div>    
    <ul class="newlist">
    	<c:forEach items="${leave}" var="lea">
    		<c:if test="${lea.state == '未审核'}">
    			<li><a href="${path}/leave/check?id=${lea.id}">${lea.departments.dname}的${lea.name}需要请${lea.daynumber}天假</a><b>请假日期由${lea.fromday}到${lea.today}</b></li>
    		</c:if>
    	</c:forEach>
    </ul>   
    
    </div>
    
    
    <div class="inforight">
    <div class="listtitle"><a href="#" class="more1"></a>常用工具</div>
    
    <ul class="tooli">
    <ul class="iconlist">
	    <li><img src="${path}/static/images/ico01.png" /><p><a href="${path}/department/search">部门管理</a></p></li>
	    <li><img src="${path}/static/images/ico02.png" /><p><a href="${path}/checkin/form">请假表</a></p></li>
	    <li><img src="${path}/static/images/ico03.png" /><p><a href="${path}/money/show">薪资管理</a></p></li>
	    <li><img src="${path}/static/images/ico04.png" /><p><a href="${path}/rap/show">奖惩管理</a></p></li>
	    <li><img src="${path}/static/images/ico05.png" /><p><a href="${path}/checkin/leave">请假记录</a></p></li>
	    <li><img src="${path}/static/images/ico06.png" /><p><a href="${path}/employees/search">人员查询</a></p></li>      
    </ul>    
    </ul>
    
    </div>
    </div>



</body>
<script type="text/javascript">
	setWidth();
	$(window).resize(function(){
		setWidth();	
	});
	function setWidth(){
		var width = ($('.leftinfos').width()-12)/2;
		$('.infoleft,.inforight').width(width);
	}
</script>
</html>

