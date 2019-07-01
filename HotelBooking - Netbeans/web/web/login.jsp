<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Đăng Nhập</title>
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

        <!-- Start Background Image + Search Form-->
        <div class="masthead mb-0 opacity-animated d-flex align-items-center">
            <div class="container shadow-lg">
                <div class="row p-3">
                    <div class="col-sm-12 col-md-5 separatorContainer">
                        <div class="row">
                            <div class="col-12 text-center">
                                <h1 class="font-weight-light text-light">Đăng Nhập</h1>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-center">
                            <div class="separator text-center"></div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-12">
                                <!--GET to test form, use POST when coding-->
                                <form method="POST" action="login">
                                    <c:if test="${requestScope.wrongAccount == 1}">
                                        <div class="alert alert-danger" role="alert">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <strong class="text-center" id="messageInfomation">Tài khoản hoặc mật khẩu không chính xác.</strong>
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label for="tenDangNhap" class="lead font-weight-bold">Tên đăng nhập</label>
                                        <input type="text" class="form-control form-control-lg" id="tenDangNhap"
                                               name="tenDangNhap" placeholder="Tên Đăng Nhập">
                                    </div>
                                    <div class="form-group">
                                        <label for="matKhau" class="lead font-weight-bold">Mật khẩu</label>
                                        <input type="password" class="form-control form-control-lg" id="matKhau"
                                               name="matKhau" placeholder="Mật khẩu">
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" name="remember" id="remember"
                                               value="yes">
                                        <label class="custom-control-label font-weight-bold text-light" for="remember"> Ghi
                                            nhớ đăng nhập</label>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit"
                                                class="btn btn-primary form-control form-control-lg font-weight-bold mt-5">
                                            Đăng Nhập
                                        </button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-12 col-md-7 separatorContainer youKnow">
                        <div class="row">
                            <div class="col-12 text-center">
                                <h1 class="font-weight-light text-light font-italic">Có thể bạn chưa biết?</h1>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-center">
                            <div class="separator text-center"></div>
                        </div>
                        <div class="row container">
                            <div class="col-12 lead text-justify">
                                Bằng cách đăng nhập, bạn sẽ được sử dụng nhiều dịch vụ hơn so với người bình thường.
                                Sau khi đăng nhập, bạn có thể đặt khách sạn siêu nhanh với khả năng điền thông tin
                                tự động, chức năng quản lý đơn, quản lý khách sạn,...

                            </div>

                            <div class="col-12 font-italic font-weight-bold">
                                <br />
                                Nếu bạn chưa có tài khoản, hãy tạo cho mình một tài khoản
                            </div>
                            <div class="col-12">
                                <a href="register.html" class="btn btn-primary">Đăng ký tài khoản</a>
                            </div>

                        </div>

                    </div>

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
                    <button type="button" class="form-control btn-primary my-3">Gửi</button>
                </form>
            </div>
        </div>
    </footer>
</body>
<script src="JS\action.js"></script>

</html>