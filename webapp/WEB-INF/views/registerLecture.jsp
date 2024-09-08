<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
	<style>
		.formtable {
			margin: auto;
		}

		.label {
			width: 120px;
		}

		.control {
			width: 300px;
		}

		.error {
			color: red;
		}
		.center-btn {
			display: flex;
			justify-content: center;
		}
	</style>
</head>
<body>
<div class="container mt-5">
	<sf:form method="post" action="${pageContext.request.contextPath}/docreate" modelAttribute="attLecture">
		<table class="table formtable">
			<tr>
				<td class="label">Year: </td>
				<td><sf:input class="form-control" type="number" path="year" readonly="true" value="2024"/>
					<br/>
					<sf:errors path="year" class="error"/></td>
			</tr>

			<tr>
				<td class="label">Term: </td>
				<td><sf:input class="form-control" type="number" path="term" readonly="true" value="2"/>
					<br/>
					<sf:errors path="term" class="error"/>
				</td>
			</tr>

			<tr>
				<td class="label">Code: </td>
				<td><sf:input class="form-control" type="text" path="code"/> <br/>

					<sf:errors path="code" class="error"/>
				</td>
			</tr>

			<tr>
				<td class="label">Title: </td>
				<td><sf:input class="form-control" type="text" path="title"/> <br/>

					<sf:errors path="title" class="error"/>
				</td>
			</tr>

			<tr>
				<td class="label">Part: </td>
				<td><sf:input class="form-control" type="text" path="part"/> <br/>

					<sf:errors path="part" class="error"/>
				</td>
			</tr>

			<tr>
				<td class="label">Credit: </td>
				<td><sf:input class="form-control" type="text" path="credit"/> <br/>

					<sf:errors path="credit" class="error"/>
				</td>
			</tr>

			<tr>
				<td class="label">Professor: </td>
				<td><sf:input class="form-control" type="text" path="professor"/> <br/>

					<sf:errors path="professor" class="error"/>
				</td>
			</tr>

			<tr>
				<td></td>
				<td class="center-btn"><input type="submit" class="btn btn-primary" value="수강 신청"/></td>
			</tr>
		</table>
	</sf:form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>