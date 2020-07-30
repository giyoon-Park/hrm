<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사시스템</title>
<script src="/hrm/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/hrm/css/bootstrap.min.css" />
<link rel="stylesheet" href="/hrm/css/cover.css" />
</head>
<body class="text-center">

    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
      <header class="masthead mb-auto">
        <div class="inner">
          <h3 class="masthead-brand">PinoSoft</h3>
          <nav class="nav nav-masthead justify-content-center">
            <a class="nav-link active" href="#">Home</a>
            <a class="nav-link" href="/hrm/insaInputForm.do">Input</a>
            <a class="nav-link" href="/hrm/insaListForm.do">Search</a>
          </nav>
        </div>
      </header>

      <main role="main" class="inner cover">
        <h1 class="cover-heading">인사관리 시스템</h1>
        <p class="lead">인사정보를 입력하겠습니다. <a href="/hrm/insaInputForm.do" class="btn btn-lg btn-secondary">입력</a></p>
        <p class="lead">인사정보를 조회하겠습니다. <a href="/hrm/insaListForm.do" class="btn btn-lg btn-secondary">조회</a></p>
      </main>

      <footer class="mastfoot mt-auto">
        <div class="inner">
          <p class="footer">서울 금천구 디지털로9길 46 이앤씨드림타워7차 306호(가산동) / Tel. <a href="#">02-6935-2288</a></p>
          <p class="footer">Copyright&copy; <a href="#">PinoSoft</a> All rights reserved by <a href="#">pinosoft@pinosoft.com</a></p>
        </div>
      </footer>
    </div>

</body>
</html>