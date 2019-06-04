<%@page import="java.util.ArrayList"%>
<%@page import="modal.SinhVien"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Sinh Viên</title>
</head>
<body>
<table border="1">
	<thead>
		<tr>
			<th>Mã Sinh Viên</th>
			<th>Họ Tên Sinh Viên</th>
			<th>Số Điện Thoại</th>
			<th colspan=2>ACTION</th>
		</tr>
	</thead>
	<tbody>
		<%-- Use Scriplet --%>
		<%
			ArrayList<SinhVien> arr = (ArrayList<SinhVien>)request.getAttribute("ListSinhVien");
			for(SinhVien sv : arr){
				out.print("<tr>");
				out.print("<td>"+sv.getMaSV()+"</td>");
				out.print("<td>"+sv.getHoTen()+"</td>");
				out.print("<td>"+sv.getSDT()+"</td>");
				String hrefEdit = request.getContextPath() + "/edit?MaSV=" + sv.getMaSV().toString();
				out.print("<td><a href='"+hrefEdit+"'>EDIT</a></td>");
				out.print("<td><a href='${pageContext.request.contextPath }/remove?MaSV="+sv.getMaSV()+"'>REMOVE</a></td>");
				out.print("</tr>");
			}
		%>
		<!--
		<tr><td colspan="3"></td></tr> 
		<%--Use TagLib --%>
		<c:forEach var="sv" items="${ListSinhVien }">
			<tr>
				<td>${sv.getMaSV() }</td>
				<td>${sv.getHoTen() }</td>
				<td>${sv.getSDT() }</td>
				<td><a href="${pageContext.request.contextPath }/danh-sach/edit?MaSV=${sv.getMaSV()}">EDIT</a></td>
				<td><a href='${pageContext.request.contextPath }/remove?MaSV=${sv.getMaSV()}'>REMOVE</a></td>
			</tr>
		</c:forEach>
		-->
	</tbody>
</table>
</body>
</html>