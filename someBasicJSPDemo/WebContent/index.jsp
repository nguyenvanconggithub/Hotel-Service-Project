<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link href="${pageContext.request.contextPath }/views/changeParaColor.css" rel="stylesheet">
</head>
<body>
<div>
	<ul>
		<li><a href='#'>Trang chủ</a></li>
		<li><a href = '${pageContext.request.contextPath }/danh-sach'>Danh Sách Sinh Viên</a></li>
		<li><a href = "${pageContext.request.contextPath }/danh-sach-Panination?page=1">Danh Sách is Paged</a></li>
	</ul>
</div>
<p>Red?YES:NO</p>
</body>
</html>