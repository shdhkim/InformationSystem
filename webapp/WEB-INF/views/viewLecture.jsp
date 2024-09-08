<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>수강 내역</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
<div class="container mt-5">
	<h2 class="text-center">수강 내역</h2>
	<hr>
	<table class="table table-bordered">
		<thead class="thead-dark">
		<tr>
			<th>년도</th>
			<th>학기</th>
			<th>교과목명</th>
			<th>교과구분</th>
			<th>담당교수</th>
			<th>학점</th>
		</tr>
		</thead>
		<tbody>
		<!-- lectures에서 정보를 가지고 온다. -->
		<c:forEach var="lectures" items="${lectures}">
			<tr>
				<td><c:out value="${lectures.year}" /></td>
				<td><c:out value="${lectures.term}" /></td>
				<td><c:out value="${lectures.title}" /></td>
				<td><c:out value="${lectures.part}" /></td>
				<td><c:out value="${lectures.professor}" /></td>
				<td><c:out value="${lectures.credit}" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>




<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>