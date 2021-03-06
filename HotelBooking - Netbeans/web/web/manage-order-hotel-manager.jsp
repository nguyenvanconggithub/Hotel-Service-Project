ư<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản lý đơn đặt - Chủ Khách Sạn</title>
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
            <h1 class="display-4">Xin Chào, ${sessionScope.username}</h1>
            <p class="lead">Nếu bạn có ý kiến, thắc mắc, góp ý đừng ngại chia sẻ với chúng tôi. Bằng cách gửi phản hồi, bạn
                đã giúp website nâng cao dịch vụ và bạn sẽ sớm được sử dụng những dịch vụ tốt nhất !</p>
            <hr class="my-4">
            <p>Bạn không biết cách gửi? Hãy click nút bên dưới và điền vào mục góp ý. Chân thành cảm ơn !</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="#lien-he-gop-y">Tôi muốn góp ý</a>
            </p>
        </div>
        <div class="container">
            <div class="font-weight-bold lead my-5 text-shadow-blur">Danh sách các đơn đặt: </div>

            <table class="table laptop table-striped table-hover">
                <tr class="row text-center table-primary shadow">
                    <th class="col-1">ID</th>
                    <th class="col-2">Tên liên hệ</th>
                    <th class="col-3">Khách sạn</th>
                    <th class="col-1">Thời gian đặt</th>
                    <th class="col-1">Checkin</th>
                    <th class="col-1">Checkout</th>
                    <th class="col-1">Trạng thái</th>
                    <th class="col-2">Tổng tiền</th>
                </tr>
                <!--1 Đơn (màn hình rộng full size table)-->
                <c:forEach var="item" items="${requestScope.listBooking}">
                    <c:if test="${item.getBooking().getStatusBooking() == 0}">
                        <tr class="row text-center bg-secondary">
                        </c:if>
                        <c:if test="${item.getBooking().getStatusBooking() != 0}">
                        <tr class="row text-center">
                        </c:if>
                        <td class="col-1"><input type="hidden" value="$${item.getBooking().getIdBooking()}" name="idBooking">
                            <a href="order-detail?idBooking=${item.getBooking().getIdBooking()}">#${item.getBooking().getIdBooking()}</a></td>
                        <td class="col-2">${item.getOwnRoomName()}</td>
                        <td class="col-3">${item.getBooking().getHotel().getHotelName()}</td>
                        <td class="col-1">${item.getBooking().getOrderTime()}</td>
                        <td class="col-1">${item.getBooking().getCheckIn()}</td>
                        <td class="col-1">${item.getBooking().getCheckOut()}</td>
                        <c:choose>
                            <c:when test="${item.getBooking().getStatusBooking() == 0}">
                                <td class="col-1">Đã hủy</td>
                            </c:when>
                            <c:when test="${item.getBooking().getStatusBooking() == 1}">
                                <td class="col-1">Đã xác nhận</td>
                            </c:when>
                            <c:when test="${item.getBooking().getStatusBooking() == 2}">
                                <td class="col-1">Hoàn thành</td>
                            </c:when>
                        </c:choose>        
                        <c:forEach var="cost" items="${requestScope.listCost}">
                            <c:if test="${cost.getIdRoom()==item.getBooking().getIdBooking()}">
                                <td class="col-2">${cost.getCost()} VND</td>
                            </c:if>
                        </c:forEach>

                    </tr>
                </c:forEach>
            </table>

            <!-- Revert Table to fit Small Sreen-->
            <table class="table tablet mobile table-striped">
                <!--1 Đơn (màn hình nhỏ, chuyển 2 cột tiêu đề sang trái, nội dung bên phải)-->
                <c:forEach var="item" items="${requestScope.listBooking}">
                    <tr class="row">
                        <th class="col-6">ID Đơn</th>
                        <td class="col-6"><a href="order-detail?idBooking=${item.getBooking().getIdBooking()}">#${item.getBooking().getIdBooking()}</a></td>
                    </tr>

                    <tr class="row">
                        <th class="col-6">Tên liên hệ</th>
                        <td class="col-6">${item.getOwnRoomName()}</td>
                    </tr>
                    <tr class="row">
                        <th class="col-6">Khách sạn</th>
                        <td class="col-6">${item.getBooking().getHotel().getHotelName()}</td>
                    </tr>
                    <tr class="row">
                        <th class="col-6">Thời gian đặt</th>
                        <td class="col-6">${item.getBooking().getOrderTime()}</td>
                    </tr>
                    <tr class="row">
                        <th class="col-6">Checkin</th>
                        <td class="col-6">${item.getBooking().getCheckIn()}</td>
                    </tr>
                    <tr class="row">
                        <th class="col-6">Checkout</th>
                        <td class="col-6">${item.getBooking().getCheckOut()}</td>
                    </tr>
                    <tr class="row">
                        <th class="col-6">Trạng thái</th>
                            <c:choose>
                                <c:when test="${item.getBooking().getStatusBooking() == 0}">
                                <td class="col-1">Đã hủy</td>
                            </c:when>
                            <c:when test="${item.getBooking().getStatusBooking() == 1}">
                                <td class="col-1">Đã xác nhận</td>
                            </c:when>
                            <c:when test="${item.getBooking().getStatusBooking() == 2}">
                                <td class="col-1">Hoàn thành</td>
                            </c:when>
                        </c:choose>        
                    </tr>
                    <tr class="row">
                        <th class="col-6">Tổng tiền</th>
                            <c:forEach var="cost" items="${requestScope.listCost}">
                                <c:if test="${cost.getIdRoom()==item.getBooking().getIdBooking()}">
                                <td class="col-6">${cost.getCost()} VND</td>
                            </c:if>
                        </c:forEach>
                    </tr>
                    <tr class="row">
                        <td class="col-12 p-0 m-0">
                            <hr class="bg-primary" />
                        </td>
                    </tr>
                    <!--END 1 Đơn-->
                </c:forEach>
            </table>
            <!--END Revert Table-->
            <ul class="pagination justify-content-center mt-5">
                <c:choose>
                    <c:when test="${requestScope.page == 1}">
                        <li class="page-item disabled "><a class="page-link">Trang trước</a></li>
                        </c:when>
                        <c:otherwise>
                        <li class="page-item"><a class="page-link" href="manage-order-hotel-manager?page=${requestScope.page - 1}">Trang trước</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="page" begin="${requestScope.min}" end="${requestScope.max}" step="1">
                        <c:choose>
                            <c:when test="${requestScope.page == pageScope.page}">
                            <li class="page-item active"><a class="page-link" href="manage-order-hotel-manager?page=${pageScope.page}">${pageScope.page}</a></li>
                            </c:when>
                            <c:otherwise>
                            <li class="page-item "><a class="page-link" href="manage-order-hotel-manager?page=${pageScope.page}">${pageScope.page}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${requestScope.page == requestScope.lastPage}">
                        <li class="page-item disabled "><a class="page-link">Trang sau</a></li>
                        </c:when>
                        <c:otherwise>
                        <li class="page-item"><a class="page-link" href="manage-order-hotel-manager?page=${requestScope.page + 1}">Trang sau</a></li>
                        </c:otherwise>
                    </c:choose>         
            </ul>
        </div>
        <hr />
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
                        <button type="button" id="hustestr" class="form-control btn-primary my-3">Gửi</button>
                    </form>
                </div>
            </div>
        </footer>
    </body>
    <script src="JS\action.js"></script>
</html>