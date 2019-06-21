<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Bootstrap Example</title>
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
                        <label class="mx-1 text-light">Xin Chào, Administrator</label>
                        <hr class="bg-light" />
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-1" href='#'>Quản Lý Tài Khoản</a>
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
                    <div class="lead mt-5">Xin chào, Administrator !</div>
                    <div class="font-italic d-flex justify-content-end my-3"><a href="#" class="text-light">Đăng xuất</a>
                    </div>
                    <hr class="bg-light" />
                    <ul class="nav flex-column mt-5">
                        <li class="nav-item">
                            <a class="nav-link text-light active" href="#">Quản Lý Tài Khoản</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="analys-order">Thống Kê Đơn</a>
                        </li>
                    </ul>
                </div>
                <div class="col-12 col-lg-9 col-xl-10 my-5">
                    <div class="container-fluid">
                        <h3 class="font-weight-bold my-3">Quản Lý Tài Khoản</h3>
                        <table class="table laptop table-striped table-hover text-center">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col" class="sticky">Tên Đăng Nhập</th>
                                    <th scope="col" class="sticky">Quyền</th>
                                    <th scope="col" class="sticky">Trạng Thái</th>
                                    <th scope="col" class="sticky">Họ Tên</th>
                                    <th scope="col" class="sticky">Email</th>
                                    <th scope="col" class="sticky">Số Điện Thoại</th>
                                    <th scope="col" class="sticky">Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach  var="acc" items="${requestScope.listAcc}">
                                    <tr>
                                        <td>${acc.getAccount().getUserName()}</td>
                                        <c:if test="${acc.getAccount().getRole()==1}">
                                            <td>Manage-Hotel</td>
                                        </c:if>
                                        <c:if test="${acc.getAccount().getRole()==2}">
                                            <td>User</td>
                                        </c:if>
                                        <c:if test="${acc.getAccount().getStatus()==0}">
                                            <td>Bị Khóa</td>
                                        </c:if>
                                        <c:if test="${acc.getAccount().getStatus()==1}">
                                            <td>Hoạt Động</td>
                                        </c:if>
                                        <td>${acc.getName()}</td>
                                        <td>${acc.getEmail()}</td>
                                        <td>${acc.getPhone()}</td>
                                        <c:if test="${acc.getAccount().getStatus()==1}">
                                            <td>
                                                <form method="Post" action="manage-account">
                                                    <input type="hidden" value="${acc.getAccount().getUserName()}" name="userN">
                                                    <input type="hidden" value="0" name="status">
                                                    <button class="btn btn-outline-danger" type="submit" >Khóa</button>
                                                </form>
                                            <td
                                            </c:if>
                                            <c:if test="${acc.getAccount().getStatus()==0}">
                                        <td>
                                            <form method="Post" action="manage-account">
                                                <input type="hidden" value="${acc.getAccount().getUserName()}" name="userN">
                                                <input type="hidden" value="1" name="status">
                                                <button class="btn btn-outline-primary" type="submit" >Mở</button>
                                            </form>
                                        <td
                                        </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="table tablet mobile table-striped table-hover">
                    <!-- 1 Thông tin Tài Khoản-->
                    <c:forEach  var="acc" items="${requestScope.listAcc}">
                        <tr class="row">
                            <th class="col-6">Tên Đăng Nhập</th>
                            <td class="col-6">${acc.getAccount().getUserName()}</td>
                        </tr>
                        <tr class="row">
                            <th class="col-6">Quyền</th>
                                <c:if test="${acc.getAccount().getRole()==1}">
                                <td class="col-6">Manage-Hotel</td>
                            </c:if>
                            <c:if test="${acc.getAccount().getRole()==2}">
                                <td class="col-6">User</td>
                            </c:if>
                        </tr>

                        <tr class="row">
                            <th class="col-6">Trạng Thái</th>
                                <c:if test="${acc.getAccount().getStatus()==0}">
                                <td class="col-6">Bị Khóa</td>
                            </c:if>
                            <c:if test="${acc.getAccount().getStatus()==1}">
                                <td class="col-6">Hoạt Động</td>
                            </c:if>
                        </tr>

                        <tr class="row">
                            <th class="col-6">Họ Tên</th>
                            <td class="col-6">${acc.getName()}</td>
                        </tr>

                        <tr class="row">
                            <th class="col-6">Email</th>
                            <td class="col-6">${acc.getEmail()}</td>
                        </tr>

                        <tr class="row">
                            <th class="col-6">Số Điện Thoại</th>
                            <td class="col-6">${acc.getPhone()}</td>
                        </tr>

                        <tr class="row">
                            <c:if test="${acc.getAccount().getStatus()==1}">
                                <td class="col-12">
                                    <form method="Post" action="manage-account">
                                        <input type="hidden" value="${acc.getAccount().getUserName()}" name="userN">
                                        <input type="hidden" value="0" name="status">
                                        <button class="btn btn-outline-danger" type="submit" >Khóa</button>
                                    </form>
                                <td
                                </c:if>
                                <c:if test="${acc.getAccount().getStatus()==0}">
                            <td class="col-12">
                                <form method="Post" action="manage-account">
                                    <input type="hidden" value="${acc.getAccount().getUserName()}" name="userN">
                                    <input type="hidden" value="1" name="status">
                                    <button class="btn btn-outline-primary" type="submit" >Mở</button>
                                </form>
                            <td
                            </c:if>
                </tr>

                <tr class="row">
                    <td class="col-12 p-0 m-0">
                        <hr class="bg-primary" />
                    </td>
                </tr>
            </c:forEach>
            <!-- END 1 thông tin Tài Khoản-->
        </table>
    </div>
    <div class="row dark-mode  justify-content-center mt-5">
        <ul class="pagination">
            <c:choose>
                <c:when test="${requestScope.page == 1}">
                    <li class="page-item disabled "><a class="page-link">Trang trước</a></li>
                    </c:when>
                    <c:otherwise>
                    <li class="page-item"><a class="page-link" href="manage-account?page=${requestScope.page - 1}">Trang trước</a></li>
                    </c:otherwise>
                </c:choose>
                <c:forEach var="page" begin="${requestScope.min}" end="${requestScope.max}" step="1">
                    <c:choose>
                        <c:when test="${requestScope.page == pageScope.page}">
                        <li class="page-item active"><a class="page-link" href="manage-account?page=${pageScope.page}">${pageScope.page}</a></li>
                        </c:when>
                        <c:otherwise>
                        <li class="page-item "><a class="page-link" href="manage-account?page=${pageScope.page}">${pageScope.page}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${requestScope.page == requestScope.lastPage}">
                    <li class="page-item disabled "><a class="page-link">Trang sau</a></li>
                    </c:when>
                    <c:otherwise>
                    <li class="page-item"><a class="page-link" href="manage-account?page=${requestScope.page + 1}">Trang sau</a></li>
                    </c:otherwise>
                </c:choose>         
        </ul>
    </div>

</div>

</div>

</div>

</body>
<script src="JS\action.js"></script>

</html>