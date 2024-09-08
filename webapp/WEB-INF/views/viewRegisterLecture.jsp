<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>2024-2 수강신청 결과 조회</title>

 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>

<div class="container mt-5">
 <h1 class="text-center  ">2024-2 수강신청 결과 조회</h1>
 <hr>
 <table class="table table-bordered">
  <thead class="thead-light">
  <tr>
   <th scope="col">년도</th>
   <th scope="col">학기</th>
   <th scope="col">교과목명</th>
   <th scope="col">교과구분</th>
   <th scope="col">담당교수</th>
   <th scope="col">학점</th>
  </tr>
  </thead>
  <tbody>
  <!-- lectures2024에서 정보를 가지고 온다. -->
  <c:forEach var="lectures2024" items="${lectures2024}">
   <tr>
    <td><c:out value="${lectures2024.year}" /></td>
    <td><c:out value="${lectures2024.term}" /></td>
    <td><c:out value="${lectures2024.title}" /></td>
    <td><c:out value="${lectures2024.part}" /></td>
    <td><c:out value="${lectures2024.professor}" /></td>
    <td><c:out value="${lectures2024.credit}" /></td>
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