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
		$('#cloud_contents').bind("contextmenu", function(event) { 
		    event.preventDefault();
		    $(".rClick_modal")
		        .appendTo("#cloud_contents")
		        .css({display: "block", top: event.pageY + "px", left: event.pageX + "px"});
		    $(".cloud_dir").css("border", "1px solid lightgray");
		}).bind("click", function(event) {
		    $("div.rClick_modal").hide();
		});
	});
	
	function selectDirEffect(index) {
		var dirs = document.getElementsByClassName('cloud_dir');
		
		for(var i=0; i<dirs.length; i++) {
			if(i == index-1) {
				$('#dir'+(i+1)).css("border", "2px solid blue");
			} else {
				$('#dir'+(i+1)).css("border", "1px solid lightgray");
			}
		}
	}
	
	function enterFolder(name) {
		$('#folderName').val(name);
		
		$('#frmcreateFolder').attr('action', '#');
		$('#frmCreateFolder').submit();
		
	}
	
	// 폴더 생성 Modal 호출
	function folderModal() {
		$('#folderName').val("");
		
		$('#createFolderForm').modal();
	}
	
	// 수정 요망
	function createFolder() {
		var folderName = $('#folderName').val();
		if(folderName.trim() == '' || folderName.trim().length == 0) {
			swal('폴더이름', '입력해주세요');
			return false;
		}
		
		$('#frmcreateFolder').attr('action', '#');
		$('#frmCreateFolder').submit();
	}
	
	
	
	// test 함수
	function test() {
		alert('test');
	}
	
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

.cloud_contents_title {
	padding-bottom: 10px;
	color: gray;
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
			클라우드
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
					<li><a href="javascript:folderModal();">새 폴더</a></li>
					<li><a href="#">파일 업로드</a></li>
			    </ul>
			</div>
		</div>
		
 		<!-- <div class="cloud_dir">
			<div class="cloud_dir_img"><i class="fa fa-folder" style="font-size:56px;"></i></div>
			<div class="cloud_dir_text">파일이름</div>
		</div> -->
		
		<div id="cloud_contents">
			<div class="cloud_contents_folder">
				<div class="cloud_contents_title">폴더</div>
				
				<c:forEach items="${folderList}" var="folder" varStatus="count">
					<c:set value="${count.count}" var="index" />
					
					<div class="cloud_dir" id="dir${count.count}" onclick="selectDirEffect(${count.count})" ondblclick="enterFolder('${folder.name}')">
						<div class="cloud_dir_img">
							<i class="fa fa-folder" style="font-size:56px;"></i>
						</div>
						<div class="cloud_dir_text">${folder.name}</div>
					</div>
					
				</c:forEach>
			</div>
			
			<div class="cloud_contents_file">
				<div class="cloud_contents_title">파일</div>
				
				<c:forEach items="${fileList}" var="file" varStatus="count"> 
					<div class="cloud_dir" id="dir${count.count+index}" onclick="selectDirEffect(${count.count+index})">
						<div class="cloud_dir_img">
							<c:choose>
								<c:when test="${file.ext eq 'jpg' or name[1] eq 'gif' or name[1] eq 'png' or name[1] eq 'jpeg'}">
									<i class="fa fa-folder" style="font-size:56px;"></i>
								</c:when>
				
								<c:when test="${file.ext eq 'txt'}">
									<i class="fa fa-file-text-o" style="font-size:56px;"></i>
								</c:when>
				
								<c:when test="${file.ext eq 'pptx'}">
									<i class="fa fa-file-powerpoint-o" style="font-size:56px"></i>
								</c:when>
				
								<c:when test="${file.ext eq 'xlsx'}">
									<i class="fa fa-file-excel-o" style="font-size:56px"></i>
								</c:when>
				
								<c:otherwise>
									<i class="fa fa-file-o" style="font-size:56px;"></i>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="cloud_dir_text">${file.name}</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
	</div>
</div>

<!-- 캘린더 생성 modal -->
<div class="modal fade" id="createFolderForm" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
        	<!-- modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title">새 폴더 생성</h4>
            </div>
            
            <!-- modal Body -->
            <div class="modal-body">
                <!-- 폴더 생성처리 form -->
                <form action="./myCloud" method='post' id='frmCreateFolder'>
                    <div class='form-group'>
                        <label>폴더이름</label>
                        <input class='form-control' type="text" name='folderName' id='folderName' />
                    </div>
                    <!-- modal Footer -->
                    <div class='modal-footer'>
                        <input type="button" class='btn btn-sm btn-warning' value="확인" onclick="createFolder()" /> 
                        <input type="reset" class='btn btn-sm btn-warning' value="초기화" /> 
                        <input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
                    </div>
                </form>
            </div>
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