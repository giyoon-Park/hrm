<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$(document).ready(function(){
			$("#join_day").datepicker({
				onClose: function (selectedDate) {
					$("#retire_day").datepicker("option", "minDate", selectedDate);
				},
			});

			$("#retire_day").datepicker({
				onClose: function (selectedDate) {
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
			<form name="frmsch" id="frmsch" method="POST">
				<br />
				<div class="row mt-2">
					<div class="col p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>사번</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input
									type="number"
									name="sabun"
									id="sabun"
									class="w-100 "
								/>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>직위</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input
									type="text"
									name="pos_gbn_code"
									id="pos_gbn_code"
									list="pos_gbn_code_list"
									class="w-100 "
									placeholder="선택"
								/>
								<datalist id="pos_gbn_code_list">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '직위'}">
											<option value="${com.code}">${com.name}</option>
										</c:if>
									</c:forEach>
								</datalist>
							</div>
						</div>
					</div>
					<div class="col p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>성명</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input
									type="text"
									name="name"
									id="name"
									class="w-100 "
								/>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>입사일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input
									type="text"
									name="join_day"
									id="join_day"
									class="w-75 "
								/>
							</div>
						</div>
					</div>
					<div class="col p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>입사구분</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input
									type="text"
									name="join_yn"
									id="join_yn"
									list="yn"
									class="w-100 "
									placeholder="선택"
								/>
								<datalist id="yn">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '입사구분'}">
											<option value="${com.name}">${com.name}</option>
										</c:if>
									</c:forEach>
								</datalist>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>퇴사일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input
									type="text"
									name="retire_day"
									id="retire_day"
									class="w-75 "
								/>
							</div>
						</div>
					</div>
					<div class="col p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>투입여부</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input
									type="text"
									name="put_yn"
									id="put_yn"
									list="put_ynList"
									class="w-100 "
									placeholder="선택"
								/>
								<datalist id="put_ynList">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '투입여부'}">
											<option value="${com.name}">${com.name}</option>
										</c:if>
									</c:forEach>
								</datalist>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk p-0">
								<h6>직종체크</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input
									type="text"
									name="join_gbn_code"
									id="join_gbn_code"
									list="join_gbn_codeList"
									class="w-100 "
									placeholder="선택"
								/>
								<datalist id="join_gbn_codeList">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '직종'}">
											<option value="${com.code}">${com.name}</option>
										</c:if>
									</c:forEach>
								</datalist>
							</div>
						</div>
					</div>
				</div>
				<br />
				<div class="float-right">
					<button
						type="button"
						name="searchEmp"
						id="searchEmp"
						class="btn btn-sm btn-primary m-0 px-4"
					>검색</button>
					<button
						type="reset"
						name="rstbtn"
						id="rstbtn"
						class="btn btn-sm btn-danger m-0 px-3"
					>초기화</button>
					<a
						href="javascript:window.history.back()"
						class="btn btn-sm btn-warning m-0 px-2"
					>이전</a>
				</div>
				<input type="hidden" name="nowPage" id="nowPage">
			</form>
			<br />
			<hr />
			<table class="table table-hover table-bordered" id="emptable">
				<form name="frminfo" id="frminfo" method="POST">
					
				</form>
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
				<td class="noresult center" id="noresult" colspan="9">검색된 데이터가 없습니다.</td>
			</table>
			<div class="float-center mt-2" id="paging">
			</div>
		</div>
	</div>
</body>
</html>