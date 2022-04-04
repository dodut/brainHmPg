<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">관리자페이지</div>
                <div class="list-group list-group-flush">
<<<<<<< HEAD
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">연혁&실적관리</a>
=======
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin1_2">연혁&실적관리</a>
>>>>>>> branch 'master' of https://github.com/dodut/brainHmpg.git
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">조직도 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin3_3">담당자 안내 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">공지사항 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">문의게시판 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">로그인 사용자 관리</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="/sub_main">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                    <h1 class="mt-4">관리자페이지에 온것을 환영합니다.</h1>
                    <p>로그인 ID : ${member.userid}</p>
                    <p>로그인 사용자 : ${member.username}</p>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

