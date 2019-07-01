<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Thống kê đơn</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="CSS/style.css">
    </head>

    <body>
        <!-- this Nav for BIG Screen Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow big-scr">
            <a class="navbar-brand" href="#"><img>LOGO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse font-weight-bold justify-content-end" id="navbarColor01">
                <ul class='navbar-nav'>
                    <li class="nav-item">
                        <label class="mx-1 text-light">Xin Chào, ${sessionScope.username} !</label>
                        <hr class="bg-light" />
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-1" href='manage-account'>Quản Lý Tài Khoản</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-1" href='analys-order'>Thống Kê Đơn</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-1" href='logout'>Đăng Xuất</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <!-- This Div collumn for Small Screen Navigation-->
                <div class="col-12 col-lg-3 col-xl-2 sm-scr bg-dark text-light fullViewHeight"
                     style="position:sticky;top:0;">
                    <div class="lead mt-5">Xin chào, ${sessionScope.username} !</div>
                    <div class="font-italic d-flex justify-content-end my-3"><a href="logout" class="text-light">Đăng xuất</a>
                    </div>
                    <hr class="bg-light" />
                    <ul class="nav flex-column mt-5">
                        <li class="nav-item">
                            <a class="nav-link text-light active" href="manage-account">Quản Lý Tài Khoản</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="analys-order">Thống Kê Đơn</a>
                        </li>
                    </ul>
                </div>
                <div class="col-12 col-lg-9 col-xl-10 my-5">
                    <div class="container-fluid">
                        <h3 class="font-weight-bold my-3">Thống Kê Đơn</h3>
                        <table class="table table-striped table-hover laptop">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col" class="sticky">#IDBooking</th>
                                    <th scope="col" class="sticky">Người Đặt</th>
                                    <th scope="col" class="sticky">Số Điện Thoại</th>
                                    <th scope="col" class="sticky">Thời Gian Đặt</th>
                                    <th scope="col" class="sticky">Khách Sạn</th>
                                    <th scope="col" class="sticky">Checkin</th>
                                    <th scope="col" class="sticky">Checkout</th>
                                    <th scope="col" class="sticky">Tổng Giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"></c:set>
                                <c:forEach var="oneBookingInfo" items="${requestScope.fullBookingInfoPC}">
                                    <tr>
                                        <th scope="row">#${pageScope.oneBookingInfo.getIdBooking()}</th>
                                        <td>${pageScope.oneBookingInfo.getUser().getName()}</td>
                                        <td>${pageScope.oneBookingInfo.getUser().getPhone()}</td>
                                        <td>${pageScope.oneBookingInfo.getOrderTime()}</td>
                                        <td>${pageScope.oneBookingInfo.getHotel().getHotelName()}</td>
                                        <td>${pageScope.oneBookingInfo.getCheckIn()}</td>
                                        <td>${pageScope.oneBookingInfo.getCheckOut()}</td>
                                        <td>${requestScope.fullBookingCostPC.get(count)}</td>
                                    </tr>
                                    <c:set var="count" value="${pageScope.count + 1}"></c:set>
                                </c:forEach>
                            </tbody>
                        </table>
                        <table class="table table-striped table-hover tablet mobile">
                        <c:set var="count" value="0"></c:set>
                            <c:forEach var="oneBookingInfo" items="${requestScope.fullBookingInfoM}">
                                <tr class="row">
                                    <th class="col-6">#IDBooking</th>
                                    <td class="col-6">#${pageScope.oneBookingInfo.getIdBooking()}</td>
                                </tr>
                                <tr class="row">
                                    <th class="col-6">Người Đặt</th>
                                    <td class="col-6">${pageScope.oneBookingInfo.getUser().getName()}</td>
                                </tr>
                                <tr class="row">
                                    <th class="col-6">Số Điện Thoại</th>
                                    <td class="col-6">${pageScope.oneBookingInfo.getUser().getPhone()}</td>
                                </tr>
                                <tr class="row">
                                    <th class="col-6">Thời Gian Đặt</th>
                                    <td class="col-6">${pageScope.oneBookingInfo.getOrderTime()}</td>
                                </tr>
                                <tr class="row">
                                    <th class="col-6">Khách Sạn</th>
                                    <td class="col-6">${pageScope.oneBookingInfo.getHotel().getHotelName()}</td>
                                </tr>
                                <tr class="row">
                                    <th class="col-6">Checkin</th>
                                    <td class="col-6">${pageScope.oneBookingInfo.getCheckIn()}</td>
                                </tr>
                                <tr class="row">
                                    <th class="col-6">Checkout</th>
                                    <td class="col-6">${pageScope.oneBookingInfo.getCheckOut()}</td>
                                </tr>
                                <tr class="row">
                                    <th class="col-6">Tổng Giá</th>
                                    <td class="col-6">${requestScope.fullBookingCostM.get(count)}</td>
                                </tr>
                                <tr class="row">
                                    <td class="col-12 p-0 m-0">
                                        <hr class="bg-primary" />
                                    </td>
                                </tr>
                                <c:set var="count" value="${pageScope.count + 1}"></c:set>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="row dark-mode  justify-content-center mt-5">
                        <ul class="pagination sm-scr">
                            <c:choose>
                                <c:when test="${requestScope.pagePC == 1}">
                                    <li class="page-item disabled "><a class="page-link">Trang trước</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="analys-order?page=${requestScope.pagePC - 1}">Trang trước</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="page" begin="${requestScope.minPC}" end="${requestScope.maxPC}" step="1">
                                    <c:choose>
                                        <c:when test="${requestScope.pagePC == pageScope.page}">
                                        <li class="page-item active"><a class="page-link" href="analys-order?page=${pageScope.page}">${pageScope.page}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li class="page-item "><a class="page-link" href="analys-order?page=${pageScope.page}">${pageScope.page}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${requestScope.pagePC == requestScope.lastPagePC}">
                                    <li class="page-item disabled "><a class="page-link">Trang sau</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="analys-order?page=${requestScope.pagePC + 1}">Trang sau</a></li>
                                    </c:otherwise>
                                </c:choose>           
                        </ul>

                        <ul class="pagination big-scr">
                            <c:choose>
                                <c:when test="${requestScope.pageM == 1}">
                                    <li class="page-item disabled "><a class="page-link">Trang trước</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="analys-order?page=${requestScope.pageM - 1}">Trang trước</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="page" begin="${requestScope.minM}" end="${requestScope.maxM}" step="1">
                                    <c:choose>
                                        <c:when test="${requestScope.pageM == pageScope.page}">
                                        <li class="page-item active"><a class="page-link" href="analys-order?page=${pageScope.page}">${pageScope.page}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li class="page-item "><a class="page-link" href="analys-order?page=${pageScope.page}">${pageScope.page}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${requestScope.pageM == requestScope.lastPageM}">
                                    <li class="page-item disabled "><a class="page-link">Trang sau</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="analys-order?page=${requestScope.pageM + 1}">Trang sau</a></li>
                                    </c:otherwise>
                                </c:choose>           
                        </ul>
                    </div>
                </div>

            </div>


        </div>


    </body>
    <script src="../JS\action.js"></script>

</html>