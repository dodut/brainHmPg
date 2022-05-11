<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        <style type="text/css">
       	 	/* 버튼 */
			.st_mybd_btn {box-sizing:border-box;display:inline-block;position:relative;height:28px;margin:0;padding:3px 15px;border:1px solid #dfdfdf;background:#dfdfdf;font-family:'Malgun Gothic', sans-serif;font-size:13px;font-weight:bold;color:#5f5f5f;line-height:20px;text-decoration:none;cursor:pointer}
			.st_mybd_btn:hover:before {content:'';display:block;position:absolute;top:0;bottom:0;left:0;right:0;background:rgba(0, 0, 0, .05)}
			
			.st_mybd_btn.st_mybd_highlight {border:1px solid #4e4e4e;background:#4e4e4e;color:#ffffff;height:35px;margin-top: 20px;}
			.st_mybd_btn.st_mybd_highlight:hover:before {background:rgba(255, 255, 255, .15)}
			input[type=file] {margin-top: 20px;}
			
			img {border:1px solid;margin:10px 0;width:800px;}
        </style>
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        function upload_form_chk(){
        	var form = document.upload_form;
        	
        	var str;

			if (!form.up_file.value) {
				alert("이미지를 첨부해주세요");
				return false;
			}
	
			if (!isImageFile(form.up_file.value)) {
				alert("이미지파일(.gif, .jpg, .png)만 업로드 가능합니다");
				return false;
			}
	
			if (!isValidFilename(form.up_file.value)) {
				alert("파일 이름에 다음 문자가 올 수 없습니다.\n\ \/ : * ? | <");
				return false;
			}
		
// 			document.getElementById('submit_bt').style.visibility = 'hidden';

        	return true;
        }
        
        function isImageFile(dirfilename){
        	if (dirfilename.match(/(.jpg|.jpeg|.gif|.png)$/i)) {
        		return true;
        	} else {
        		return false;
        	}
        }

        function isValidFilename(dirfilename){
        	var filename = dirfilename.substr(dirfilename.lastIndexOf("\\")+1);
        	if (!filename.match(/[\\\/:\*\?\|<>]/)) {
        		return true;
        	} else {
        		return false;
        	}
        }
        
        
        $(document).ready(function() {
        	$('input[type=file]').on('change',function(){
        		if(this.value){
        			var file_size = this.files[0].size;
        			var chk_size = 200 * 1000000;
        			if(file_size > chk_size){
        				alert('첨부 파일 용량이 제한 용량을 초과하여 파일을 첨부 할 수 없습니다.');
        				this.value = '';
        			}
        		}
        	});
        });
        	
        </script>
    </head>
    
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">관리자페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin1_2">연혁&실적관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin1_3">조직도 관리</a>
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
					<form name='upload_form' method="post" onSubmit='return upload_form_chk()' enctype="multipart/form-data" action="/admin1_3/fileUploadProc">	
	                	<input type="file" id="up_file" name="up_file" />
	                	
	                	<div class="btnDiv">
	                		<input type="submit" id="submitBtn" name="btn_submit" class="st_mybd_btn st_mybd_highlight" value="파일 업로드/삽입" />	
	                	</div>
                	</form>
                	
                	<div class="preview">
                		<img src="resources/adminupload/<c:url value='${fileName}'/>">
                	</div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

