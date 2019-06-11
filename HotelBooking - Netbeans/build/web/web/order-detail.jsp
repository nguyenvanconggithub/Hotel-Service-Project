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
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
            aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse font-weight-bold justify-content-end" id="navbarColor01">
            <ul class='navbar-nav'>
                <li class="nav-item">
                    <button class="btn btn-outline-primary mx-1 save-button" href='#'>Đăng ký</a>
                </li>
                <li class="nav-item">
                    <button class="btn btn-outline-primary mx-1 save-button" href='#'>Đăng nhập</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <h2>Khách Sạn Hà Nội Plaza<span> - 4/5</span><span class="text-warning">&bigstar;</span></h2>
        <div class="text-secondary">Khách sạn 3 sao</div>
        <div class="font-italic">068 686 6868</div>
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
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Máy lạnh</span>
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Lễ tân 24/24</span>
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Thang máy</span>
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Nhà hàng</span>
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Wifi</span>
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Hồ bơi</span>
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Hỗ trợ đỗ xe</span>
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Nhận thú nuôi</span>
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Phòng thể hình</span>
                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; Phòng Spa</span>
            </div>
        </div>
    </div>
    <hr />
    <div class="jumbotron container shadow">
        <div class="row">
            <div class="col-sm-12 col-md-6">
                <div>Mã Đơn: <span class="text-primary">#68686868</span> vào lúc 25/05/2019 11:20 AM</div>
                <div>Số phòng thuê: 4 Phòng</div>
                <div>Có thể chứa tối đa: 8 Người</div>
                <div class="font-weight-bold lead">Checkin: 31/05/2019</div>
                <div class="font-weight-bold lead">Checkout: 06/06/2019</div>
                <div class="font-weight-bold lead text-success">Giá: 2 240 000 VND</div>
            </div>
            <div class="col-sm-12 col-md-6">
                <div class="font-weight-bold lead">Họ tên liên hệ: Nguyễn Văn A</span></div>
                <div class="font-weight-bold lead">Email: example@email.com</div>
                <div class="font-weight-bold lead">SĐT: 068 666 8888</div>
            </div>
        </div>
    </div>
    <div class="container">
        <hr/>
        <div class="font-weight-bold lead pb-3 text-shadow-blur">Danh sách các phòng đã đặt trong đơn này: </div>
        <!-- Modal -->
        <div class="modal fade" id="modalRoomImage_1" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <div class="modal fade" id="modalRoomImage_2" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <div class="modal fade" id="modalRoomImage_3" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Phòng Tiêu Chuẩn - Phòng Đơn</h5>
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
    <div class="modal fade" id="modalRoomImage_4" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <div class="card my-3">
        <div class="card-header bg-primary text-light font-weight-bold">Phòng Tiêu Chuẩn <span> - Phòng
                Đơn</span>
        </div>
        <div class="card-body row p-0">
            <div class="col-sm-12 col-md-4">
                <img src="images/IMG_room_001.jpg" class="img-responsive w-100 h-100 cursor-pointer"
                    data-toggle="modal" data-target="#modalRoomImage_1">
            </div>
            <div class="col-sm-12 col-md-8">
                <div class="row">
                    <div class="text-secondary col-12">20 m2</div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-3">2 Người</div>
                    <div class="col-sm-12 col-md-6 col-lg-3">Giường đôi</div>
                    <div class="col-sm-12 col-md-12 col-lg-6">
                            Tên khách: <span class="font-weight-bold">Nguyễn Văn B</span>
                    </div>
                </div>
                <div class="text-success font-weight-bold">Giá: 560 000 VNĐ</div>
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
            <a href='#' class="btn btn-outline-danger float-right">Hủy đặt phòng này</a>
        </div>
    </div>
    <!--CANCEL ROOM-->
    <div class="card my-3 bg-secondary">
        <div class="card-header bg-secondary text-dark font-weight-bold">Phòng Tiêu Chuẩn <span> - Phòng
                Đơn - CANCELED</span>
        </div>
        <div class="card-body row p-0">
            <div class="col-sm-12 col-md-4">
                <img src="images/IMG_room_001.jpg" class="img-responsive w-100 h-100 cursor-pointer grayscale"
                    data-toggle="modal" data-target="#modalRoomImage_2">
            </div>
            <div class="col-sm-12 col-md-8">
                <div class="row">
                    <div class="text-secondary col-12">20 m2</div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-3">2 Người</div>
                    <div class="col-sm-12 col-md-6 col-lg-3">Giường đôi</div>
                    <div class="col-sm-12 col-md-12 col-lg-6">
                            Tên khách: <span class="font-weight-bold">Nguyễn Văn B</span>
                    </div>
                </div>
                <div class="text-secondary font-weight-bold">Giá: 560 000 VNĐ</div>
                <hr />
                <div class="container-fluid">
                    <div class="row">
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Máy lạnh</span>
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Lễ tân 24/24</span>
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Thang máy</span>
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Nhà hàng</span>
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Wifi</span>
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Hồ bơi</span>
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Hỗ trợ đỗ xe</span>
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Nhận thú nuôi</span>
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Phòng thể
                            hình</span>
                        <span class="btn-outline-muted btn col-sm-6 col-md-3">&check; Phòng Spa</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="btn btn-outline-danger float-right ">CANCELED</div>
        </div>
        <!--END CANCELED ROOM-->
    </div>
    <div class="card my-3">
        <div class="card-header bg-primary text-light font-weight-bold">Phòng Tiêu Chuẩn <span> - Phòng
                Đơn</span>
        </div>
        <div class="card-body row p-0">
            <div class="col-sm-12 col-md-4">
                <img src="images/IMG_room_001.jpg" class="img-responsive w-100 h-100 cursor-pointer"
                    data-toggle="modal" data-target="#modalRoomImage_3">
            </div>
            <div class="col-sm-12 col-md-8">
                <div class="row">
                    <div class="text-secondary col-12">20 m2</div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-3">2 Người</div>
                    <div class="col-sm-12 col-md-6 col-lg-3">Giường đôi</div>
                    <div class="col-sm-12 col-md-12 col-lg-6">
                            Tên khách: <span class="font-weight-bold">Nguyễn Văn B</span>
                    </div>
                </div>
                <div class="text-success font-weight-bold">Giá: 560 000 VNĐ</div>
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
            <a href='#' class="btn btn-outline-danger float-right">Hủy đặt phòng này</a>
        </div>
    </div>
    <div class="card my-3">
            <div class="card-header bg-primary text-light font-weight-bold">Phòng Tiêu Chuẩn <span> - Phòng
                    Đơn</span>
            </div>
            <div class="card-body row p-0">
                <div class="col-sm-12 col-md-4">
                    <img src="images/IMG_room_001.jpg" class="img-responsive w-100 h-100 cursor-pointer"
                        data-toggle="modal" data-target="#modalRoomImage_4">
                </div>
                <div class="col-sm-12 col-md-8">
                    <div class="row">
                        <div class="text-secondary col-12">20 m2</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-6 col-lg-3">2 Người</div>
                        <div class="col-sm-12 col-md-6 col-lg-3">Giường đôi</div>
                        <div class="col-sm-12 col-md-12 col-lg-6">
                            Tên khách: <span class="font-weight-bold">Nguyễn Văn B</span>
                        </div>
                    </div>
                    <div class="text-success font-weight-bold">Giá: 560 000 VNĐ</div>
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
                <a href='#' class="btn btn-outline-danger float-right">Hủy đặt phòng này</a>
            </div>
        </div>
    <div class="lead text-shadow-blur">Ghi chú: </div>
    <div class="border p-3 text-center min-h-300px">
            Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note 
            Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note
            Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note
            Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note
            Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note
            Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note Example Note
    </div>
    <button type="button" class="btn btn-outline-danger w-100 my-3">Hủy Đơn</button>
    </div>
    <hr/>
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