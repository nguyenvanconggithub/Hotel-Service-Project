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
                            ${sessionScope.username}
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
        <div class="container">
            <h2>${hotel.getHotelName()}</h2>
            <div class="text-secondary">Khách sạn ${hotel.getStar()} sao</div>
            <div class="font-weight-bold">${hotel.getAddress()}</div>
            <hr />
            <div class="container shadow py-2">
                <div id="hotelSlideShow" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item hotel-img active">
                            <img class="d-block mx-auto img-fluid"  src="${requestScope.listImg.get(0).getLinkImage()}" alt="Hotel Image">
                            </div>
                            
                            <c:forEach var="img" items="${requestScope.listImg}" begin="1">
                            <div class="carousel-item hotel-img">
                                <img class="d-block mx-auto img-fluid"  src="${img.getLinkImage()}" alt="Hotel Image">
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
                    <c:forEach var="img1" items="${requestScope.listImg}">
                        <c:set var="count" value="0"></c:set>
                        <span data-target="#hotelSlideShow" data-slide-to="count" class="storeImg d-inline-block">
                            <img class="d-block img-fluid" src="${img1.getLinkImage()}">
                        </span>
                         <c:set var="count" value="${count+1}"></c:set>
                    </c:forEach>    
                </div>
            </div>
            <div class="container">
                <div class="font-weight-bold lead my-5 text-shadow-blur">Danh sách các phòng</div>
                
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
                
                <div class="row">
                    <c:forEach var="room" items="${requestScope.listRoom}">
                        <div class="col-md-12 col-lg-4">

                            <div class="card my-2">
                                <div class="card-header bg-primary text-light font-weight-bold">${room.getRoom().getRoomName()}<span>
                                        - ${room.getRoom().getRoomType().getRoomTypeName()}
                                </div>
                                <div class="card-body p-0">
                                    <img src="${room.getLinkImage()}" class="img-responsive w-100" style='height:250px'>
                                </div>
                                <div class="card-footer h-150px">
                                    <div class="my-1">Tối đa <span class="font-weight-bold">${room.getRoom().getPeople()}</span> người</div>
                                    <div class="my-1">Còn lại <span class="font-weight-bold">${room.getRoom().getRoomLeft()}/${room.getRoom().getQuantity()}</span> phòng</div>
                                    <a href='edit-room?idRoom=${room.getRoom().getIdRoom()}&idHotel=${hotel.getIdHotel()}' class="btn btn-primary px-4">Sửa phòng</a>
                                    <a class="btn btn-outline-danger px-4" onclick="if(confirm('Bạn có chắc chắn muốn xóa phòng không')){href='delete-room?idDel=${room.getRoom().getIdRoom()}&idHotel=${hotel.getIdHotel()}'} ">Xóa phòng</a>
                                </div>
                            </div>

                        </div>
                    </c:forEach>
                    <!--Always add this Div to show Add New Room -->
                    <div class="col-md-12 col-lg-4">
                        <div class="card my-2  add_hotel_card">
                            <div class="card-header bg-dark text-light font-weight-bold text-center">Thêm phòng mới
                            </div>
                            <div class="card-body p-0 bg-dark d-flex align-items-center justify-content-center opacity-50-100"
                                 style="height: 400px">
                                <span style='font-size:100px;'>&#10010;</span>
                                <a href="add-new-room?id=${hotel.getIdHotel()}" class="stretched-link"></a>
                            </div>
                        </div>
                    </div>
                    <!--END Ad New Room Div-->
                </div>
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