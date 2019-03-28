<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<c:if test="${datas.totalPage>0 }">
<span class="pageinfo" style="display: inline-block">正在展示:<span class="shownum" style="display: inline-block">${(datas.page-1)*datas.pageSize +1}</span>--<span class="shownum" style="display: inline-block">${(datas.page-1)*datas.pageSize+datas.pageSize}</span>条记录&nbsp;总页数:<span class="shownum" style="display: inline-block">${datas.totalPage}</span>页，总记录:<span class="shownum" style="display: inline-block">${datas.total}</span>条
</span>
</c:if>
<div class="pagenumber" style=" width:90%;">
<ul class="pagination">
	<c:choose>
		<c:when test="${datas.totalPage==0 }">
		</c:when>
		
	
		<c:when test="${datas.totalPage==1 }">
			<li class="page_button active">
				<a href="javascript:;" data-page="1">1</a>
			</li>
		</c:when>
		
		
		<c:when test="${datas.totalPage==2}">
			<c:if test="${datas.page==2}">
				<li class="page_button previous"><a href="javascript:;"
					class="search" data-page="1">前一页</a>
				</li>
			</c:if>
			<li
				class="page_button <c:if test="${datas.page==1}"> active</c:if>"><a
				href="javascript:;" class="search" data-page="1">1</a>
			</li>
			<li
				class="page_button <c:if test="${datas.page==2}"> active</c:if>""><a
				href="javascript:;" class="search" data-page="2">2</a>
			</li>
		</c:when>
		
		
		<c:when test="${datas.totalPage==datas.page}">
			<li class="page_button previous"><a href="javascript:;"
				class="search" data-page="${datas.page-1}">前一页</a>
			</li>
			<c:if test="${datas.totalPage>=3 }">
				<li class="page_button "><span>…</span>
				</li>
			</c:if>
			<li class="page_button "><a href="javascript:;"
				class="search" data-page="${datas.page-1}">${datas.page-1}</a>
			</li>
			<li class="page_button active"><a href="javascript:;"
				class="search" data-page="${datas.page}">${datas.page}</a>
			</li>
		</c:when>
		
		
		<c:otherwise>
			<c:choose>
				<c:when test="${datas.page==1 }">
					<li class="page_button active"><a href="javascript:;"
						class="search" data-page="1">1</a>
					</li>
					<li class="page_button "><a href="javascript:;"
						class="search" data-page="${datas.page+1}">${datas.page+1}</a>
					</li>
					<li class="page_button "><span>…</span>
					</li>
					<li class="page_button next"><a href="javascript:;"
						class="search" data-page="${datas.page+1}">后一页</a>
					</li>
				</c:when>
				<c:when test="${datas.page==datas.totalPage }">
					<li class="page_button previous"><a href="javascript:;"
						class="search" data-page="${datas.page-1}">前一页</a>
					</li>
					<li class="page_button "><span>…</span>
					</li>
					<li class="page_button "><a href="javascript:;"
						class="search" data-page="${datas.page-1}">${datas.page-1}</a>
					</li>
					<li class="page_button active"><a href="javascript:;"
						class="search" data-page="${datas.page}">${datas.page}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page_button previous"><a href="javascript:;"
						class="search" data-page="${datas.page-1}">前一页</a>
					</li>
					<c:if test="${datas.totalPage>3 && 1!=datas.totalPage-1}}">
						<li class="page_button "><span>…</span>
						</li>
					</c:if>
					<li class="page_button "><a href="javascript:;"
						class="search" data-page="${datas.page-1}">${datas.page-1}</a>
					</li>
					<li class="page_button active"><a href="javascript:;"
						class="search" data-page="${datas.page}">${datas.page}</a>
					</li>
					<li class="page_button "><a href="javascript:;"
						class="search" data-page="${datas.page+1}">${datas.page+1}</a>
					</li>
					<c:if test="${datas.totalPage>3 && datas.page<datas.totalPage-1}">
						<li class="page_button "><span>…</span>
						</li>
					</c:if>
					<li class="page_button next"><a href="javascript:;"
						class="search" data-page="${datas.page+1}">后一页</a>
					</li>
				</c:otherwise>
			</c:choose>

		</c:otherwise>
	</c:choose>
</ul>
</div>