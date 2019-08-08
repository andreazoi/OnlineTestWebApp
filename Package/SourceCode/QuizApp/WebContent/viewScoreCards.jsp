<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> Quiz App</title>
	<style type="text/css">
	table {
		font-family: arial, sans-serif;
		border-collapse: collapse;
		width: 100%;
	}
	
	td, th {
		border: 1px solid #dddddd;
		text-align: left;
		padding: 8px;
	}
	
	tr:nth-child(even) {
		background-color: #dddddd;
	}
	</style>
</head>
<body>

	<h2>
		Score Cards of <c:out value="${username}"/>
	</h2>

	<table>
		<tr>
			<th>Test</th>
			<th>Total Question</th>
			<th>Category</th>
			<th>Difficulty</th>
			<th>Correct Question</th>
			<th>Incorrect Question</th>
			<th>Percentage</th>
			<th>Grade</th>
		</tr>
		<c:if test="${empty scoreCard}">
			<tr>
				<td colspan="8" align="center">Score cards not found!</td>
			</tr>
		</c:if>
		<c:set var="Cnt" value="1" scope="page" />
		<c:forEach items="${scoreCard}" var="scoreCard">
			<tr>
				<td><c:out value="${Cnt}"/></td>
				<td><c:out value="${scoreCard.totalQuestion}"/></td>
				<td><c:out value="${scoreCard.category}"/></td>
				<td><c:out value="${scoreCard.difficulty}"/></td>
				<td><c:out value="${scoreCard.correctQuestion}"/></td>
				<td><c:out value="${scoreCard.incorrectQuestion}"/></td>
				<td><c:out value="${scoreCard.percentage}"/></td>
				<td><c:out value="${scoreCard.grade}"/></td>
			</tr>
			<c:set var="Cnt" value="${Cnt + 1}" scope="page"/>
		</c:forEach>
		<tr>
			<td colspan="8">
				<a href="index.jsp"><input type="button" name="back" value="Back"></a>
				<c:if test="${not empty file}">
					<c:out value="${file}"/>
				</c:if>
			</td>
		</tr>
	</table>

</body>
</html>
