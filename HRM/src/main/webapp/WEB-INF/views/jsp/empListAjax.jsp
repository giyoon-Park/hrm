<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>listForAjax</title>
	<link rel="stylesheet" href="/hrm/css/bootstrap.min.css" />
</head>
<body>
	<div id="totalCount">${PAGE.totalCount}</div>
	<div id="nowPage">${PAGE.nowPage}</div>
	<table class="table table-hover table-bordred" id="ajaxtable">
		<thead>
			<tr>
				<th>사번</th>
				<th>성명</th>
				<th>주민번호</th>
				<th>핸드폰번호</th>
				<th>직위</th>
				<th>입사일자</th>
				<th>퇴사일자</th>
				<th>투입여부</th>
				<th>연봉</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${LIST}">
				<tr id="${list.sabun}" class="content">
					<td>${list.sabun}</td>
					<td>${list.name}</td>
					<td>${list.reg_no}</td>
					<td>${list.hp}</td>
					<td>${list.pos_gbn_code}</td>
					<td>${list.join_day}</td>
					<td>${list.retire_day}</td>
					<td>${list.put_yn}</td>
					<td>${list.salary}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="center mt-2" id="pagingbtns">
		<c:if test="${PAGE.startPage ge (PAGE.pageGroup + 1)}">
			<span class="btn btn-outline-primary pbtn">PRE</span>
		</c:if>
		<c:forEach var="pageNo" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			<c:if test="${PAGE.nowPage eq pageNo}">
				<span class="btn btn-primary pbtn">${pageNo}</span>
			</c:if>
			<c:if test="${PAGE.nowPage ne pageNo}">
				<span class="btn btn-outline-primary pbtn">${pageNo}</span>
			</c:if>
		</c:forEach>
		<c:if test="${PAGE.endPage ne PAGE.totalPage}">
			<span class="btn btn-outline-primary pbtn">NEXT</span>
		</c:if>
	</div>
</body>
</html>