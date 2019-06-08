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
                    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        Chủ KS
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="manage-order-hotel-manager.html">Quản lý đơn đặt</a>
                        <a class="dropdown-item" href="manage-hotel-infomation.html">Quản lý thông tin khách sạn</a>
                        <a class="dropdown-item" href="#">Đăng xuất</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
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
        <div class="font-weight-bold lead my-5 text-shadow-blur">Nhập thông tin cho khách sạn mới: </div>
        <form method="GET" class="form">
            <div class="row form-group">
                <label for="tenKhachSan" class="col-sm-12 col-md-2">Tên khách sạn</label>
                <input type="text" name="tenKhachSan" id="tenKhachSan" class="form-control col-sm-12 col-md-6" required>
            </div>
            <div class="row form-group">
                <label for="SDT" class="col-sm-12 col-md-2">SĐT liên hệ</label>
                <input type="tel" name="SDT" id="SDT" class="form-control col-sm-12 col-md-4" required>
            </div>
            <div class="row form-group">
                <label for="tenKhachSan" class="col-sm-12 col-md-2">Địa chỉ</label>
                <input type="text" name="diaChi" id="diaChi" class="form-control col-sm-12 col-md-8" required>
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
                <input type="hidden" name="star" id="star" class="form-control col-sm-12 col-md-8" value="5" max="5"
                    min="1">
            </div>
            <div class="row form-group">
                <label class="col-sm-12 col-md-2">Các tiện ích</label>
                <div class="col-sm-12 col-md-10">
                    <div class="row">
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch1" value="mayLanh">
                            <label class="custom-control-label" for="tienIch1"> Máy lạnh</label>
                        </div>
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch2" value="leTan">
                            <label class="custom-control-label" for="tienIch2"> Lễ tân 24/24</label>
                        </div>
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch3" value="thangMay">
                            <label class="custom-control-label" for="tienIch3"> Thang máy</label>
                        </div>
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch4" value="nhaHang">
                            <label class="custom-control-label" for="tienIch4"> Nhà hàng</label>
                        </div>
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch5" value="wifi">
                            <label class="custom-control-label" for="tienIch5"> Wifi</label>
                        </div>
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch6" value="hoBoi">
                            <label class="custom-control-label" for="tienIch6"> Hồ bơi</label>
                        </div>
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch7" value="hoTroDoXe">
                            <label class="custom-control-label" for="tienIch7"> Hỗ trợ đỗ xe</label>
                        </div>
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch8" value="nhanThuNuoi">
                                <label class="custom-control-label" for="tienIch8"> Nhận thú nuôi</label>
                            </div>
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch9" value="phongTheHinh">
                            <label class="custom-control-label" for="tienIch9"> Phòng thể hình</label>
                        </div>
                        <div class="col-6 col-sm-3 custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="tienIch" id="tienIch10" value="phongSpa">
                            <label class="custom-control-label" for="tienIch10"> Phòng Spa</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="lead text-shadow-blur font-weight-bold">Thêm ảnh để khách hàng có cái nhìn tổng quan về khách sạn của bạn</div>
            <div class="row justify-content-center form-group">

                <span
                    class="bg-dark d-flex align-items-center justify-content-center opacity-50-100 position-relative square-150x150 m-2"
                    id="image-element-add">
                    <img src="images/add_button.PNG" class="square-150x150 position-absolute" id="preload-img-add">
                    <input type="file" name="imageList" class="square-150x150 position-absolute opacity-0"
                        id="preload-inp-add" onchange="addMoreImage(this)">
                    <span class="position-absolute text-danger invisible cursor-pointer font-weight-bold"
                        style="top:0;right:5%" onclick="deleteImage(this)">X</span>
                </span>
            </div>
            <div class="font-italic">Sau khi tạo khách sạn, bạn hãy vào mục <span class="badge badge-primary">QL Phòng</span> để tạo phòng cho khách sạn nhé !!</div>
            <button class="btn btn-primary form-control my-3">Tạo Khách Sạn</button>

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