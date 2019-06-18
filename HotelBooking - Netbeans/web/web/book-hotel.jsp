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
                                        <a class="dropdown-item" href="#">Quản Trị</a>
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
            <h2>${requestScope.hotelInfo.getHotelName()}<span> - ${requestScope.hotelInfo.getRate()}/5</span><span class="text-warning">&bigstar;</span></h2>
            <div class="text-secondary">Khách sạn ${requestScope.hotelInfo.getStar()} sao</div>
            <div class="font-weight-bold">${requestScope.hotelInfo.getAddress()}</div>
            <hr />
        </div>
        <div class="container shadow py-2">
            <div id="hotelSlideShow" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item hotel-img active">
                        <img class="d-block mx-auto img-fluid" src="${requestScope.listHotelImages.get(0).getLinkImage()}" alt="Hotel Image">
                    </div>
                    <c:forEach begin="1" var="oneImage" items="${requestScope.listHotelImages}">
                        <div class="carousel-item hotel-img">
                            <img class="d-block mx-auto img-fluid" src="${pageScope.oneImage.getLinkImage()}" alt="Hotel Image">
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
                <c:set var="count" value="0"></c:set>
                <c:forEach var="oneImage" items="${requestScope.listHotelImages}">
                    <span data-target="#hotelSlideShow" data-slide-to="${pageScope.count}" class="storeImg d-inline-block">
                        <img class="d-block img-fluid" src="${pageScope.oneImage.getLinkImage()}">
                    </span>
                    <c:set var="count" value="${count + 1}"></c:set>
                </c:forEach>
            </div>
            <div class="container">
                <hr />
                <h5 class="font-weight-bold">Tiện ích: </h5>
                <div class="row">
                    <c:forEach var="utility" items="${requestScope.hotelUtilities}">
                        <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; ${pageScope.utility}</span>
                    </c:forEach>
                </div>
            </div>
        </div>
        <hr />
        <div class="container">
            <div class="card my-3">
                <div class="card-header bg-primary text-light font-weight-bold text-center">Thông tin đặt phòng</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-6 font-weight-bold text-center">
                            Checkin: ${requestScope.bdayCheckin}
                        </div>
                        <div class="col-sm-12 col-md-6 font-weight-bold text-center">
                            Checkout: ${requestScope.bdayCheckout}
                        </div>
                            <div class="d-none" id="periodDay">${requestScope.periodDay}</div>
                    </div>
                    <hr />
                    <c:set var="totalCost" value="0"></c:set>
                    <c:set var="count" value="0"></c:set>
                    <c:forEach var="room" items="${requestScope.listRoom}">
                        <div class="row" id="roomOrderID-${pageScope.room.getIdRoom()}">
                            <div class="col-sm-12 col-md-7">
                                ${pageScope.room.getRoomName()} - ${requestScope.listRoomTypeName.get(count)}
                            </div>
                            <div class="col-sm-12 col-md-2">
                                Số lượng: <span id="roomOrderNumber-${pageScope.room.getIdRoom()}">${requestScope.numberOrder[count]}</span>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                Giá: <span id="roomOrderCost-${pageScope.room.getIdRoom()}">${pageScope.room.getCost() * requestScope.numberOrder[count] * requestScope.periodDay}</span> VND
                            </div>
                        </div>
                        <hr />
                        <c:set var="totalCost" value="${pageScope.totalCost + requestScope.numberOrder[count] * pageScope.room.getCost() * requestScope.periodDay }"></c:set>
                        <c:set var="count" value="${pageScope.count + 1}"></c:set>
                    </c:forEach>

                    <div class="row justify-content-end">
                        <div class="col-sm-12 col-md-3 text-danger font-weight-bold">
                            Tổng: <span id="totalCost">${pageScope.totalCost}</span> VND
                        </div>
                    </div>
                </div>

            </div>
            <div class="container border border-primary py-3">
                <div class="font-weight-bold lead pb-3 text-shadow-blur">Vui lòng điền các thông tin sau để hoàn tất: </div>
                <form class="form" id="orderFormData" action="book-hotel" method="POST">
                    <c:choose>
                        <c:when test="${sessionScope.loginStatus == 'logined'}">
                            <div class="row form-group">
                                <label for="fullname" class="col-sm-12 col-md-2">Họ tên</label>
                                <input type="text" name="fullname" id="fullname" class="form-control col-sm-12 col-md-4" value="${requestScope.userInfo.getName()}" maxlength="35" readonly="" required>
                            </div>
                            <div class="row form-group">
                                <label for="sodienthoai" class="col-sm-12 col-md-2">Số điện thoại</label>
                                <input type="tel" name="phone" id="sodienthoai" class="form-control col-sm-12 col-md-4" value="${requestScope.userInfo.getPhone()}" maxlength="10" readonly="" required>
                            </div>
                            <div class="row">
                                <label for="email" class="col-sm-12 col-md-2">Email</label>
                                <input type="email" name="email" id="email" class="form-control col-sm-12 col-md-4" value="${requestScope.userInfo.getEmail()}" maxlength="30" readonly=""  required>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row form-group">
                                <label for="fullname" class="col-sm-12 col-md-2">Họ tên</label>
                                <input type="text" name="fullname" id="fullname" class="form-control col-sm-12 col-md-4" maxlength="35" required>
                            </div>
                            <div class="row form-group">
                                <label for="sodienthoai" class="col-sm-12 col-md-2">Số điện thoại</label>
                                <input type="tel" name="phone" id="sodienthoai" class="form-control col-sm-12 col-md-4" maxlength="10" required>
                            </div>
                            <div class="row">
                                <label for="email" class="col-sm-12 col-md-2">Email</label>
                                <input type="email" name="email" id="email" class="form-control col-sm-12 col-md-4" maxlength="30" required>
                            </div>
                        </c:otherwise>

                    </c:choose>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" name="isMainGuest" id="khachChinh" value="checked" checked>
                        <label class="custom-control-label" for="khachChinh">Tôi là khách chính</label>
                    </div>
                    <div class="font-weight-bold lead pb-3 text-shadow-blur">Danh sách các phòng:</div>
                    <c:set var="count" value="0"></c:set>
                    <c:forEach var="oneRoom" items="${requestScope.listRoom}">
                        <div class="card my-3" id="roomCardID-${pageScope.oneRoom.getIdRoom()}">
                            <div class="card-header bg-primary text-light font-weight-bold" id="roomNameAndType-${pageScope.oneRoom.getIdRoom()}">${pageScope.oneRoom.getRoomName()}
                                <span> - ${requestScope.listRoomTypeName.get(pageScope.count)}</span><span> X <span id="roomCardNumber-${pageScope.oneRoom.getIdRoom()}">${requestScope.numberOrder[count]}</span> Phòng</span>
                            </div>
                                <input type="hidden" name="idRoom" id="idRoomInput-${pageScope.oneRoom.getIdRoom()}" value="${pageScope.oneRoom.getIdRoom()}">
                                <input type="hidden" name="orderNumber" id="orderNumberInput-${pageScope.oneRoom.getIdRoom()}" value="${requestScope.numberOrder[count]}">
                            <div class="card-body row p-0">
                                <div class="col-sm-12 col-md-4">
                                    <img src="${requestScope.listFullRoomImages.get(pageScope.count).get(0).getLinkImage()}" class="img-responsive w-100 h-100 cursor-pointer" data-toggle="modal"
                                         data-target="#modalRoomImage_${pageScope.count}">
                                    <!-- Modal Images -->
                                    <div class="modal fade" id="modalRoomImage_${pageScope.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">${pageScope.oneRoom.getRoomName()} - ${requestScope.listRoomTypeName.get(pageScope.count)}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body bg-dark">
                                                    <div id="room-show_${pageScope.count}" class="carousel slide" data-ride="carousel">
                                                        <div class="carousel-inner">
                                                            <div class="carousel-item active room-img">
                                                                <img class="d-block mx-auto img-fluid" src="${requestScope.listFullRoomImages.get(pageScope.count).get(0).getLinkImage()}">
                                                            </div>
                                                            <c:forEach var="oneImage" begin="1" items="${requestScope.listFullRoomImages.get(pageScope.count)}">
                                                                <div class="carousel-item room-img">
                                                                    <img class="d-block mx-auto img-fluid" src="${pageScope.oneImage.getLinkImage()}">
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                        <a class="carousel-control-prev" href="#room-show_${pageScope.count}" role="button" data-slide="prev">
                                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                        <a class="carousel-control-next" href="#room-show_${pageScope.count}" role="button" data-slide="next">
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
                                    <!-- END Modal Images -->
                                </div>
                                <div class="col-sm-12 col-md-8">
                                    <div class="row">
                                        <div class="text-secondary col-12">${pageScope.oneRoom.getAgcreage()} m2</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6 col-lg-3">${pageScope.oneRoom.getPeople()} Người</div>
                                        <div class="col-sm-12 col-md-6 col-lg-3">${requestScope.listRoomBed.get(pageScope.count)}</div>
                                        <div class="col-sm-12 col-md-12 col-lg-6">
                                            <input type="hidden" class="form-control" name="guestName" placeholder="Nhập tên khách" maxlength="45">
                                        </div>
                                    </div>
                                        <div class="d-none" id="costPerRoom-${pageScope.oneRoom.getIdRoom()}">${pageScope.oneRoom.getCost()}</div>
                                        <div class="text-danger font-weight-bold">Giá: <span id="cost-${pageScope.oneRoom.getIdRoom()}">${pageScope.oneRoom.getCost() * requestScope.numberOrder[count] * requestScope.periodDay }</span> VNĐ</div>
                                    <hr />
                                    <div class="container-fluid">
                                        <div class="row">
                                            <c:forEach var="utility" items="${requestScope.listFullRoomUltilities.get(pageScope.count)}">
                                                <span class="btn-outline-primary btn col-sm-6 col-md-3">&check; ${pageScope.utility}</span>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <span class="d-none idRoom">${pageScope.oneRoom.getIdRoom()}</span>
                                <button type="button" class="btn btn-outline-danger float-right" onclick="removeRoom(this)">Xóa phòng</button>
                            </div>
                        </div>
                        <c:set var="count" value="${count + 1}"></c:set>
                    </c:forEach> 
                    <div class="lead">Bạn có muốn ghi chú gì không?</div>
                    <textarea class="form-control" name="note" style="height: 170px" placeholder="Hãy viết ghi chú của bạn vào đây, ghi chú sẽ được gửi cho khách sạn..." maxlength="45"></textarea>
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