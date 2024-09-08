<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>학기별 이수 학점 조회하기</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
<div class="container mt-5">
	<h2 class="text-center">학기별 이수 학점 조회하기</h2>
	<table class="table table-bordered">
		<thead class="thead-dark">
		<tr>
			<th>년도</th>
			<th>학기</th>
			<th>취득 학점</th>
			<th>상세보기</th>
		</tr>
		</thead>
		<tbody>
		<c:set var="sum" value="0"/> <!-- 총계 출력을 위해 변수를 생성한다. -->
		<c:forEach var="lectures" items="${lectures}">
			<tr>
				<td><c:out value="${lectures.year}" /></td>
				<td><c:out value="${lectures.term}" /></td>
				<c:set var="sum" value="${sum+lectures.credit}"/> <!-- 총계를 계산한다. -->
				<td><c:out value="${lectures.credit}" /></td>
				<td>
					<form action="viewLecture" method="GET">
						<input type="hidden" name="year" value="<c:out value="${lectures.year}"/>"/>
						<input type="hidden" name="term" value="<c:out value="${lectures.term}"/>"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<button type="submit" class="btn btn-primary">조회</button>
					</form>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td>총계</td>
			<td></td>
			<td><c:out value="${sum}"/></td>
			<td></td>
		</tr>
		</tbody>
	</table>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>