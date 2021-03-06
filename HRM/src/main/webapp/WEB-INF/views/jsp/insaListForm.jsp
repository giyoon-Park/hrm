<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 리스트</title>
<link rel="stylesheet" href="/hrm/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/hrm/css/bootstrap.min.css" />
<link rel="stylesheet" href="/hrm/css/listForm.css" />
<script type="text/javascript" src="/hrm/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/hrm/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/hrm/js/datepicker-ko.js"></script>
<script type="text/javascript" src="/hrm/js/popper.min.js"></script>
<script type="text/javascript" src="/hrm/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/hrm/js/listForm.js"></script>
<style>
/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#join_day").datepicker({
			onClose : function(selectedDate) {
				$("#retire_day").datepicker("option", "minDate", selectedDate);
			},
		});

		$("#retire_day").datepicker({
			onClose : function(selectedDate) {
				$("#join_day").datepicker("option", "maxDate", selectedDate);
			},
		});
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="pd-4">
		<div class="container pt-5">
			<h3>직원 리스트</h3>
			<form name="frmsch" id="frmsch" method="POST"
				action="/hrm/insaListForm.do">
				<br />
				<div class="row mt-2">
					<div class="col p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>사번</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="number" name="ssabun" id="ssabun"
									class="w-100 text-right" value="${PARAM.sabun}"> <input
									type="hidden" name="sabun" id="sabun" value="${PARAM.sabun}">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>직위</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="pos_gbn_code" id="pos_gbn_code" class="w-100 select-center">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '3'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.pos_gbn_code}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="col p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>성명</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="name" id="name" class="w-100"
									value="${PARAM.name}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>입사일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="join_day" id="join_day" class="w-75" autocomplete="off"
									value="${PARAM.join_day}" />
							</div>
						</div>
					</div>
					<div class="col p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>입사구분</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="join_yn" id="join_yn" class="w-100 select-center">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '1'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.join_yn}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>퇴사일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="retire_day" id="retire_day" autocomplete="off"
									class="w-75" value="${PARAM.retire_day}" />
							</div>
						</div>
					</div>
					<div class="col p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>투입여부</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="put_yn" id="put_yn" class="w-100 select-center">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '13'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.put_yn}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk p-0">
								<h6>직종체크</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="join_gbn_code" id="join_gbn_code" class="w-100 select-center">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '8'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.join_gbn_code}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>
				<br />
				<div class="float-right">
					<button type="button" name="searchEmp" id="searchEmp"
						class="btn btn-sm btn-primary m-0 px-4">검색</button>
					<button type="button" name="rstbtn" id="rstbtn"
						class="btn btn-sm btn-danger m-0 px-3">초기화</button>
					<a href="javascript:window.history.back()"
						class="btn btn-sm btn-warning m-0 px-2">이전</a>
				</div>
				<input type="hidden" name="nowPage" id="nowPage"
					value="${PAGE.nowPage}">
			</form>
			<form name="frminfo" id="frminfo" method="post">
				<input type="hidden" name="eno" id="eno">
			</form>
			<br />
			<div id="ajaxlist">
				<hr />
				<table class="table table-hover table-bordered center" id="emptable">
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
							<th>연봉(만원)</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:if test="${PAGE.totalCount == 0}">
							<tr>
								<td class="noresult center" id="noresult" colspan="9">검색된
									데이터가 없습니다.</td>
							<tr>
						</c:if>
						<c:if test="${PAGE.totalCount != 0}">
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
						</c:if>
					</tbody>
				</table>
				<div class="center mt-2" id="paging">
					<c:if test="${PAGE.startPage ge (PAGE.pageGroup + 1)}">
						<span class="btn btn-outline-primary pbtn">PRE</span>
					</c:if>
					<c:forEach var="pageNo" begin="${PAGE.startPage}"
						end="${PAGE.endPage}">
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
					<input type="hidden" name="startPage" id="startPage" value="${PAGE.startPage}">
					<input type="hidden" name="endPage" id="endPage" value="${PAGE.endPage}">
				</div>
			</div>
		</div>
	</div>
</body>
</html>