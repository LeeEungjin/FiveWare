<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
	$(function() {
		
		/* $.ajax({
			url: './cloudList',
			type: 'post',
			success:function() {
				alert('test');
			}
		}); */
		
		$('#cloud_contents').bind("contextmenu", function(event) { 
		    event.preventDefault();
		    $(".rClick_modal")
		        .appendTo("#cloud_contents")
		        .css({display: "block", top: event.pageY + "px", left: event.pageX + "px"});
		}).bind("click", function(event) {
		    $("div.rClick_modal").hide();
		});
	});
	
</script>

<title>클라우드</title>
<style type="text/css">
.cloud_title {
	width: 100%;
	padding: 20px 10px;
	border-bottom: 1px solid black;
	font-size: 16px;
	font-weight: bold;
}

.cloud_title img {
	width: 50px;
	height: 50px;
	cursor: pointer;
	margin-left: 10px;
}

#searchInput {
	  background-image: url('${url}/resources/images/common/searchicon.gif');
	  background-position: 10px 12px;
	  background-repeat: no-repeat;
	  width: 90%;
	  font-size: 12px;
	  padding: 12px 20px 12px 40px;
	  border: 1px solid #ddd;
}

.cloud_filePlus {
	background-image: url('${url}/resources/images/common/plus.png');
	background-position: 10px 12px;
	background-repeat: no-repeat;
}

#cloud_contents {
	width: 100%;
	height: 100%;
	padding: 30px;
    background-color: antiquewhite;
}

.rClick_modal {
	height: 88px;
	display: none;
	z-index: 999;
	position: absolute;
	box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2);
}

.cloud_dir  {
    display: inline-block;
    width: 12%;
    height: 150px;
	border: 1px solid lightgray;
	box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2);
	margin: 0 10px 30px 0;
}

.cloud_dir_img {
	width: 100%;
	height: 75%;
	text-align: center;
	line-height: 151px;
	background-color: white;
}

.cloud_dir_text {
	width: 100%;
	height: 25%;
	text-align: center;
    line-height: 38px;
	background-color: yellow;
}

</style>

</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			인사
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li> 선택1</li>
					<li> 선택2</li>
					<li> 선택3</li>
					<li> 선택4</li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					사원관리
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
				<ul>
					<li> 비선택1</li>
					<li> 비선택2</li>
					<li> 비선택3</li>
					<li> 비선택4</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					사원관리
				<div class="fw_arrow sub3" >
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub3">
				<ul>
					<li> 비선택1</li>
					<li> 비선택2</li>
					<li> 비선택3</li>
					<li> 비선택4</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
					사원관리
				<div class="fw_arrow sub4">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub4">
				<ul>
					<li> 비선택1</li>
					<li> 비선택2</li>
					<li> 비선택3</li>
					<li> 비선택4</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub5" title="sub5" >
					사원관리
				<div class="fw_arrow sub5">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub5">
				<ul>
					<li> 비선택1</li>
					<li> 비선택2</li>
					<li> 비선택3</li>
					<li> 비선택4</li>
				</ul>
			</div>
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		<div id="fw_main">
			| 폴더
		</div>
		
		<div class="cloud_title"> 
			<input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="파일명을 입력해주세요">
			<div class="dropdown" style="display: inline;">
				<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
					<i class="fa fa-navicon" style="font-size:24px"></i>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">새 폴더</a></li>
					<li><a href="#">파일 업로드</a></li>
			    </ul>
			</div>
		</div>
		
 		<!-- <div class="cloud_dir">
			<div class="cloud_dir_img"><i class="fa fa-folder" style="font-size:56px;"></i></div>
			<div class="cloud_dir_text">파일이름</div>
		</div> -->
		<div id="cloud_contents">
			<c:forEach items="${files}" var="file">
				<div class="cloud_dir">
					<div class="cloud_dir_img">
						<!-- <i class="fa fa-folder" style="font-size:56px;"></i> -->
						<i class="fa fa-file-excel-o" style="font-size:56px"></i>
					</div>
					<div class="cloud_dir_text">${file.getName()}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<!-- 우클릭 생성 moal -->
<div class="rClick_modal"> 
	<div class="list-group">
	    <a href="#" class="list-group-item">새 폴더</a>
	    <a href="#" class="list-group-item">파일 업로드</a>
  	</div>
</div>

</body>
</html>