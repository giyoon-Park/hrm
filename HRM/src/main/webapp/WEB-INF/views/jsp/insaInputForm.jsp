<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="/hrm/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/hrm/css/bootstrap.min.css">
<link rel="stylesheet" href="/hrm/css/inputForm.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="pd-4">
		<div class="container pt-5">
			<h3>직원 등록</h3>
			<form name="frm" id="frm" enctype="multipart/form-data">
				<div class="float-right">
					<button id="submit_btn" class="btn btn-sm btn-primary m-0 pl-4 pr-4">등록</button>
					<a href="javascript:window.history.back()" class="btn btn-sm btn-warning m-0 pl-2 pr-2">이전화면</a>
				</div>
				<br/>
				<div class="row mt-2">
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="uploadResult">
								<img id="profile" src="/hrm/img/no-image-icon-md.png" class="img-frm" />
							</div>
							<div class="center">
								<input name="profileimg" id="profileimg" type="file" hidden="hidden" accept="image/*" />
								<label for="profileimg" class="btn btn-light center small">
									<img src="/hrm/img/camera_icon.jpg" class="icon-frm" /><h6 class="small in-blk">사진올리기</h6>
								</label>
								<input name="profile" id="profile" type="hidden">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>입사구분</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="join_yn" id="join_yn" list="yn" class="w-100 small" placeholder="선택">
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
								<h6>군별</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="mil_type" id="mil_type" list="mil_type_list" class="w-100 small" placeholder="선택">
									<datalist id="mil_type_list">
										<c:forEach var="com" items="${COMLIST}">
											<c:if test="${com.gubun eq '군별'}">
												<option value="${com.code}">${com.name}</option>
											</c:if>
										</c:forEach>
									</datalist>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>KOSA등록</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="kosa_reg_yn" id="kosa_reg_yn" list="kosa_reg_yn_list" class="w-100 small" placeholder="선택">
									<datalist id="kosa_reg_yn_list">
										<c:forEach var="com" items="${COMLIST}">
											<c:if test="${com.gubun eq 'KOSA등록'}">
												<option value="${com.name}">${com.name}</option>
											</c:if>
										</c:forEach>
									</datalist>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>사업자번호</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="cmp_reg_no" id="cmp_reg_no" class="w-100 small">
							</div>
						</div>
					</div>
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*사번</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="number" name="sabun" id="sabun" class="w-100 small" disabled placeholder="등록시 자동 생성">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*아이디</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="id" id="id" class="w-100 small" required>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>전화번호</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="tel" name="phone" id="phone" class="w-100 small">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>연령</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="number" name="years" id="years" class="w-100 small">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-3 in-blk">
								<h6>주소</h6>
							</div>
							<div class="col-3 in-blk p-0">
								<label for="addrSearch" class="w-100">
									<input type="number" name="zip" id="zip" class="w-100 small" readonly placeholder="우편번호">
								</label>
							</div>
							<div class="col-5 center in-blk">
								<button class="btn btn-light small" type="button" id="addSearch"><h6 class="small">주소검색</h6></button>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>직위</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="pos_gbn_code" id="pos_gbn_code" list="pos_gbn_code_list" class="w-100 small" placeholder="선택">
									<datalist id="pos_gbn_code_list">
										<c:forEach var="com" items="${COMLIST}">
											<c:if test="${com.gubun eq '직위'}">
												<option value="${com.code}">${com.name}</option>
											</c:if>
										</c:forEach>
									</datalist>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>등급</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="gart_level" id="gart_level" list="gart_level_list" class="w-100 small" placeholder="선택">
									<datalist id="gart_level_list">
										<c:forEach var="com" items="${COMLIST}">
											<c:if test="${com.gubun eq '등급'}">
												<option value="${com.code}">${com.name}</option>
											</c:if>
										</c:forEach>
									</datalist>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>계급</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="mil_level" id="mil_level" list="mil_level_list" class="w-100 small" placeholder="선택">
									<datalist id="mil_level_list">
										<c:forEach var="com" items="${COMLIST}">
											<c:if test="${com.gubun eq '계급'}">
												<option value="${com.code}">${com.name}</option>
											</c:if>
										</c:forEach>
									</datalist>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>KOSA등급</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="kosa_class_code" id="kosa_class_code" list="kosa_class_code_list" class="w-100 small" placeholder="선택">
									<datalist id="kosa_class_code_list">
										<c:forEach var="com" items="${COMLIST}">
											<c:if test="${com.gubun eq 'KOSA등급'}">
												<option value="${com.code}">${com.name}</option>
											</c:if>
										</c:forEach>
									</datalist>
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>업체명</h6>
							</div>
							<div class="col-6 in-blk p-0">
								<input type="text" name="crm_name" id="crm_name" class="w-100 small">
							</div>
						</div>
					</div>
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*한글성명</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*패스워드</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*핸드폰번호</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-4 in-blk">
								<h6>*이메일</h6>
							</div>
							<div class="col-3 in-blk">
							</div>
							<div class="col-3 in-blk">
							</div>
						</div>
						<div>

						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>부서</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>투입여부</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>입영일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>*입사일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6 class="small">사업자등록증</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
					</div>
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>영문성명</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6 class="small">*패스워드  확인</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>주민번호</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>직종체크</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>성별</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div>
							
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>연봉(만원)</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>군필여부</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>전역일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>퇴사일자</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
						<div class="col p-0">
							<div class="col-6"></div>
							<div class="col-6"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6 p-0">
					</div>
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="center col-5 in-blk">
								<h6>이력서</h6>
							</div>
							<div class="col-6 in-blk p-0">
							</div>
						</div>
					</div>
					<div class="col-3 p-0">
						<div class="col p-0">
							<div class="col-6"></div>
							<div class="col-6"></div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>