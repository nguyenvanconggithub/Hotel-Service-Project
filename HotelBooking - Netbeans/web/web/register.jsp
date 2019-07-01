<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Đăng ký tài khoản</title>
        <meta charset="UTF-8">
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

        <!-- Start Background Image + Search Form-->
        <div class="masthead mb-0 opacity-animated d-flex align-items-center">
            <div class="container shadow-lg separatorContainer">

                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="font-weight-light text-light">Đăng Ký Tài Khoản<h1>
                                </div>
                                </div>
                                <div class="row d-flex justify-content-center">
                                    <div class="separator text-center"></div>
                                </div>
                                <div class="container">
                                    <c:if test="${message == 1}">
                                    <div class="alert alert-success" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <strong class="text-center" id="messageInfomation">Đăng Ký Thành Công</strong>
                                    </div>
                                    </c:if>
                                    <c:if test="${message == 0}">
                                    <div class="alert alert-danger" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <strong class="text-center" id="messageInfomation">Đăng ký thất bại. Tài khoản đã có người sử dụng.</strong>
                                    </div>
                                    </c:if>
                                    <form method="POST" action="register" id="registerForm">
                                        <div class="row form-group">
                                            <label for="tenTaiKhoan" class="col-sm-12 col-md-2 font-weight-bold">Tên đăng nhập</label>
                                            <input type="text" name="tenTaiKhoan" id="tenTaiKhoan" class="col-sm-12 col-md-4 form-control"
                                                   required>
                                            <label for="hoTen" class="col-sm-12 col-md-2 font-weight-bold">Họ tên</label>
                                            <input type="text" name="hoTen" id="hoTen" class="col-sm-12 col-md-4 form-control" required>
                                        </div>
                                        <div class="row form-group">
                                            <label for="matKhau" class="col-sm-12 col-md-2 font-weight-bold">Mật khẩu</label>
                                            <input type="password" name="matKhau" id="matKhau" class="col-sm-12 col-md-4 form-control"
                                                   required>
                                            <label for="nhapLaiMatKhau" class="col-sm-12 col-md-2 font-weight-bold">Nhập lại mật
                                                khẩu</label>
                                            <input type="password" name="nhapLaiMatKhau" id="nhapLaiMatKhau"
                                                   class="col-sm-12 col-md-4 form-control" required>
                                        </div>
                                        <div class="row form-group">
                                            <label for="email" class="col-sm-12 col-md-2 font-weight-bold">Email</label>
                                            <input type="email" name="email" id="email" class="col-sm-12 col-md-4 form-control" required>
                                            <label for="nhapLaiEmail" class="col-sm-12 col-md-2 font-weight-bold">Nhập lại Email</label>
                                            <input type="email" name="nhapLaiEmail" id="nhapLaiEmail"
                                                   class="col-sm-12 col-md-4 form-control" required>
                                        </div>
                                        <div class="row form-group">
                                            <label for="SDT" class="col-sm-12 col-md-2 font-weight-bold">Số điện thoại</label>
                                            <input type="tel" name="SDT" id="SDT" class="col-sm-12 col-md-4 form-control" required>
                                        </div>
                                        <div class="row text-light font-weight-bold font-italic">
                                            <div class="col-12">
                                                Đăng ký tài khoản sẽ giúp bạn có thể sử dụng nhiều dịch vụ khách của trang web, chọn <span
                                                    class="badge badge-primary"> Đăng Ký làm Chủ Khách Sạn </span> để mở tài khoản cho chủ
                                                khách sạn, nút <span class="badge badge-primary"> Đăng Ký làm Người Dùng </span>để mở tài
                                                khoản cho người dùng.
                                            </div>
                                        </div>
                                        <div class="row form-group d-flex justify-content-end">
                                            <div class="col-sm-12 col-md-5 col-lg-4 col-xl-3 my-2">
                                                <input type="submit" name="role" value="Đăng Ký làm Chủ Khách Sạn"
                                                       class="col-12 btn btn-primary">
                                            </div>
                                            <div class="col-sm-12 col-md-5 col-lg-4 col-xl-3 my-2">
                                                <input type="submit" name="role" value="Đăng Ký làm Người Dùng"
                                                       class="col-12 btn btn-primary">
                                            </div>

                                        </div>
                                    </form>
                                </div>
                                </div>
                                </div>
                                </div>
                                <!-- End Background Image + Search Form-->
                                <footer class="container-fluid" id='lien-he-gop-y'>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-8">
                                            <h6>Trường Đại Học Công Nghiệp Hà Nội</h6>
                                            <h4>Nhóm thực hiện: Nhóm 05 ĐH KTPM3 K11</h4>
                                            <h4>Đề tài: HỆ THỐNG QUẢN LÝ ĐẶT KHÁCH SẠN</h4>
                                            <h4>Với sự hướng dẫn của thầy: <span class="text-info font-weight-bold">ThS. Hoàng Quang Huy</span></h4>
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
                                                <button type="button" class="form-control btn-primary my-3">${test}</button>
                                            </form>
                                        </div>
                                    </div>
                                </footer>
                                </body>
                                <script src="JS\action.js"></script>

                                </html>