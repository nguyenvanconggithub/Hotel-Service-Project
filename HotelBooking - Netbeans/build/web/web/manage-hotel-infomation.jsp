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
                                    <a class="dropdown-item" href="manage-order-hotel-manager.html">Quản lý đơn đặt</a>
                                    <a class="dropdown-item" href="#">Quản lý khách sạn</a>
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

        <div class="jumbotron container my-3 shadow">
            <h1 class="display-4">Xin Chào, Chủ KS</h1>
            <p class="lead">Nếu bạn có ý kiến, thắc mắc, góp ý đừng ngại chia sẻ với chúng tôi. Bằng cách gửi phản hồi, bạn
                đã giúp website nâng cao dịch vụ và bạn sẽ sớm được sử dụng những dịch vụ tốt nhất !</p>
            <hr class="my-4">
            <p>Bạn không biết cách gửi? Hãy click nút bên dưới và điền vào mục góp ý. Chân thành cảm ơn !</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="#lien-he-gop-y">Tôi muốn góp ý</a>
            </p>
        </div>
        <div class="container">
            <div class="font-weight-bold lead my-5 text-shadow-blur">Danh sách các phòng của bạn</div>
            <div class="row">
                <c:forEach var="hotel" items="${requestScope.list}">
                <div class="col-md-12 col-lg-4">
                    <div class="card my-2">
                        <div class="card-header bg-primary text-light font-weight-bold">${hotel.getHotel().getHotelName()} <span> - ${hotel.getHotel().getRate()}/5
                            </span><span class="text-warning">&bigstar;</span></div>
                        <div class="card-body p-0">
                            <img src="${hotel.getLinkImage()}" class="img-responsive w-100" style='height:250px'>
                        </div>
                        <div class="card-footer h-150px">
                            <div class="text-secondary">Khách sạn ${hotel.getHotel().getStar()} sao</div>
                            <div class="my-1">${hotel.getHotel().getAddress()}</div>
                            <a href='edit-hotel?id=${hotel.getHotel().getIdHotel()}' class="btn btn-primary px-4">Sửa</a>
                            <a href='remove-hotel?id=${hotel.getHotel().getIdHotel()}' class="btn btn-outline-danger px-4">Xóa</a>
                            <a href="manage-hotel-room?id=${hotel.getHotel().getIdHotel()}" class="btn btn-outline-primary px-4">QL Phòng</a>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                <!--Always add this Div to show Add New Hotel-->
                <div class="col-md-12 col-lg-4">
                    <div class="card my-2  add_hotel_card">
                        <div class="card-header bg-dark text-light font-weight-bold text-center">Thêm khách sạn</div>
                        <div class="card-body p-0 bg-dark d-flex align-items-center justify-content-center opacity-50-100"
                             style="height: 400px">
                            <span style='font-size:100px;'>&#10010;</span>
                            <a href="add-new-hotel" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
                <!--END Ad New Hotel Div-->
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