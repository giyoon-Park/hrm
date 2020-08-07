<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>직원 등록</title>
    <link rel="stylesheet" href="/hrm/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="/hrm/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/hrm/css/inputForm.css" />
    <script type="text/javascript" src="/hrm/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="/hrm/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/hrm/js/datepicker-ko.js"></script>
    <script type="text/javascript" src="/hrm/js/popper.min.js"></script>
    <script type="text/javascript" src="/hrm/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/hrm/js/inputForm.js"></script>
    <style>
      /*datepicker에서 사용한 이미지 버튼 style적용*/
      img.ui-datepicker-trigger {
        margin-left: 5px;
        vertical-align: middle;
        cursor: pointer;
      }
    </style>
    <script type="text/javascript">
      $(document).ready(function () {
    	  $('#mil_yn').change(function() {
			var mil = $(this).val();
			if(mil == '001') {
		        $('#mil_type').attr('disabled', false);
		        $('#mil_level').attr('disabled', false);
		        $('#mil_startdate').attr('disabled', false);
		        $('#mil_enddate').attr('disabled', false);

		        $("#mil_startdate").datepicker({
		          onClose: function (selectedDate) {
		            $("#mil_enddate").datepicker("option", "minDate", selectedDate);
		          }
		        });
		
		        $("#mil_enddate").datepicker({
		          onClose: function (selectedDate) {
		            $("#mil_startdate").datepicker("option", "maxDate", selectedDate);
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
        <h3>직원 등록</h3>
        <form
          name="frm"
          id="frm"
          enctype="multipart/form-data"
          method="POST"
          action="/hrm/regProc.do"
        >
          <div class="float-right">
            <button
              type="button"
              name="regEmp"
              id="regEmp"
              class="btn btn-sm btn-primary m-0 pl-4 pr-4"
            >등록</button>
            <a
              href="javascript:window.history.back()"
              class="btn btn-sm btn-warning m-0 pl-2 pr-2"
              >이전화면</a
            >
          </div>
          <br />
          <br />
          <div class="row mt-2">
            <div class="col-3 p-0">
              <div class="col p-0">
                <div class="uploadResult">
                  <img
                    id="profilef"
                    src="/hrm/img/no-image-icon-md.png"
                    class="img-frm"
                  />
                </div>
                <div class="center">
                  <input
                    name="profileimg"
                    id="profileimg"
                    type="file"
                    hidden="hidden"
                    accept="image/*"
                  />
                  <label for="profileimg" class="btn btn-light center small">
                    <img src="/hrm/img/camera_icon.jpg" class="icon-frm" /><span
                      class="small in-blk"
                      >사진올리기</span
                    >
                  </label>
                </div>
              </div>
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
                    class="w-100 small"
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
                  <h6>군별</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="mil_type"
                    id="mil_type"
                    list="mil_type_list"
                    class="w-100 small"
                    placeholder="선택"
                    disabled="disabled"
                  />
                  <datalist id="mil_type_list">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq '군별'}">
                        <option value="${com.name}">${com.name}</option>
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
                  <input
                    type="text"
                    name="kosa_reg_yn"
                    id="kosa_reg_yn"
                    list="kosa_reg_yn_list"
                    class="w-100 small"
                    placeholder="선택"
                  />
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
                  <input
                    type="text"
                    name="cmp_reg_no"
                    id="cmp_reg_no"
                    class="w-100 small"
                    maxlength="12"
                  />
                </div>
              </div>
            </div>
            <div class="col-3 p-0">
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>*사번</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="number"
                    name="sabun"
                    id="sabun"
                    class="w-100 small"
                    disabled
                    placeholder="등록시 자동 생성"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>*아이디</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="id"
                    id="id"
                    class="w-100 small"
                    minlength="4"
                    maxlength="20"
                    required
                  />
                  <input type="hidden" name="idck" id="idck" value="N" />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>전화번호</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="tel"
                    name="phone"
                    id="phone"
                    class="w-100 small"
                    maxlength="13"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>연령</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="number"
                    name="years"
                    id="years"
                    class="w-100 small text-right"
                    value="0"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-3 in-blk">
                  <h6>주소</h6>
                </div>
                <div class="col-3 in-blk p-0">
                  <label for="addrSearch" class="w-100">
                    <input
                      type="number"
                      name="zip"
                      id="zip"
                      class="w-100 small"
                      readonly
                      placeholder="우편번호"
                    />
                  </label>
                </div>
                <div class="col-5 center in-blk">
                  <button
                    class="btn btn-light small"
                    type="button"
                    id="addSearch"
                    onclick="goPopup()"
                  >
                    <h6 class="small">주소검색</h6>
                  </button>
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
                    class="w-100 small"
                    placeholder="선택"
                  />
                  <datalist id="pos_gbn_code_list">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq '직위'}">
                        <option value="${com.name}">${com.name}</option>
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
                  <input
                    type="text"
                    name="gart_level"
                    id="gart_level"
                    list="gart_level_list"
                    class="w-100 small"
                    placeholder="선택"
                  />
                  <datalist id="gart_level_list">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq '등급'}">
                        <option value="${com.name}">${com.name}</option>
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
                  <input
                    type="text"
                    name="mil_level"
                    id="mil_level"
                    list="mil_level_list"
                    class="w-100 small"
                    placeholder="선택"
                    disabled="disabled"
                  />
                  <datalist id="mil_level_list">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq '계급'}">
                        <option value="${com.name}">${com.name}</option>
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
                  <input
                    type="text"
                    name="kosa_class_code"
                    id="kosa_class_code"
                    list="kosa_class_code_list"
                    class="w-100 small"
                    placeholder="선택"
                    disabled="disabled"
                  />
                  <datalist id="kosa_class_code_list">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq 'KOSA등급'}">
                        <option value="${com.name}">${com.name}</option>
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
                  <input
                    type="text"
                    name="crm_name"
                    id="crm_name"
                    class="w-100 small"
                  />
                </div>
              </div>
            </div>
            <div class="col-3 p-0">
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>*한글성명</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="name"
                    id="name"
                    class="w-100 small"
                    required
                    maxlength="7"
                    minlength="2"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>*패스워드</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="password"
                    name="pwd"
                    id="pwd"
                    class="w-100 small"
                    required
                    maxlength="20"
                    minlength="6"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>*핸드폰번호</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="hp"
                    id="hp"
                    class="w-100 small"
                    required
                    maxlength="13"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="col-3 in-blk p-0 center">
                  <h6>*이메일</h6>
                </div>
                <div class="col-4 in-blk p-0">
                  <input
                    type="text"
                    name="mail"
                    id="mail"
                    class="w-100 small"
                  />
                </div>
                <div class="col-4 in-blk p-0">
                  <h6 class="in-blk">@</h6>
                  <input
                    type="text"
                    name="domain"
                    id="domain"
                    list="domainList"
                    class="w-75 small"
                    placeholder="선택"
                  />
                  <datalist id="domainList">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq '이메일'}">
                        <option value="${com.name}">${com.name}</option>
                      </c:if>
                    </c:forEach>
                  </datalist>
                  <input
                    type="hidden"
                    name="email"
                    id="email"
                    value=""
                    required
                  />
                </div>
              </div>
              <div class="col center addr-h">
                <input
                  type="text"
                  name="addr1"
                  id="addr1"
                  class="w-100"
                  readonly
                  placeholder="주소"
                />
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>부서</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="dept_code"
                    id="dept_code"
                    list="dept_codeList"
                    class="w-100 small"
                    placeholder="선택"
                  />
                  <datalist id="dept_codeList">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq '부서'}">
                        <option value="${com.name}">${com.name}</option>
                      </c:if>
                    </c:forEach>
                  </datalist>
                </div>
              </div>
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
                    class="w-100 small"
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
                <div class="center col-5 in-blk">
                  <h6>*입사일자</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="join_day"
                    id="join_day"
                    class="w-75 small"
                    required
                  />
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
                    class="w-75 small"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6 class="small">사업자등록증</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="ori_cmp_reg_img"
                    id="ori_cmp_reg_img"
                    class="w-100 small"
                    disabled
                  />
                </div>
              </div>
            </div>
            <div class="col-3 p-0">
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>영문성명</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="eng_name"
                    id="eng_name"
                    class="w-100 small"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6 class="small">*패스워드 확인</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="password"
                    name="pwd_ck"
                    id="pwd_ck"
                    class="w-100 small"
                    required
                    maxlength="20"
                    minlength="6"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>주민번호</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="reg_no_input"
                    id="reg_no_input"
                    class="w-100 small"
                    maxlength="14"
                  />
                  <input type="hidden" name="reg_no" id="reg_no" />
                </div>
              </div>
              <div class="col p-0">
                <div class="col-3 in-blk p-0">
                  <h6>직종체크</h6>
                </div>
                <div class="col-3 in-blk p-0">
                  <input
                    type="text"
                    name="join_gbn_code"
                    id="join_gbn_code"
                    list="join_gbn_codeList"
                    class="w-100 small"
                    placeholder="선택"
                  />
                  <datalist id="join_gbn_codeList">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq '직종'}">
                        <option value="${com.name}">${com.name}</option>
                      </c:if>
                    </c:forEach>
                  </datalist>
                </div>
                <div class="col-2 in-blk p-0">
                  <h6>성별</h6>
                </div>
                <div class="col-3 in-blk p-0">
                  <input
                    type="text"
                    name="sex"
                    id="sex"
                    list="sexList"
                    class="w-100 small"
                    placeholder="선택"
                  />
                  <datalist id="sexList">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq '성별'}">
                        <option value="${com.name}">${com.name}</option>
                      </c:if>
                    </c:forEach>
                  </datalist>
                </div>
              </div>
              <div class="col center addr-h">
                <input
                  type="text"
                  name="addr2"
                  id="addr2"
                  class="w-100"
                  placeholder="세부주소"
                />
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>연봉(만원)</h6>
                </div>
                <div class="col-4 in-blk p-0">
                  <input
                    type="text"
                    name="salary_input"
                    id="salary_input"
                    class="w-100 small text-right"
				  />
				  <input type="hidden" name="salary" id="salary" value="0">
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
                  <input
                    type="text"
                    name="mil_yn"
                    id="mil_yn"
                    list="mil_ynList"
                    class="w-100 small"
                    placeholder="선택"
                  />
                  <datalist id="mil_ynList">
                    <c:forEach var="com" items="${COMLIST}">
                      <c:if test="${com.gubun eq '군필여부'}">
                        <option value="${com.name}">${com.name}</option>
                      </c:if>
                    </c:forEach>
                  </datalist>
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>입영일자</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="mil_startdate"
                    id="mil_startdate"
                    class="w-75 small"
                    disabled="disabled"
                  />
                </div>
              </div>
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>전역일자</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="mil_enddate"
                    id="mil_enddate"
                    class="w-75 small"
                    disabled="disabled"
                  />
                </div>
              </div>
              <div class="col center p-0">
                <div class="col-5 p-0 in-blk">
                  <button
                    id="show_cmp_reg_img"
                    type="button"
                    class="btn btn-outline-info btn-block btn-sm"
                  >
                    미리보기
                  </button>
                </div>
                <div class="col-5 p-0 in-blk">
                  <label for="cmp_reg_img" class="w-100">
                    <span
                      id="reg_cmp_reg_img"
                      class="btn btn-outline-info btn-block btn-sm"
                      >등록</span
                    >
                  </label>
                  <input
                    type="file"
                    name="cmp_reg_img"
                    id="cmp_reg_img"
                    hidden="hidden"
                    accept="image/*"
                  />
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-6">
              <textarea
                name="self_intro"
                id="self_intro"
                maxlength="100"
                rows="2"
                class="w-100"
                placeholder="100자 내외로 적으시오"
              ></textarea>
            </div>
            <div class="col-3 p-0">
              <div class="col p-0">
                <div class="center col-5 in-blk">
                  <h6>이력서</h6>
                </div>
                <div class="col-6 in-blk p-0">
                  <input
                    type="text"
                    name="resume"
                    id="resume"
                    class="w-100 small"
                    disabled
                  />
                </div>
              </div>
            </div>
            <div class="col-3 p-0">
              <div class="col center p-0">
                <div class="col-5 p-0 in-blk">
                  <button
                    id="show_resume_img"
                    type="button"
                    class="btn btn-outline-info btn-block btn-sm"
                  >
                    미리보기
                  </button>
                </div>
                <div class="col-5 p-0 in-blk">
                  <label for="resume_img" class="w-100">
                    <span
                      id="reg_resume_img"
                      class="btn btn-outline-info btn-block btn-sm"
                      >파일 업로드</span
                    >
                  </label>
                  <input
                    type="file"
                    name="resume_img"
                    id="resume_img"
                    hidden="hidden"
                    accept="image/*"
                  />
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
            <h4 id="cmp_modal_header" class="modal-title dnone">
              사업자등록증 미리보기
            </h4>
            <h4 id="carrier_modal_header" class="modal-title dnone">
              이력서 미리보기
            </h4>
            <button type="button" class="close" data-dismiss="modal">
              &times;
            </button>
          </div>
          <!-- Body -->
          <div class="modal-body div-in-modal center">
            <img class="img-frm dnone" id="preview_cmp_reg" src="" />
            <img class="img-frm dnone" id="preview_carrier" src="" />
          </div>
          <!-- Footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
