<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/GroupWare/cloud/myCloud.css">

<script type="text/javascript">
	$(function() {
		
		//파일 찾기
		$("#searchInput").on({
			keyup: function() {
				$('#searchResult').css('display', 'block');
				//$('#searachResult').slideDown("slow");
				
				var search = $(this).val().toLowerCase();
				
				$.ajax({
					url: "./cloudSearch",
					type: "POST",
					data: { "foldername":search },
					success: function(data) {
						console.log(data);
						var text = "<ul> <li> - 폴더</li>";
						$.each(data, function(index, item){
							var path = item.folderpath;
							var index = path.lastIndexOf('/');
							path = path.substring(0, index);
							text += "<li><a href=javascript:enterFolder('"+path+"','"+item.foldername+"')>"+item.foldername+"</a></li>"
						});
						text += "</ul>";
						$('#searchResult').html(text);
					}
				});
			}
		});
		
		
		// Start Location
		var session = '${member.code}';
		var path = '${filePath}';
		var paths = path.split('/');
		
		var htmlText = '<a href="./myCloud">내 드라이브</a>';

		if(paths[paths.length-1] == session) {
			$('.cloud_location').html(htmlText);
		} else {
			var index = 4;
			var rootPath = '';
			for(var i=0; i<index; i++) {
				rootPath = rootPath + paths[i];
				if(i != index-1) {
					rootPath = rootPath + "/";
				}
			}
			
			console.log("Root : "+rootPath);
			
			// 동적 location 생성
			var cnt = 0;
			for(var i=index; i<paths.length; i++) {
				for(var j=0; j<cnt; j++) {
					rootPath = rootPath +"/"+ paths[index];
				}
				htmlText = htmlText + " > <a href=javascript:enterFolder('"+rootPath+"','"+paths[i]+"')>"+paths[i]+"</a>";
				cnt++;
			}
			
			console.log(htmlText);
			$('.cloud_location').html(htmlText);
		}
		// END Location
		
		// 우클릭 이벤트
		$('#cloud_contents').bind("contextmenu", function(event) { 
		    event.preventDefault();
		    
		    $(".rClick_modal")
		        .appendTo("#cloud_contents")
		        .css({display: "block", top: event.pageY + "px", left: event.pageX + "px"});
		    $(".cloud_dir").css("border", "1px solid lightgray");
		    
		    $("div.folder_rClick").hide();
		}).bind("click", function(event) {
		    $("div.rClick_modal").hide();
		    $("div.folder_rClick").hide();
		});
		
		// 폴더 우클릭 이벤트
		$('.cloud_dir').bind("contextmenu", function(event) { 
		    event.preventDefault();
		    event.stopPropagation();
		    
		    $(".folder_rClick").css({display: "block", top: event.pageY + "px", left: event.pageX + "px"});
		    $($(this)).css("border", "1px solid lightgray");
		    
		    $('.folder_rClick a:first-child').attr("href", "javascript:fileDelete('"+$(this).attr('title')+"');");
		    $('.folder_rClick a:last-child').attr("href", "javascript:fileDownload('"+$(this).attr('title')+"');");
		    
		    $("div.rClick_modal").hide();
		}).bind("click", function(event) {
		    $("div.folder_rClick").hide();
		});

		// 파일 업로드 넘기기
		$('#file').change(function() {
			$('#frmFile').attr('action', './fileUpload');
			$('#frmFile').submit();
		});
	}); // END
	
	
	// File Download
	function fileDownload(name) { // name = filename, oriname
		var names = name.split(',');
		$('#oriname').val(names[1]);
		$('#filename').val(names[0]);
		
		$('#frmFile').attr('action', './fileDown');
		$('#frmFile').submit();
	}
	
	function fileDelete(name) {
		var filename = name.split(',')[0];
		$('#filename').val(filename);
		
		$('#frmFile').attr('action', './fileDelete');
		$('#frmFile').submit();
	}
	
	function fileClick() {
		var ch = $('#file').click();
	}
	
	// 폴더 선택효과
	function selectDirEffect(index) {
		var len = document.getElementsByClassName('cloud_dir').length;
		
		for(var i=0; i<len; i++) {
			if(i == index-1) {
				$('#dir'+(i+1)).css("border", "2px solid blue");
			} else {
				$('#dir'+(i+1)).css("border", "1px solid lightgray");
			}
		}
	}
	
	function enterFolder(path, name) {
		$('#folderName').val(path+'/'+name);
		
		$('#frmcreateFolder').attr('action', './myCloud');
		$('#frmCreateFolder').submit();
		
	}
	
	// 폴더 생성 Modal 호출
	function folderModal() {
		$('#folderName').val("");
		
		$('#createFolderForm').modal();
	}
	
	// 파일 생성 처리
	function createFolder() {
		var folderName = $('#folderName').val();
		var path = $('#folderName').attr('title');
		
		if(folderName.trim() == '' || folderName.trim().length == 0) {
			swal('폴더이름', '입력해주세요');
			return false;
		}
		
		$('#folderName').val(path+"/"+folderName);
		
		$('#frmCreateFolder').attr('action', './createFolder');
		$('#frmCreateFolder').submit();
	}
	
	
	
	// test 함수
	function test() {
		alert('test');
	}
	
</script>

<title>클라우드</title>

</head>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 

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
				<a href="${url}/GroupWare/cloud/myCloud">내 드라이브</a>
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<c:forEach items="${folderList}" var="folder" varStatus="count">
						<li><a href="javascript:enterFolder('${filePath}', '${folder.name}')">${folder.name}</a></li>
					</c:forEach>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					<a href="${url}/GroupWare/wbs/projectList">프로젝트 관리</a>
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
				<ul>
					<c:forEach items="${prjLists}" var="dto">
						<li><a href="#" style="text-decoration: none;" onclick="projectSchdule('${dto.prj_no}')">${dto.prj_name}</a></li>
					</c:forEach>
				</ul>
			</div>
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		<div id="fw_main">
			<img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png">
		</div>
		
		<div class="cloud_title">
			<div class="search_box">
				<input type="text" id="searchInput" placeholder="폴더명을 입력해주세요">
				<div class="dropdown" style="display: inline;">
					<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
						<i class="fa fa-navicon" style="font-size:24px"></i>
					</button>
					<ul class="dropdown-menu">
						<li><a href="javascript:folderModal();">새 폴더</a></li>
						<li><a href="#">파일 업로드</a></li>
				    </ul>
				</div>
				<div class="cloud-search-box" id="searchResult"></div>
			</div>
		</div>
		
		<div id="cloud_contents">
			<div class="cloud_location"></div>
		
			<div class="cloud_contents_folder">
				<div class="cloud_contents_title">폴더</div>
				
				<c:forEach items="${folderList}" var="folder" varStatus="count">
					<c:set value="${count.count}" var="index" />
					
					<div class="cloud_dir" id="dir${count.count}" onclick="selectDirEffect(${count.count})" ondblclick="enterFolder('${filePath}', '${folder.name}')" title="${folder.name}">
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
					<div class="cloud_dir" id="dir${count.count+index}" onclick="selectDirEffect(${count.count+index})" title="${file.filename},${file.name}">
						<div class="cloud_dir_img">
							<c:choose>
								<c:when test="${fn:toLowerCase(file.ext) eq 'jpg' or fn:toLowerCase(file.ext) eq 'gif' or fn:toLowerCase(file.ext) eq 'png' or fn:toLowerCase(file.ext) eq 'jpeg'}">
									<i class="fa fa-file-image-o" style="font-size:56px;"></i>
								</c:when>
								
								<c:when test="${fn:toLowerCase(file.ext) eq 'txt'}">
									<i class="fa fa-file-text-o" style="font-size:56px;"></i>
								</c:when>
				
								<c:when test="${fn:toLowerCase(file.ext) eq 'pptx'}">
									<i class="fa fa-file-powerpoint-o" style="font-size:56px"></i>
								</c:when>
				
								<c:when test="${fn:toLowerCase(file.ext) eq 'xlsx'}">
									<i class="fa fa-file-excel-o" style="font-size:56px"></i>
								</c:when>
				
								<c:otherwise>
									<i class="fa fa-file-o" style="font-size:56px;"></i>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="cloud_dir_text" data-toggle="tooltip" data-placement="bottom" title="${file.name}">${file.name}</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
	</div>
</div>

<!-- 새 폴더 생성 modal -->
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
                        <input class='form-control' type="text" name='folderName' id='folderName' title="${filePath}" />
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


<!-- 우클릭 생성 modal -->
<div class="rClick_modal"> 
	<div class="list-group">
	    <a href="javascript:folderModal();" class="list-group-item">새 폴더</a>
	    <a href="javascript:fileClick();" class="list-group-item">파일 업로드</a>
  	</div>
</div>

<!-- 폴더 우클릭 생성 modal -->
<div class="folder_rClick"> 
	<div class="list-group">
	    <a href="javascript:fileDelete();" class="list-group-item">삭제</a>
	    <a href="javascript:fileDownload();" class="list-group-item">다운로드</a>
  	</div>
</div>

<!-- 파일 form -->
<form id="frmFile" action="./fileUpload" method="POST" enctype="multipart/form-data" style="display: none;">
	<input type="text" name="path" value="${filePath}">
	<input type="file" name="file" id="file">
	<input type="text" name="oriname" id="oriname"><!-- oriname -->
	<input type="text" name="filename" id="filename"><!-- filename -->
</form>

</body>
</html>