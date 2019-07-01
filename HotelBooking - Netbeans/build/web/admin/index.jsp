<%@page import="controller.admin.Home"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
    </head>

    <body>
        <!-- this Nav for BIG Screen Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow big-scr">
            <a class="navbar-brand" href="#"><img>LOGO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse font-weight-bold justify-content-end" id="navbarColor01">
                <ul class='navbar-nav'>
                    <li class="nav-item">
                        <label class="mx-1 text-light">Xin Chào, Administrator</label>
                        <hr class="bg-light" />
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-1" href='manage-account'>Quản Lý Tài Khoản</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-1" href='analys-order'>Thống Kê Đơn</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-1" href='logout'>Đăng Xuất</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <!-- This Div collumn for Small Screen Navigation-->
                <div class="col-12 col-lg-3 col-xl-2 sm-scr bg-dark text-light fullViewHeight"
                     style="position:sticky;top:0;">
                    <div class="lead mt-5">Xin chào, Administrator !</div>
                    <div class="font-italic d-flex justify-content-end my-3"><a href="logout" class="text-light">Đăng xuất</a>
                    </div>
                    <hr class="bg-light" />
                    <ul class="nav flex-column mt-5">
                        <li class="nav-item">
                            <a class="nav-link text-light active" href="manage-account">Quản Lý Tài Khoản</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="analys-order">Thống Kê Đơn</a>
                        </li>
                    </ul>
                </div>
                <div class="col-12 col-lg-9 col-xl-10 my-5">
                    <h1 class="row-lg-3">Thống kê</h1>
                    <div class="panel panel-container">
                        <div class="row">
                            <div class="col-xs-6 col-md-3 col-lg-3">
                                <div class="panel panel-teal panel-widget border-right">
                                    <div class="row no-padding"><em class="fa fa-xl fa-shopping-cart color-blue"></em>
                                        <div class="large">120</div>
                                        <div class="text-muted">New Orders</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-md-3 col-lg-3">
                                <div class="panel panel-blue panel-widget border-right">
                                    <div class="row no-padding"><em class="fa fa-xl fa-comments color-orange"></em>
                                        <div class="large">52</div>
                                        <div class="text-muted">Comments</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-md-3 col-lg-3">
                                <div class="panel panel-orange panel-widget border-right">
                                    <div class="row no-padding"><em class="fa fa-xl fa-users color-teal"></em>
                                        <div class="large">24</div>
                                        <div class="text-muted">New Users</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-md-3 col-lg-3">
                                <div class="panel panel-red panel-widget ">
                                    <div class="row no-padding"><em class="fa fa-xl fa-search color-red"></em>
                                        <div class="large">25.2k</div>
                                        <div class="text-muted">Page Views</div>
                                    </div>
                                </div>
                            </div>
                        </div><!--/.row-->
                    </div>
                    <div id="chart"></div>
                    <% Home counter = (Home) session.getAttribute("counter");%>
                    <h3 class="row-lg-3">Số người đang online: <%= counter.getActiveSessionNumber()%> </h3>
                </div>

            </div>

        </div>

    </body>
    <script src="../JS\action.js"></script>
    <script type="text/javascript">
        //load the Google Visualization API and the chart
        google.load('visualization', '1', {'packages': ['columnchart']});

        //set callback
        google.setOnLoadCallback(createChart);

        //callback function
        function createChart() {

            //create data table object
            var dataTable = new google.visualization.DataTable();
            //define columns
            dataTable.addColumn('string', 'Tháng');
            dataTable.addColumn('number', 'Số lượng');
        <c:forEach var="item" items="${requestScope.list}">
            //define rows of data
            dataTable.addRows([['${item.getNote()}', ${item.getIdBooking()}]]);
        </c:forEach>
            //instantiate our chart object
            var chart = new google.visualization.ColumnChart(document.getElementById('chart'));

            //define options for visualization
            var options = {width: 700, height: 300, is3D: true, title: 'Thống kê số lượng đặt'};

            //draw our chart
            chart.draw(dataTable, options);

        }
    </script>

</html>