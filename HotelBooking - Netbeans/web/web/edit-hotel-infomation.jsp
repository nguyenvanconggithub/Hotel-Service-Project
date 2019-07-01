<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Sửa thông tin Khách Sạn</title>
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
            <div class="font-weight-bold lead my-5 text-shadow-blur">Nhập thông tin để cập nhật khách sạn: </div>
            <c:if test="${requestScope.addSuccess == true}">
                <div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong class="text-center" id="messageInfomation">${requestScope.message}</strong>
                </div>
            </c:if>
            <c:if test="${requestScope.addSuccess == false}">
                <div class="alert alert-danger" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong class="text-center" id="messageInfomation">${requestScope.message}</strong>
                </div>
            </c:if>
            <form method="POST" class="form" action="edit-hotel" enctype="multipart/form-data">
                <input type="hidden" name="idHotel" value="${requestScope.idHotel}">
                <input type="hidden" name="listRemoveImage" id="listRemoveImage" value="">
                <div class="row form-group">
                    <label for="tenKhachSan" class="col-sm-12 col-md-2">Tên khách sạn</label>
                    <input type="text" name="tenKhachSan" maxlength="50" id="tenKhachSan" class="form-control col-sm-12 col-md-6" value="${requestScope.hotelInfo.getHotelName()}" required>
                </div>
                <div class="row form-group">
                    <label for="SDT" class="col-sm-12 col-md-2">SĐT liên hệ</label>
                    <input type="tel" name="SDT" id="SDT" maxlength="11" class="form-control col-sm-12 col-md-4" value="${requestScope.hotelInfo.getSDT()}" required>
                </div>
                <div class="row form-group">
                    <label for="tenKhachSan" class="col-sm-12 col-md-2">Địa chỉ</label>
                    <input type="text" name="diaChi" id="diaChi" maxlength="150" class="form-control col-sm-12 col-md-8" value="${requestScope.hotelInfo.getAddress()}" required>
                </div>
                <div class="row form-group">
                    <label for="tenKhachSan" class="col-sm-12 col-md-2">Số sao</label>

                    <div class="col-sm-12 col-md-8">
                        <span class="text-warning lead cursor-pointer" id="oneStar">&bigstar;</span>
                        <span class="text-warning lead cursor-pointer" id="twoStar">&bigstar;</span>
                        <span class="text-warning lead cursor-pointer" id="threeStar">&bigstar;</span>
                        <span class="text-warning lead cursor-pointer" id="fourStar">&bigstar;</span>
                        <span class="text-warning lead cursor-pointer" id="fiveStar">&bigstar;</span>
                    </div>
                    <input type="hidden" name="star" id="star" class="form-control col-sm-12 col-md-8" value="${requestScope.hotelInfo.getStar()}" max="5"
                           min="1">
                </div>
                <div class="row form-group">
                    <label class="col-sm-12 col-md-2">Các tiện ích</label>
                    <div class="col-sm-12 col-md-10">
                        <div class="row">
                            <c:set var="count" value="1"></c:set>
                            <c:forEach var="utility" items="${requestScope.listFullUtilities}">
                                <div class="col-6 col-sm-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch${count}" value="${utility.getIdUtility()}" 
                                           <c:forEach var="oldUlti" items="${requestScope.listIdUtilitiesNow}"><c:if test="${oldUlti == utility.getIdUtility()}">checked</c:if></c:forEach>>
                                    <label class="custom-control-label" for="tienIch${count}"> ${utility.getUtilityName()}</label>
                                </div>
                                <c:set var="count" value="${count+1}"></c:set>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="lead text-shadow-blur font-weight-bold">Bạn có thể thêm mới, chỉnh sửa hoặc xóa các bức ảnh bên dưới</div>
                <div class="row justify-content-center form-group">
                    <c:forEach var="oneImage" items="${requestScope.listFullImageHotel}">
                        <span
                            class="bg-dark d-flex align-items-center justify-content-center position-relative square-150x150 m-2 previewer"
                            id="image-element-loaded">
                            <img src="${pageScope.oneImage.getLinkImage()}" class="square-150x150 position-absolute" id="preload-img-add">
                            <input type="file" name="imageList" class="square-150x150 position-absolute opacity-0"
                                   id="${pageScope.oneImage.getIdHotelImage()}" onchange="addMoreImage(this)">
                            <span class="position-absolute text-danger cursor-pointer font-weight-bold"
                                  style="top:0;right:5%" onclick="deleteImage(this)">X</span>
                        </span>

                    </c:forEach>
                    <span
                        class="bg-dark d-flex align-items-center justify-content-center opacity-50-100 position-relative square-150x150 m-2"
                        id="image-element-add">
                        <img src="images/add_button.PNG" class="square-150x150 position-absolute" id="preload-img-add">
                        <input type="file" name="imageList" class="square-150x150 position-absolute opacity-0"
                               id="" onchange="addMoreImage(this)">
                        <span class="position-absolute text-danger invisible cursor-pointer font-weight-bold"
                              style="top:0;right:5%" onclick="deleteImage(this)">X</span>
                    </span>
                </div>
                <button type="submit" class="btn btn-primary form-control my-3">Sửa Đổi Thông Tin Khách Sạn</button>

            </form>
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