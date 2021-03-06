<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>
        <title>Danh sách Khách Sạn</title>
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

        <link rel="stylesheet" type="text/css" href="CSS\style.css">
    </head>

    <body>
        <!-- Start navigation bar-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
            <a class="navbar-brand" href="home"><img>LOGO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse font-weight-bold justify-content-end" id="navbarColor01">
                <c:if test="${sessionScope.loginStatus != 'logined'}">
                    <ul class='navbar-nav'>
                        <li class="nav-item">
                            <a class="btn btn-outline-primary mx-1 save-button" href='register'>Đăng ký</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-primary mx-1 save-button" href='login'>Đăng nhập</a>
                        </li>
                    </ul>
                </c:if>
                <c:if test="${sessionScope.loginStatus == 'logined'}">
                    <ul class='navbar-nav'>
                        <c:if test="${sessionScope.role == '1'}">
                            <li class="nav-item">
                                <button class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    ${sessionScope.username} 
                                </button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="manage-order-hotel-manager">Quản lý đơn đặt</a>
                                    <a class="dropdown-item" href="manage-hotel-infomation">Quản lý khách sạn</a>
                                    <a class="dropdown-item" href="logout">Đăng xuất</a>
                                </div>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.role == '2'}">
                            <li class="nav-item">
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        ${sessionScope.username} 
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="manage-order-user">Quản lý đơn đặt</a>
                                        <a class="dropdown-item" href="logout">Đăng xuất</a>
                                    </div>
                                </div>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.role == '0'}">
                            <li class="nav-item">
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        ${sessionScope.username} 
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="admin">Quản Trị</a>
                                        <a class="dropdown-item" href="manage-order-user">Quản lý đơn đặt</a>
                                        <a class="dropdown-item" href="logout">Đăng xuất</a>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </c:if>

            </div>
        </nav>
        <!-- End Navigation Bar-->
        <div class="jumbotron shadow-lg">
            <div class="row justify-content-center opacity-animated">
                <div class="col-md-8">
                    <form action="search" method="GET">
                        <div class="form-group">
                            <label for="address">Địa Điểm</label>
                            <input type="text" class="form-control form-control-lg" id="address"
                                   placeholder="${requestScope.address}" name="address" value="${requestScope.address}" required>
                        </div>
                        <div class="row form-group">
                            <div class="form-group col-12 col-sm-6">
                                <label>Ngày Checkin</label>
                                <input id='checkinday' type="date" name="bdayCheckin" max="31-12-3000" min="24-05-2019"
                                       class="form-control form-control-lg" value="${requestScope.bdayCheckin}" required>
                            </div>
                            <div class="form-group col-12 col-sm-6 ">
                                <label>Ngày Checkout</label>
                                <input id='checkoutday' type="date" name="bdayCheckout" min="01-01-2019" max="31-12-3000"
                                       class="form-control form-control-lg" value="${requestScope.bdayCheckout}" required>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="form-group col-12 col-md-6 col-lg-4">
                                <label class='d-block'>Số Khách</label>
                                <div class='btn-group d-flex'>
                                    <button type='button' class='btn btn-lg btn-primary px-3 w-100' id="decreaseMaxPeople">-</button>
                                    <button type='button' class='btn btn-lg btn-light px-5 w-100' id="quanlityMaxPeopleSpan">${requestScope.guests}</button>
                                    <input type="hidden" name="guests" value="${requestScope.guests}" id="quanlityMaxPeopleInput">
                                    <button type="button" class='btn btn-lg btn-primary px-3 w-100' id="increaseMaxPeople">+</button>
                                </div>
                            </div>
                            <div class="form-group col-12 col-md-6 col-lg-4">
                                <label for='soPhong' class='d-block'>Số Phòng</label>
                                <div class='btn-group d-flex'>
                                    <button type='button' class='btn btn-lg btn-primary px-3 w-100' id="decreaseQuanlityRoom">-</button>
                                    <button type='button' class='btn btn-lg btn-light px-5 w-100' id="quanlityRoomSpan">${requestScope.rooms}</button>
                                    <input type="hidden" name="rooms" value="${requestScope.rooms}" id="quanlityRoomInput">
                                    <button type="button" class='btn btn-lg btn-primary px-3 w-100' id="increaseQuanlityRoom">+</button>
                                </div>
                            </div>
                            <div class="form-group col-12 col-md-12 col-lg-4">
                                <label class='invisible'>.</label>
                                <!--<a href="list-hotel.html" class="btn-primary form-control form-control-lg text-center nav-link">Tìm</a>-->
                                <!--USE BUTTON BELOW WHEN CODING !!!-->
                                <button type="submit" class="btn-primary form-control form-control-lg" >Tìm</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <hr>
        <div class="container">
            <div class="font-weight-bold lead pb-3 text-shadow-blur">Dưới đây là các khách sạn phù hợp yêu cầu của bạn (có ${requestScope.hotelnumber} Khách sạn)
            </div>
            <c:forEach var="searchhotel" items="${requestScope.hotel}">
                <div class="card my-3">
                    <div class="card-header bg-primary text-light font-weight-bold">${searchhotel.getHotelImage().getHotel().getHotelName()}<span> - ${searchhotel.getHotelImage().getHotel().getRate()}/5
                        </span><span class="text-warning">★</span></div>
                    <div class="card-body row p-0">
                        <div class="col-sm-12 col-md-4">
                            <img src="${searchhotel.getHotelImage().getLinkImage()}" class="img-responsive w-100 h-100">
                        </div>
                        <div class="col-sm-12 col-md-8">
                            <div class="text-secondary">Khách sạn ${searchhotel.getHotelImage().getHotel().getStar()} sao</div>
                            <div>${searchhotel.getHotelImage().getHotel().getAddress()}</div>
                            <hr>
                            <div class="container-fluid">
                                <div class="row">
                                    <c:forEach var="ultility" items="${searchhotel.getUtilitieses()}">
                                        <span class="btn-outline-primary btn col-sm-6 col-md-3">✓ ${ultility.getUtilityName()}</span>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="ViewOneHotel?id=${searchhotel.getHotelImage().getHotel().getIdHotel()}" class="btn btn-primary stretched-link float-right">Xem các phòng</a>
                    </div>
                </div>
            </c:forEach>

            <!--        <ul class="pagination justify-content-center mt-5">
                            <li class="page-item"><a class="page-link" href="search?page=${requestScope.page - 1}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">Trang trước</a></li>
                            <li class="page-item active"><a class="page-link" href="search?page=${requestScope.page}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">${requestScope.page}</a></li>
                            <li class="page-item"><a class="page-link" href="search?page=${requestScope.page + 1}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">${requestScope.page + 1}</a></li>
                            <li class="page-item"><a class="page-link" href="search?page=${requestScope.page + 2}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">${requestScope.page + 2}</a></li>
                            <li class="page-item"><a class="page-link" href="search?page=${requestScope.page + 3}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">${requestScope.page + 3}</a></li>
                            <li class="page-item"><a class="page-link" href="search?page=${requestScope.page + 1}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">Trang sau</a></li>
                        </ul>-->

            <ul class="pagination justify-content-center mt-5">
                <c:choose>
                    <c:when test="${requestScope.page == 1}">
                        <li class="page-item disabled "><a class="page-link">Trang trước</a></li>
                        </c:when>
                        <c:otherwise>
                        <li class="page-item"><a class="page-link" href="search?page=${requestScope.page - 1}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">Trang trước</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="page" begin="${requestScope.min}" end="${requestScope.max}" step="1">
                        <c:choose>
                            <c:when test="${requestScope.page == pageScope.page}">
                            <li class="page-item active"><a class="page-link" href="search?page=${pageScope.page}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">${pageScope.page}</a></li>
                            </c:when>
                            <c:otherwise>
                            <li class="page-item "><a class="page-link" href="search?page=${pageScope.page}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">${pageScope.page}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${requestScope.page == requestScope.lastPage}">
                        <li class="page-item disabled "><a class="page-link">Trang sau</a></li>
                        </c:when>
                        <c:otherwise>
                        <li class="page-item"><a class="page-link" href="search?page=${requestScope.page + 1}&address=${requestScope.address}&bdayCheckin=${requestScope.bdayCheckin}&bdayCheckout=${requestScope.bdayCheckout}&guests=${requestScope.guests}&rooms=${requestScope.rooms}">Trang sau</a></li>
                        </c:otherwise>
                    </c:choose>           
            </ul>
        </div>
        <!--END List Hotel-->
        <!-- End Navigation Bar-->
        <footer class="container-fluid" id="lien-he-gop-y">
            <div class="row">
                <div class="col-sm-12 col-md-8">
                    <h6>Trường Đại Học Công Nghiệp Hà Nội</h6>
                    <h4>Nhóm thực hiện: Nhóm 05 ĐH KTPM3 K11</h4>
                    <h4>Đề tài: HỆ THỐNG QUẢN LÝ ĐẶT KHÁCH SẠN</h4>
                    <h4>Với sự hướng dẫn của thầy: <span class="text-info font-weight-bold">ThS. Hoàng Quang Huy</span></h4>
                    <br>
                    <hr>
                    <div class="text-center lead">Các thành viên trong nhóm</div>
                    <br>
                    <div class="row">
                        <div class="col-sm-6 col-md-4 pb-3 text-center">
                            <h5>Nguyễn Văn Công</h5>
                            <h5>1141360237</h5>
                            <p>036 488 3022</p>
                            <p>nvc19021998@gmail.com</p>
                        </div>
                        <div class="col-sm-6 col-md-4 pb-3 text-center border-left border-right">
                            <h5>Phạm Hải Dương</h5>
                            <h5>1141360254</h5>
                            <p>033 749 3535</p>
                            <p>Haiduog@gmail.com</p>
                        </div>
                        <div class="col-sm-6 col-md-4 pb-3 text-center">
                            <h5>Nguyễn Phú Luật</h5>
                            <h5>1141360177</h5>
                            <p>034 999 3893</p>
                            <p>ongluatlangvang@gmail.com</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4">
                    <h4>Mọi ý kiến, thắc mắc, góp ý xin hãy gửi về cho chúng tôi: </h4>
                    <form class="form">
                        <label>Email: </label>
                        <input type="email" class="form-control" size="50" placeholder="Địa chỉ Email">
                        <label>Số điện thoại: </label>
                        <input type="tel" class="form-control" placeholder="Số điện thoại">
                        <label>Nội dung: </label>
                        <textarea class="form-control" style="height: 170px" placeholder="Nội dung"></textarea>
                        <button type="button" id="hustestr" class="form-control btn-primary my-3">Gửi</button>
                    </form>
                </div>
            </div>
        </footer>

        <script src="JS\action.js"></script>

    </body></html>