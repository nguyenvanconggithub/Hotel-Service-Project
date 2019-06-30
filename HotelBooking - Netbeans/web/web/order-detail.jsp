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
        <div class="container">
            <c:set var="hotel" value="${requestScope.hotel}"></c:set>
            <h2>${hotel.getHotelName()}<span> - ${hotel.getRate()}/5</span><span class="text-warning">&bigstar;</span></h2>
            <div class="text-secondary">khách sạn ${hotel.getStar()} sao</div>
            <div class="font-italic">${hotel.getSDT()}</div>
            <div class="font-weight-bold">${hotel.getAddress()}</div>
            <hr />
        </div>
        <div class="container shadow py-2">
            <div id="hotelSlideShow" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item hotel-img active">
                        <img class="d-block mx-auto img-fluid" src="${requestScope.hotelimage.get(0).getLinkImage()}" alt="Hotel Image">
                    </div>
                    <c:forEach begin="1" var="hotelimage" items="${requestScope.hotelimage}">
                        <div class="carousel-item hotel-img">
                            <img class="d-block mx-auto img-fluid" src="${hotelimage.getLinkImage()}" alt="Hotel Image">
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
                <c:forEach  var="hotelImage2" items="${requestScope.hotelimage}">
                    <span data-target="#hotelSlideShow" data-slide-to="${slide}" class="storeImg d-inline-block">
                        <img class="d-block img-fluid" src="${hotelImage2.getLinkImage()}">
                    </span>
                    <c:set var="slide" value="${slide+1}"></c:set>
                </c:forEach>
            </div>
            <div class="container">
                <hr />
                <h5 class="font-weight-bold">Tiện ích: </h5>
                <div class="row">
                    <c:forEach var="ultiHotel" items="${requestScope.ultiHotel}">
                        <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; ${ultiHotel.getUtilityName()}</span>
                    </c:forEach>
                </div>
            </div>
        </div>
        <hr />
        <div class="jumbotron container shadow">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <c:set var="booking" value="${requestScope.booking}"></c:set>
                    <div>Mã Đơn: <span class="text-primary">#${booking.getIdBooking()}</span> vào lúc ${booking.getOrderTime()}</div>
                    <div>Số phòng thuê: ${requestScope.roomNumber} Phòng</div>
                    <div>Có thể chứa tối đa: ${requestScope.maxPeople} Người</div>
                    <div class="font-weight-bold lead">Checkin: ${booking.getCheckIn()}</div>
                    <div class="font-weight-bold lead">Checkout: ${booking.getCheckOut()}</div>
                    <div class="font-weight-bold lead text-success">Giá: ${requestScope.cost} VND</div>
                </div>
                <div class="col-sm-12 col-md-6">
                    <div class="font-weight-bold lead">Họ tên liên hệ: ${booking.getUser().getName()}</span></div>
                    <div class="font-weight-bold lead">Email: ${booking.getUser().getEmail()}</div>
                    <div class="font-weight-bold lead">SĐT: ${booking.getUser().getPhone()}</div>
                </div>
            </div>
        </div>
        <div class="container">
            <hr/>
            <div class="font-weight-bold lead pb-3 text-shadow-blur">Danh sách các phòng đã đặt trong đơn này: </div>
            <!-- Modal -->

            <c:set var="indexmodalRoomImage" value="1"></c:set>
            <c:forEach var="showRooms" items="${requestScope.showRooms}">
                <div class="modal fade" id="modalRoomImage_${indexmodalRoomImage}" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">${showRooms.getRoomImages().get(0).getRoom().getRoomName()} - ${showRooms.getRoomImages().get(0).getRoom().getRoomType().getRoomTypeName()}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body bg-dark">
                                <div id="room-show_${indexmodalRoomImage}" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active room-img">
                                            <img class="d-block mx-auto img-fluid" src="${showRooms.getRoomImages().get(0).getLinkImage()}">
                                        </div>
                                        <c:forEach var="image" items="${showRooms.getRoomImages()}" begin="1">
                                            <div class="carousel-item room-img">
                                                <img class="d-block mx-auto img-fluid" src="${image.getLinkImage()}">
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <a class="carousel-control-prev" href="#room-show_${indexmodalRoomImage}" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#room-show_${indexmodalRoomImage}" role="button" data-slide="next">
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
                <c:set var="indexmodalRoomImage" value="${indexmodalRoomImage +1}"></c:set>
            </c:forEach>

            <!--các phòng trong đơn-->
            <c:set var="imageindex" value="1"></c:set>
            <c:forEach var="showroom" items="${requestScope.showRooms}">
                
                <c:if test="${showroom.getDetailBookingRoom().getStatus() !=0 }">
                    <div class="card my-3">
                        <div class="card-header bg-primary text-light font-weight-bold">${showroom.getRoomImages().get(0).getRoom().getRoomName()}<span> - ${showroom.getRoomType().getRoomTypeName()} </span>
                            <c:if test="${showroom.getDetailBookingRoom().getBookingNumber()  > 1}"> X ${showroom.getDetailBookingRoom().getBookingNumber()}</c:if>
                            </div>
                            <div class="card-body row p-0">
                                <div class="col-sm-12 col-md-4">
                                    <img src="${showroom.getRoomImages().get(0).getLinkImage()}" class="img-responsive w-100 h-100 cursor-pointer"
                                     data-toggle="modal" data-target="#modalRoomImage_${imageindex}">
                            </div>
                            <div class="col-sm-12 col-md-8">
                                <div class="row">
                                    <div class="text-secondary col-12">${showroom.getRoomImages().get(0).getRoom().getAgcreage()} m2</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-6 col-lg-3">${showroom.getRoomImages().get(0).getRoom().getPeople()} Người</div>
                                    <div class="col-sm-12 col-md-6 col-lg-3">${showroom.getRoomImages().get(0).getRoom().getBed().getBedName()}</div>
                                    <div class="col-sm-12 col-md-12 col-lg-6">
                                        Tên khách: <span class="font-weight-bold">${showroom.getDetailBookingRoom().getOwnRoomName()}</span>
                                    </div>
                                </div>
                                <div class="text-success font-weight-bold">Giá: ${showroom.getGia()} VNĐ</div>
                                <hr />
                                <div class="container-fluid">
                                    <div class="row">
                                        <c:forEach var="ultility" items="${showroom.getRoomUltilities()}">
                                            <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; ${ultility.getUtilityName()}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <c:if test="${requestScope.account.getUserName() == sessionScope.username || showroom.getHotelMangerAccount().getUserName()==sessionScope.username}">
                                <a class="btn btn-outline-danger float-right" href='order-detail?idBooking=${requestScope.booking.getIdBooking()}&idroom=${showroom.getRoomImages().get(0).getRoom().getIdRoom()}&is=huy'  onclick="return confirm('xác nhận xóa phòng khỏi đơn')">Hủy đặt phòng này</a>
                            </c:if>
                        </div>
                    </div>
                </c:if>

                <c:if test="${showroom.getDetailBookingRoom().getStatus()==0}">
                    <!--CANCEL ROOM-->
                    <div class="card my-3 bg-secondary">
                        <div class="card-header bg-secondary text-dark font-weight-bold">${showroom.getRoomImages().get(0).getRoom().getRoomName()} <span> - ${showroom.getRoomType().getRoomTypeName()} - CANCELED</span>
                            <c:if test="${showroom.getDetailBookingRoom().getBookingNumber() > 1} "> X ${showroom.getDetailBookingRoom().getBookingNumber()}</c:if>
                            </div>
                            <div class="card-body row p-0">
                                <div class="col-sm-12 col-md-4">
                                    <img src="${showroom.getRoomImages().get(0).getLinkImage()}" class="img-responsive w-100 h-100 cursor-pointer grayscale"
                                     data-toggle="modal" data-target="#modalRoomImage_${imageindex}">
                            </div>
                            <div class="col-sm-12 col-md-8">
                                <div class="row">
                                    <div class="text-secondary col-12">${showroom.getRoomImages().get(0).getRoom().getAgcreage()} m2</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-6 col-lg-3">${showroom.getRoomImages().get(0).getRoom().getPeople()} Người</div>
                                    <div class="col-sm-12 col-md-6 col-lg-3">${showroom.getRoomImages().get(0).getRoom().getBed().getBedName()}</div>
                                    <div class="col-sm-12 col-md-12 col-lg-6">
                                        Tên khách: <span class="font-weight-bold">${showroom.getDetailBookingRoom().getOwnRoomName()}</span>
                                    </div>
                                </div>
                                <div class="text-secondary font-weight-bold">Giá: ${showroom.getGia()} VNĐ</div>
                                <hr />
                                <div class="container-fluid">
                                    <div class="row">
                                        <c:forEach var="ultility2" items="${showroom.getRoomUltilities()}">
                                            <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; ${ultility2.getUtilityName()}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="btn btn-outline-danger float-right ">CANCELED</div>
                        </div>
                        <!--END CANCELED ROOM-->
                    </div>
                </c:if>
                <c:set var="imageindex" value="${imageindex +1}"></c:set>
            </c:forEach>

            <div class="lead text-shadow-blur">Ghi chú: </div>
            <div class="border p-3 text-center min-h-300px">
                ${requestScope.booking.getNote()}
            </div>
            <c:if test="${requestScope.account.getUserName() == sessionScope.username || requestScope.showRooms.get(0).getHotelMangerAccount().getUserName()==sessionScope.username}">
                <a class="btn btn-outline-danger w-100 my-3"  href='order-detail?idBooking=${requestScope.booking.getIdBooking()}&idroom=0&is=all' onclick="return confirm('xác nhận hủy đơn')">Hủy Đơn</a>
            </c:if>
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