<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

        <link rel="stylesheet" type="text/css" href="CSS\style.css">
    </head>

    <body>
        <!-- Start navigation bar-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
            <a class="navbar-brand" href="#">LOGO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse font-weight-bold justify-content-end" id="navbarColor01">
                <ul class='navbar-nav'>
                    <!-- 
                        >>>>>Use this comment if system is not signed in<<<
    
                    <li class="nav-item">
                        <button class="btn btn-outline-primary mx-1 save-button" href='#'>Đăng ký</a>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-outline-primary mx-1 save-button" href='#'>Đăng nhập</a>
                    </li>
                    -->
                    <li class="nav-item">
                        <div class="dropdown">
                            <button class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Người dùng
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="manage-order-user.html">Quản lý đơn đặt</a>
                                <a class="dropdown-item" href="#">Đăng xuất</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Chủ KS
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="manage-order-hotel-manager.html">Quản lý đơn đặt</a>
                            <a class="dropdown-item" href="#">Quản lý khách sạn</a>
                            <a class="dropdown-item" href="#">Đăng xuất</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <h2>${hotel.getHotelName()}<span> - 4/5</span><span class="text-warning">&bigstar;</span></h2>
            <div class="text-secondary">Khách sạn ${hotel.getStar( )} sao</div>
            <div class="font-weight-bold">9 N7B, Trung Hòa Nhân Chính, Thanh Xuân, Hà Nội 10000, Việt Nam</div>
            <hr />
        </div>
        <div class="container shadow py-2">
            <div id="hotelSlideShow" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item hotel-img active">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_demo_KhachSan_001.jpg" alt="Hotel Image">
                    </div>
                    <div class="carousel-item hotel-img">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_KhachSan_002.jpg" alt="Hotel Image">
                    </div>
                    <div class="carousel-item hotel-img">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_KhachSan_003.jpg" alt="Hotel Image">
                    </div>
                    <div class="carousel-item hotel-img">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_KhachSan_004.jpg" alt="Hotel Image">
                    </div>
                    <div class="carousel-item hotel-img">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_KhachSan_005.jpg" alt="Hotel Image">
                    </div>
                    <div class="carousel-item hotel-img">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_KhachSan_006.jpg" alt="Hotel Image">
                    </div>
                    <div class="carousel-item hotel-img">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_KhachSan_007.jpg" alt="Hotel Image">
                    </div>
                    <div class="carousel-item hotel-img">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_KhachSan_008.jpg" alt="Hotel Image">
                    </div>
                    <div class="carousel-item hotel-img">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_KhachSan_009.jpg" alt="Hotel Image">
                    </div>
                    <div class="carousel-item hotel-img">
                        <img class="d-block mx-auto img-fluid" src="images/IMG_KhachSan_010.jpg" alt="Hotel Image">
                    </div>

                </div>
                <a class="carousel-control-prev" href="#hotelSlideShow" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#hotelSlideShow" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div class="container-fluid mt-2 album-slide-show">
                <span data-target="#hotelSlideShow" data-slide-to="0" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_demo_KhachSan_001.jpg">
                </span>
                <span data-target="#hotelSlideShow" data-slide-to="1" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_KhachSan_002.jpg">
                </span>
                <span data-target="#hotelSlideShow" data-slide-to="2" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_KhachSan_003.jpg">
                </span>
                <span data-target="#hotelSlideShow" data-slide-to="3" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_KhachSan_004.jpg">
                </span>
                <span data-target="#hotelSlideShow" data-slide-to="4" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_KhachSan_005.jpg">
                </span>
                <span data-target="#hotelSlideShow" data-slide-to="5" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_KhachSan_006.jpg">
                </span>
                <span data-target="#hotelSlideShow" data-slide-to="6" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_KhachSan_007.jpg">
                </span>
                <span data-target="#hotelSlideShow" data-slide-to="7" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_KhachSan_008.jpg">
                </span>
                <span data-target="#hotelSlideShow" data-slide-to="8" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_KhachSan_009.jpg">
                </span>
                <span data-target="#hotelSlideShow" data-slide-to="9" class="storeImg d-inline-block">
                    <img class="d-block img-fluid" src="images/IMG_KhachSan_010.jpg">
                </span>
            </div>
            <div class="container">
                <hr />
                <h5 class="font-weight-bold">Tiện ích: </h5>
                <div class="row">
                    <c:forEach var="util" items="${requestScope.hotelUtil}">
                        <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; ${util.getUtility().getUtilityName()}</span>
                    </c:forEach>
                </div>
            </div>
            <hr />
            <div class="container">
                <div class="card my-3">
                    <div class="card-header bg-primary text-light font-weight-bold text-center">Thông tin đặt phòng</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12 col-md-6 font-weight-bold text-center">
                                Checkin: 31/05/2019
                            </div>
                            <div class="col-sm-12 col-md-6 font-weight-bold text-center">
                                Checkout: 06/06/2019
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-sm-12 col-md-7">
                                Phòng Tiêu Chuẩn - Phòng Đơn
                            </div>
                            <div class="col-sm-12 col-md-2">
                                Số lượng: 1
                            </div>
                            <div class="col-sm-12 col-md-3">
                                Giá: 560 000 VND
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-sm-12 col-md-7">
                                Phòng Tiêu Chuẩn - Phòng Đơn
                            </div>
                            <div class="col-sm-12 col-md-2">
                                Số lượng: 2
                            </div>
                            <div class="col-sm-12 col-md-3">
                                Giá: 1 120 000 VND
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-sm-12 col-md-7">
                                Phòng Tiêu Chuẩn - Phòng Đơn
                            </div>
                            <div class="col-sm-12 col-md-2">
                                Số lượng: 1
                            </div>
                            <div class="col-sm-12 col-md-3">
                                Giá: 560 000 VND
                            </div>
                        </div>
                        <hr />
                        <div class="row justify-content-end">
                            <div class="col-sm-12 col-md-3 text-danger font-weight-bold">
                                Tổng: 2 240 000 VND
                            </div>
                        </div>

                    </div>

                </div>
                <div class="container border border-primary py-3">
                    <div class="font-weight-bold lead pb-3 text-shadow-blur">Vui lòng điền các thông tin sau để hoàn tất: </div>
                    <form class="form">
                        <div class="row form-group">
                            <label for="fullname" class="col-sm-12 col-md-2">Họ tên</label>
                            <input type="text" name="fullname" id="fullname" class="form-control col-sm-12 col-md-4" required>
                        </div>
                        <div class="row form-group">
                            <label for="sodienthoai" class="col-sm-12 col-md-2">Số điện thoại</label>
                            <input type="tel" name="sodienthoai" id="sodienthoai" class="form-control col-sm-12 col-md-4" required>
                        </div>
                        <div class="row">
                            <label for="email" class="col-sm-12 col-md-2">Email</label>
                            <input type="email" name="email" id="email" class="form-control col-sm-12 col-md-4" required>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="khachChinh" id="khachChinh" checked>
                            <label class="custom-control-label" for="khachChinh">Tôi là khách chính</label>
                        </div>
                        <div class="font-weight-bold lead pb-3 text-shadow-blur">Danh sách các phòng:</div>
                        <!-- Modal -->
                        <div class="modal fade" id="modalRoomImage_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Phòng Tiêu Chuẩn - Phòng Đơn</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body bg-dark">
                                        <div id="room-show_1" class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_001.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_002.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_003.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_004.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_005.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_006.jpg">
                                                </div>
                                            </div>
                                            <a class="carousel-control-prev" href="#room-show_1" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#room-show_1" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalRoomImage_2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Phòng Tiêu Chuẩn - Phòng Đơn</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body bg-dark">
                                        <div id="room-show_2" class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_001.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_002.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_003.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_004.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_005.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_006.jpg">
                                                </div>
                                            </div>
                                            <a class="carousel-control-prev" href="#room-show_2" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#room-show_2" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalRoomImage_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Phòng Tiêu Chuẩn - Phòng Đơn111</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body bg-dark">
                                        <div id="room-show_3" class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_001.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_002.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_003.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_004.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_005.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_006.jpg">
                                                </div>
                                            </div>
                                            <a class="carousel-control-prev" href="#room-show_3" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#room-show_3" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modalRoomImage_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Phòng Tiêu Chuẩn - Phòng Đơn</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body bg-dark">
                                        <div id="room-show_4" class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_001.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_002.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_003.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_004.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_005.jpg">
                                                </div>
                                                <div class="carousel-item room-img">
                                                    <img class="d-block mx-auto img-fluid" src="images/IMG_room_006.jpg">
                                                </div>
                                            </div>
                                            <a class="carousel-control-prev" href="#room-show_4" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#room-show_4" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:forEach var="room" items="${requestScope.listRoom}">
                            <div class="card my-3">
                                <div class="card-header bg-primary text-light font-weight-bold">Phòng Tiêu Chuẩn <span> - Phòng
                                        Đơn</span>
                                </div>
                                <div class="card-body row p-0">
                                    <div class="col-sm-12 col-md-4">
                                        <img src="images/IMG_room_001.jpg" class="img-responsive w-100 h-100 cursor-pointer" data-toggle="modal" data-target="#modalRoomImage_1">
                                    </div>

                                    <div class="col-sm-12 col-md-8">
                                        <div class="row">
                                            <div class="text-secondary col-12">${room.getRoom().getAgcreage()}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6 col-lg-3">${room.getRoom().getPeople()}</div>
                                            <div class="col-sm-12 col-md-6 col-lg-3">${room.getRoom().getBed().getBedName()}</div>
                                            <div class="col-sm-12 col-md-12 col-lg-6">
                                                <input type="hidden" class="form-control" name="tenKhach" placeholder="Nhập tên khách">
                                            </div>
                                        </div>
                                        <div class="text-danger font-weight-bold">Giá: ${room.getRoom().getCost()} VNĐ</div>
                                        <hr />
                                        <div class="container-fluid">
                                            <div class="row">
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Máy lạnh</span>
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Lễ tân 24/24</span>
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Thang máy</span>
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Nhà hàng</span>
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Wifi</span>
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Hồ bơi</span>
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Hỗ trợ đỗ xe</span>
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Nhận thú nuôi</span>
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Phòng thể
                                                    hình</span>
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Phòng Spa</span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="card-footer">
                                    <a href='#' class="btn btn-outline-danger float-right">Xóa phòng</a>
                                </div>
                            </div>
                        </c:forEach>
            
  
                        <div class="lead">Bạn có muốn ghi chú gì không?</div>
                        <textarea class="form-control" style="height: 170px" placeholder="Hãy viết ghi chú của bạn vào đây, ghi chú sẽ được gửi cho khách sạn..."></textarea>
                        <button type="submit" class="btn btn-primary form-control mt-3">Hoàn thành</button>
                    </form>
                </div>
            </div>
            <hr />
            <footer class="container-fluid" id='lien-he-gop-y'>
                <div class="row">
                    <div class="col-sm-12 col-md-8">
                        <h6>Trường Đại Học Công Nghiệp Hà Nội</h6>
                        <h4>Nhóm thực hiện: Nhóm 05 ĐH KTPM3 K11</h4>
                        <h4>Đề tài: HỆ THỐNG QUẢN LÝ ĐẶT KHÁCH SẠN</h4>
                        <h4>Với sự hướng dẫn của thầy: <span class="text-info font-weight-bold">ThS. Hoàng Quang Huy</span>
                        </h4>
                        <br />
                        <hr />
                        <div class="text-center lead">Các thành viên trong nhóm</div>
                        <br />
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
    </body>
    <script src="JS\action.js"></script>

</html>