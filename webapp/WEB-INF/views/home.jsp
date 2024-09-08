<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>

	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
	<!-- 폰트를 바꾸기 위해 css를 적용한다 -->
</head>

<body style="background-image: url('https://img.freepik.com/free-vector/watercolor-sugar-cotton-clouds-background_23-2149228088.jpg?w=996&t=st=1712724938~exp=1712725538~hmac=bbb25c142bee4979fdadffc70cbe6d749d5e480b956779d9eaeeaaef04a0fad1'); background-size: cover; background-position: center;">
<div class="container mt-5">
	<div class="row">
		<div class="col-md-12 text-center">
			<img src="https://info.hansung.ac.kr/fuz/common/img/common/logo.gif" class="img-fluid" alt="Hansung Logo">
			<br><br>

			<p><a href="${pageContext.request.contextPath}/attLecture" class="btn btn-primary">학기별 이수 학점 조회</a></p>
			<p><a href="${pageContext.request.contextPath}/registerLecture" class="btn btn-success">수강 신청 하기</a></p>
			<p><a href="${pageContext.request.contextPath}/viewRegisterLecture" class="btn btn-info">수강 신청 조회하기</a></p>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col-md-12 text-center">
			<!-- 로그아웃 기능 -->
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form id="logout" action="<c:url value="/logout"/>" method="post" class="d-inline">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button type="submit" class="btn btn-danger">Logout</button>
				</form>
			</c:if>
		</div>
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>