<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>
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
            <a class="navbar-brand" href="#"><img>LOGO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse font-weight-bold justify-content-end" id="navbarColor01">
                <c:if test="${sessionScope.loginStatus != 'logined'}">
                    <ul class='navbar-nav'>
                        <li class="nav-item">
                            <button class="btn btn-outline-primary mx-1 save-button" href='#'>Đăng ký</a>
                        </li>
                        <li class="nav-item">
                            <button class="btn btn-outline-primary mx-1 save-button" href='#'>Đăng nhập</a>
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
                                    <a class="dropdown-item" href="manage-order-hotel-manager.html">Quản lý đơn đặt</a>
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
                                        <a class="dropdown-item" href="manage-order-user.html">Quản lý đơn đặt</a>
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
                                        <a class="dropdown-item" href="logout">Quản Trị</a>
                                        <a class="dropdown-item" href="manage-order-user.html">Quản lý đơn đặt</a>
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
    <div class="container">
        <c:set var="hotel" value="${requestScope.hotel}"></c:set>
        <h2>${hotel.getHotelName()}</h2>
        <div class="text-secondary">khách sạn ${hotel.getStar()} sao</div>
        <div class="font-weight-bold">${hotel.getAddress()}</div>
        <hr>
        <div class="container shadow py-2">
            <div id="hotelSlideShow" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <c:set var="ht"  value="${requestScope.hotelImage}"></c:set>>
                    <div class="carousel-item hotel-img active">
                        <img class="d-block mx-auto img-fluid" src="${ht.get(0).getLinkImage()}" alt="Hotel Image">
                    </div>
                    <c:forEach  var="hotelImage" items="${requestScope.hotelImage}" begin="1">
                        <div class="carousel-item hotel-img">
                            <img class="d-block mx-auto img-fluid" src="${hotelImage.getLinkImage()}" alt="Hotel Image">
                        </div>
                    </c:forEach>
                    
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
                <c:set var="slide" value="0"></c:set>
                    <c:forEach  var="hotelImage2" items="${requestScope.hotelImage}">
                    <span data-target="#hotelSlideShow" data-slide-to="${slide}" class="storeImg d-inline-block">
                        <img class="d-block img-fluid" src="${hotelImage2.getLinkImage()}">
                    </span>
                    <c:set var="slide" value="${slide+1}"></c:set>
                </c:forEach>
                
            </div>
        </div>
        <div class="container">
            <c:if test="${requestScope.addSuccess==true}">
                <div class="alert alert-success" role="alter">
                    <button type="button" class="close" data-dismiss="alter" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong class="text-center" id="messageInformation">${requestScope.message}</strong>
                </div>
            </c:if>

            <c:if test="${requestScope.addSuccess==false}">
                <div class="alert alert-danger" role="alter">
                    <button type="button" class="close" data-dismiss="alter" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong class="text-center" id="messageInformation">${requestScope.message}</strong>
                </div>
            </c:if>
            <div class="font-weight-bold lead my-5 text-shadow-blur">Nhập thông tin cho phòng mới</div>
       
            <form method="POST" class="form" action="add-new-room" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${requestScope.id}">
                <div class="row form-group">
                    <label for="loaiPhong" class="col-sm-12 col-md-2">Loại phòng</label>
                    <select name="loaiPhong" class="form-control col-sm-12 col-md-6" id="loaiPhong" required="">
                         <c:forEach  var="roomTypes" items="${requestScope.roomTypes}">
                            <option value="${roomTypes.getIdRoomType()}">${roomTypes.getRoomTypeName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="row form-group">
                    <label for="loaiGiuong" class="col-sm-12 col-md-2">Tên Phòng</label>
                    <input type="text" name="tenPhongTuyChon" id="tenPhongTuyChon" class="form-control col-sm-12 col-md-4" placeholder="Tùy chọn tên phòng" maxlength="45">
                </div>

                <div class="row form-group">
                    <label for="loaiGiuong" class="col-sm-12 col-md-2">Loại giường</label>
                    <select name="loaiGiuong" class="form-control col-sm-12 col-md-6" id="loaiGiuong" required="">
                        <c:forEach  var="bed" items="${requestScope.beds}">
                            <option value="${bed.getIdBed()}">${bed.getBedName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="row form-group">
                    <div class="col-sm-12 col-md-12 col-lg-6 form-group">
                        <div class="row">
                            <label class="col-sm-12 col-md-4">Số phòng</label>
                            <div class="btn-group d-inline-block col-sm-12 col-md-8">
                                <button type="button" class="btn btn-sm btn-primary px-3" id="decreaseQuanlityRoom">-</button>
                                <span class="px-3 mx-0" id="quanlityRoomSpan">1</span>
                                <input type="hidden" name="soPhong" value="1" id="quanlityRoomInput">
                                <button type="button" class="btn btn-sm btn-primary px-3" id="increaseQuanlityRoom">+</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 form-group">
                        <div class="row">
                            <label class="col-sm-12 col-md-4">Số người tối đa</label>
                            <div class="btn-group d-inline-block col-sm-12 col-md-8">
                                <button type="button" class="btn btn-sm btn-primary px-3" id="decreaseMaxPeople">-</button>
                                <span class="px-3 mx-0" id="quanlityMaxPeopleSpan">1</span>
                                <input type="hidden" name="soNguoi" value="1" id="quanlityMaxPeopleInput">
                                <button type="button" class="btn btn-sm btn-primary px-3" id="increaseMaxPeople">+</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row form-group">
                    <label for="dienTich" class="col-sm-12 col-md-2">Diện tích</label>
                    <input type="number" name="dienTich" id="dienTich" class="form-control col-sm-12 col-md-3" step="0.1" min="0" required="">
                    <span class="font-weight-bold mx-3">Met</span>
                </div>

                <div class="row form-group">
                    <label for="gia" class="col-sm-12 col-md-2">Giá</label>
                    <input type="number" name="gia" id="gia" class="form-control col-sm-12 col-md-3" step="1000" min="0"  required="">
                    <span class="font-weight-bold mx-3">VND</span>
                </div>
                <div class="row form-group">
                    <label class="col-sm-12 col-md-2">Các tiện ích</label>
                    <div class="col-sm-12 col-md-10">
                        <div class="row">
                            <c:set var="count" value="1"></c:set>
                            <c:forEach  var="utility" items="${requestScope.listUltilities}">
                            <div class="col-6 col-sm-3 custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch${count}" value="${utility.getIdUtility()}">
                                <label class="custom-control-label" for="tienIch${count}">${utility.getUtilityName()}</label>
                            </div>
                            <c:set var="count" value="${count+1}"></c:set>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="lead text-shadow-blur font-weight-bold">Thêm ảnh để khách hàng có cái nhìn tổng quan về
                    phòng của bạn</div>
                <div class="row justify-content-center form-group">

                    <span class="bg-dark d-flex align-items-center justify-content-center opacity-50-100 position-relative square-150x150 m-2" id="image-element-add">
                        <img src="images/add_button.PNG" class="square-150x150 position-absolute" id="preload-img-add">
                        <input type="file" name="imageList" class="square-150x150 position-absolute opacity-0" id="preload-inp-add" onchange="addMoreImage(this)" required>
                        <span class="position-absolute text-danger invisible cursor-pointer font-weight-bold" style="top:0;right:5%" onclick="deleteImage(this)">X</span>
                    </span>
                </div>
                <button class="btn btn-primary form-control my-3">Tạo Phòng Mới</button>

            </form>
        </div>

    </div>
    <hr>
    <footer class="container-fluid" id="lien-he-gop-y">
        <div class="row">
            <div class="col-sm-12 col-md-8">
                <h6>Trường Đại Học Công Nghiệp Hà Nội</h6>
                <h4>Nhóm thực hiện: Nhóm 05 ĐH KTPM3 K11</h4>
                <h4>Đề tài: HỆ THỐNG QUẢN LÝ ĐẶT KHÁCH SẠN</h4>
                <h4>Với sự hướng dẫn của thầy: <span class="text-info font-weight-bold">ThS. Hoàng Quang Huy</span>
                </h4>
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