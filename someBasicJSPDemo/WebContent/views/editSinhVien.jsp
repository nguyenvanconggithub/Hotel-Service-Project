<%@page import="modal.SinhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Sinh Viên</title>
</head>
<body>
<% SinhVien sv = (SinhVien)request.getAttribute("SinhVienINFO"); %>
	<table>
		<tr>
			<td><label>Mã Sinh Viên: </label></td>
			<td><input value="<%= sv.getMaSV()%>" type="text" disabled="disabled"></input></td>
		</tr>
		<tr>
			<td><label>Họ Tên Sinh Viên: </label></td>
			<td><input value="<% out.print(sv.getHoTen());%>"></input></td>
		</tr>
		<tr>
			<td><label>Số Điện Thoại: </label></td>
			<td><input value="<%= sv.getSDT()%>"></input></td>
		</tr>
	</table>
</body>
</html>