<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>직원 수정</title>
<link rel="stylesheet" href="/hrm/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/hrm/css/bootstrap.min.css" />
<link rel="stylesheet" href="/hrm/css/inputForm.css" />
<link rel="stylesheet" href="/hrm/css/ui.jqgrid.css" />
<link rel="stylesheet" href="/hrm/css/ui.multiselect.css" />
<script type="text/javascript" src="/hrm/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/hrm/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/hrm/js/datepicker-ko.js"></script>
<script type="text/javascript" src="/hrm/js/popper.min.js"></script>
<script type="text/javascript" src="/hrm/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/hrm/js/grid.locale-kr.js"></script>
<script type="text/javascript" src="/hrm/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/hrm/js/updateForm.js"></script>
<style>
/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#mil_yn').change(
						function() {
							var mil = $(this).val();
							if (mil == '2') {
								$('#mil_type').attr('disabled', false);
								$('#mil_level').attr('disabled', false);
								$('#mil_startdate').attr('disabled', false);
								$('#mil_enddate').attr('disabled', false);

								$("#mil_startdate").datepicker(
										{
											onClose : function(selectedDate) {
												$("#mil_enddate").datepicker(
														"option", "minDate",
														selectedDate);
											}
										});

								$("#mil_enddate").datepicker(
										{
											onClose : function(selectedDate) {
												$("#mil_startdate").datepicker(
														"option", "maxDate",
														selectedDate);
											}
										});
							} else {
								$('#mil_type').attr('disabled', true);
								$('#mil_level').attr('disabled', true);
								$('#mil_startdate').attr('disabled', true);
								$('#mil_enddate').attr('disabled', true);

								$('#mil_type').val('');
								$('#mil_level').val('');
								$('#mil_startdate').val('');
								$('#mil_enddate').val('');

								$("#mil_startdate").datepicker('destroy');

								$("#mil_enddate").datepicker('destroy');
							}
						});

				$("#join_day").datepicker(
						{
							onClose : function(selectedDate) {
								$("#retire_day").datepicker("option",
										"minDate", selectedDate);
							},
						});

				$("#retire_day").datepicker(
						{
							onClose : function(selectedDate) {
								$("#join_day").datepicker("option", "maxDate",
										selectedDate);
							},
						});
			});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="pd-4">
		<div class="container pt-5">
			<h3>직원 등록</h3>
			<form name="frm" id="frm" enctype="multipart/form-data" method="POST"
				action="/hrm/regProc.do">
				<div class="float-right">
					<button type="button" name="editEmp" id="editEmp"
						class="btn btn-sm btn-primary m-0 pl-4 pr-4">수정</button>
					<button type="button" name="delEmp" id="delEmp"
						class="btn btn-sm btn-danger m-0 pl-4 pr-4">삭제</button>
					<a href="javascript:window.history.back()"
						class="btn btn-sm btn-warning m-0 pl-2 pr-2">이전</a>
				</div>
				<br /> <br />
				<div class="row mt-2">
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="uploadResult">
								<img id="profilef" src="/hrm/profile/${PARAM.profile}"
									class="img-frm" />
							</div>
							<div class="center">
								<input name="profileimg" id="profileimg" type="file"
									hidden="hidden" accept="image/*" /> <label for="profileimg"
									class="btn btn-light center small"> <img
									src="/hrm/img/camera_icon.jpg" class="icon-frm" /><span
									class="small in-blk">사진올리기</span>
								</label>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>입사구분</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="join_yn" id="join_yn" class="w-100 small">
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
								<h6>군별</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="mil_type" id="mil_type" class="w-100 small"
									disabled="disabled">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '5'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.mil_type}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>KOSA등록</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="kosa_reg_yn" id="kosa_reg_yn" class="w-100 small">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '9'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.kosa_reg_yn}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>사업자번호</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="cmp_reg_no" id="cmp_reg_no"
									class="w-100 small" maxlength="12" value="${PARAM.cmp_reg_no}" />
							</div>
						</div>
					</div>
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*사번</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="number" name="sabun" id="sabun" class="w-100 small"
									readonly value="${PARAM.sabun}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*아이디</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="id" id="id" class="w-100 small"
									minlength="4" maxlength="20" value="${PARAM.id}"
									disabled="disabled" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>전화번호</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="tel" name="phone" id="phone" class="w-100 small"
									maxlength="13" value="${PARAM.phone}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>연령</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="number" name="years" id="years"
									class="w-100 small text-right" value="${PARAM.years}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-3 in-blk">
								<h6>주소</h6>
							</div>
							<div class="col-3 in-blk p-0">
								<label for="addrSearch" class="w-100"> <input
									type="number" name="zip" id="zip" class="w-100 small" readonly
									placeholder="우편번호" onclick="goPopup()" value="${PARAM.zip}" />
								</label>
							</div>
							<div class="col-5 center in-blk">
								<button class="btn btn-light small" type="button" id="addSearch"
									onclick="goPopup()">
									<h6 class="small">주소검색</h6>
								</button>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>직위</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="pos_gbn_code" id="pos_gbn_code"
									class="w-100 small">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '3'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.pos_gbn_code}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>등급</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="gart_level" id="gart_level" class="w-100 small">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '2'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.gart_level}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>계급</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="mil_level" id="mil_level" class="w-100 small"
									disabled="disabled">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '7'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.mil_level}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>KOSA등급</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="kosa_class_code" id="kosa_class_code"
									class="w-100 small" disabled="disabled">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '10'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.kosa_class_code}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>업체명</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="crm_name" id="crm_name"
									class="w-100 small" value="${PARAM.crm_name}" />
							</div>
						</div>
					</div>
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*한글성명</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="name" id="name" class="w-100 small"
									maxlength="7" minlength="2" value="${PARAM.name}"
									disabled="disabled" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*패스워드</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="password" name="pwd" id="pwd" class="w-100 small"
									maxlength="20" minlength="6" value="${PARAM.pwd}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*핸드폰번호</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="hp" id="hp" class="w-100 small"
									required maxlength="13" value="${PARAM.hp}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="col-3 in-blk p-0 center">
								<h6>*이메일</h6>
							</div>
							<div class="col-4 in-blk p-0">
								<input type="text" name="mail" id="mail" class="w-100 small"
									value="${PARAM.mail}" />
							</div>
							<div class="col-4 in-blk p-0">
								<h6 class="in-blk">@</h6>
								<select name="domain" id="domain" class="w-75 small">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '12'}">
											<option value="${com.name}"
												<c:if test="${com.name eq PARAM.domain}">selected="selected"</c:if>>
												${com.name}</option>
										</c:if>
									</c:forEach>
								</select> <input type="hidden" name="email" id="email"
									value="${PARAM.email}" required />
							</div>
						</div>
						<div class="col center addr-h">
							<input type="text" name="addr1" id="addr1" class="w-100" readonly
								placeholder="주소" value="${PARAM.addr1}" />
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>부서</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="dept_code" id="dept_code" class="w-100 small">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '4'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.dept_code}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>투입여부</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="put_yn" id="put_yn" class="w-100 small">
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
							<div class="center col-5 in-blk">
								<h6>*입사일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="join_day" id="join_day" autocomplete="off"
									class="w-75 small" value="${PARAM.join_day}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>퇴사일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="retire_day" id="retire_day" autocomplete="off"
									class="w-75 small" value="${PARAM.retire_day}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6 class="small">사업자등록증</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="ori_cmp_reg_img" id="ori_cmp_reg_img"
									class="w-100 small" disabled value="${PARAM.ori_cmp_reg_img}" />
							</div>
						</div>
					</div>
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>영문성명</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="eng_name" id="eng_name"
									class="w-100 small" value="${PARAM.eng_name}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6 class="small">*패스워드 확인</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="password" name="pwd_ck" id="pwd_ck"
									class="w-100 small" maxlength="20" minlength="6" value="${PARAM.pwd}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>주민번호</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="reg_no_input" id="reg_no_input"
									class="w-100 small" maxlength="14"
									value="${PARAM.reg_no_input}" /> <input type="hidden"
									name="reg_no" id="reg_no" value="${PARAM.reg_no}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="col-3 in-blk p-0">
								<h6>직종체크</h6>
							</div>
							<div class="col-3 in-blk p-0">
								<select name="join_gbn_code" id="join_gbn_code"
									class="w-100 small">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '8'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.join_gbn_code}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="col-2 in-blk p-0">
								<h6>성별</h6>
							</div>
							<div class="col-3 in-blk p-0">
								<select name="sex" id="sex" class="w-100 small">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '11'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.sex}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col center addr-h">
							<input type="text" name="addr2" id="addr2" class="w-100"
								placeholder="상세 주소" value="${PARAM.addr2}" />
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>연봉(만원)</h6>
							</div>
							<div class="col-4 in-blk p-0">
								<input type="text" name="salary_input" id="salary_input"
									class="w-100 small text-right" value="${PARAM.salary_input}" />
								<input type="hidden" name="salary" id="salary"
									value="${PARAM.salary}">
							</div>
							<div class="co-3 in-blk text-left">
								<h6>(만원)</h6>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>군필여부</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<select name="mil_yn" id="mil_yn" class="w-100 small">
									<c:forEach var="com" items="${COMLIST}">
										<c:if test="${com.gubun eq '5'}">
											<option value="${com.code}"
												<c:if test="${com.code eq PARAM.mil_yn}">selected="selected"</c:if>>${com.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>입영일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="mil_startdate" id="mil_startdate" autocomplete="off"
									class="w-75 small" disabled="disabled"
									value="${PARAM.mil_startdate}" />
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>전역일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="mil_enddate" id="mil_enddate" autocomplete="off"
									class="w-75 small" disabled="disabled"
									value="${PARAM.mil_enddate}" />
							</div>
						</div>
						<div class="col center p-0">
							<div class="col-5 p-0 in-blk">
								<button id="show_cmp_reg_img" type="button"
									class="btn btn-outline-info btn-block btn-sm">미리보기</button>
							</div>
							<div class="col-5 p-0 in-blk">
								<label for="cmp_reg_img" class="w-100"> <span
									id="reg_cmp_reg_img"
									class="btn btn-outline-info btn-block btn-sm">등록</span>
								</label> <input type="file" name="cmp_reg_img" id="cmp_reg_img"
									hidden="hidden" accept="image/*" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<textarea name="self_intro" id="self_intro" maxlength="100"
							rows="2" class="w-100" placeholder="100자 내외로 적으시오">${PARAM.self_intro}</textarea>
					</div>
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>이력서</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="resume" id="resume" class="w-100 small"
									disabled value="${PARAM.ori_carrier}" />
							</div>
						</div>
					</div>
					<div class="col-3 p-0">
						<div class="col center p-0">
							<div class="col-5 p-0 in-blk">
								<button id="show_resume_img" type="button"
									class="btn btn-outline-info btn-block btn-sm">미리보기</button>
							</div>
							<div class="col-5 p-0 in-blk">
								<label for="resume_img" class="w-100"> <span
									id="reg_resume_img"
									class="btn btn-outline-info btn-block btn-sm">파일 업로드</span>
								</label> <input type="file" name="resume_img" id="resume_img"
									hidden="hidden" accept="image/*" />
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- 미리보기 모달 -->
	<div class="modal" id="preview_modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Header -->
				<div class="modal-header">
					<h4 id="cmp_modal_header" class="modal-title dnone">사업자등록증
						미리보기</h4>
					<h4 id="carrier_modal_header" class="modal-title dnone">이력서
						미리보기</h4>
					<button type="button" class="close" data-dismiss="modal">
						&times;</button>
				</div>
				<!-- Body -->
				<div class="modal-body div-in-modal center">
					<img class="img-frm dnone" id="preview_cmp_reg"
						src="/hrm/cmp_reg/${PARAM.cmp_reg_image}" /> <img
						class="img-frm dnone" id="preview_carrier"
						src="/hrm/carrier/${PARAM.carrier}" />
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>