<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="/hrm/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/hrm/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="pd-4">
		<div class="container p-5">
			<h3>직원 등록</h3>
			<form name="frm" id="frm" enctype="multipart/form-data">
				<div class="float-right">
					<button id="submit_btn" class="btn btn-sm btn-primary m-0 pl-4 pr-4">등록</button>
					<a href="javascript:window.history.back()" class="btn btn-sm btn-warning m-0 pl-2 pr-2">이전화면</a>
				</div>
				<div class="row">
					<div class="col-3">
						<div class="col mt-2">
							<div class="col-8 uploadResult">
								<img id="profile" src="/hrm/img/no-image-icon-md.png" class="img-frm" />
							</div>
							<div>
								<input name="profileimg" id="profileimg" type="image" hidden="hidden" />
								<label for="profileimg">
									<img src="/hrm/img/camera_icon.jpg" />
								</label>
								<input name="profile" id="profile" type="hidden">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>