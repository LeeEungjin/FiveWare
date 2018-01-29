<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<link href="${url}/resources/css/erp/ej_erp.css" rel="stylesheet">
<link href="${url}/resources/css/common/modal_boot.css" rel="stylesheet">
<link>

<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
		//Get the modal
		var modal = document.getElementById('ej_modal');
		var modalOne = document.getElementById('ej_modalOne');
		
		// Get the button that opens the modal
		var btn = document.getElementById("ej_write_btn");
		
		// Get the <span> element that closes the modal
		var close = document.getElementsByClassName("close");
		
		// When the user clicks the button, open the modal 
		btn.addEventListener('click', function() {
			modal.style.display = "block";
		});
		
		// When the user clicks on <span> (x), close the modal
		close[0].addEventListener('click', function() {
			modal.style.display = "none";
		});
		
		close[1].addEventListener('click', function() {
			modalOne.style.display = "none";
		});
		
		// write - code
		$("#ej_write_btn").click(function() {
			$.ajax({
				type:"GET",
				url:"../../codeName",
				success:function(data){
					$("#code").val(data);
				}
			});
		});
		
		// update - selectOne
		$(".ej_modalOne_btn").click(function() {
			modalOne.style.display = "block";
			
			var code = $(this).text();
			$.ajax({
	            data : {"code" : code},
	            url : "./productOne",
	            type : "get",
	            success : function(data){
	            	document.getElementById('result_one').innerHTML = "";
	            	
	            	$("#code_one").val(data.product.code);
					$("#name_one").val(data.product.name);
					$("#standard_one").val(data.product.standard);
					$("#memo_one").val(data.product.memo);
					$("#price_one").val(data.product.price);
					$("#use_one").val(data.product.use);
					
					// if 'use' is true, 'stop'
					if($("#use_one").val() == "true") {
						$("#ej_modal_stop").val("사용중지")
					} else {
						$("#ej_modal_stop").val("사용")
					}
					
					F_FileMultiUpload_Callback(data.files, 'result_one');
	            },
	            error : function(data){
	               swal("error");
	            }
         	}); 
		});
		
		/////////////////////////////delete / use Stop////////////////////////////////////
		$("#ej_modal_delete").click(function() {
			var del = confirm("Are you sure you want to delete it?")
			
			if(del) {
				$("#ej_modalModify_frm").attr("action", "./productDelete")
				$("#ej_modalModify_frm").submit();
			}
		});
		
		$("#ej_modal_stop").click(function() {
			$("#ej_modalModify_frm").attr("action", "////////////////////////")
			$("#ej_modalModify_frm").submit();
		});
		
		
		///////////////////////File Cancel/////////////////////////////////////
		$(".ej_file_cancel").click(function() {
			var code=$("#code").val();
			var path=$("#path").val();
			
			$.ajax({
				url: "../../ajax/fileDelete",
				type: "POST",
				data: {
					"code" : code,
					"path" : path
				},
				success: function() { }
			});
		});
		
		////////////////////////////////////Pager//////////////////////////////////
		$(".ej_list").click(function() {
			var cur = $(this).attr("title");
			var s = '${pager.search}';
			var t = '${pager.kind}';
			document.ej_frm.curPage.value=cur;
			document.ej_frm.submit();
		});
		
		
		//////////////////////////File Upload//////////////////////////////////
		var obj = $(".dropzone");

	     obj.on('dragenter', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	          $(this).css('border', '2px solid #5272A0');
	     });

	     obj.on('dragleave', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	          $(this).css('border', '2px dotted #8296C2');
	     });

	     obj.on('dragover', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	     });

	     obj.on('drop', function (e) {
	          e.preventDefault();
	          $(this).css('border', '2px dotted #8296C2');

	          var files = e.originalEvent.dataTransfer.files;
	          
	          if(files.length < 1)
	               return;
	          
	          var mode = 'result';
	          var code = document.getElementById('code').value;
	          if(code == '') {
	        	  code = document.getElementById('code_one').value;
	        	  mode = 'result_one';
	          }
	          
	          F_FileMultiUpload(files, code, mode);
	     });
	 	 // Window Onload End
	}); 
	
	function F_FileMultiUpload(files, code, mode) {
		for(var i=0; i<files.length; i++) {
			var ext = files[i].name.split('.',2)[1].toLowerCase();
			console.log(ext);
			if(!(ext == 'jpg' || ext == 'png' || ext == 'jpeg')) {
				swal("Error", "사진파일만 올릴 수 있습니다.");
				return false;
			}
		}
		
		var len = 0;
		
		$.ajax({
			url: '../../ajax/fileList',
			data: {'code': code},
			async: false,
			success:function(result) {
				len = result.length;
			}
		});
		
		if( (files.length+len) < 5 ) {
	         var data = new FormData();
	         for (var i = 0; i < files.length; i++) {
	            data.append('file', files[i]);
	         }
	         
	         data.append('code', code)
	    
	         var url = "../../ajax/drapAndDrop";
	         $.ajax({
	            url: url,
	            method: 'post',
	            data: data,
	            processData: false,
	            contentType: false,
	            success: function(data) {
	            	swal("성공");
	            	F_FileMultiUpload_Callback(data, mode);
	            	
	            },
	            error: function() {
	            	swal("error");
	            }
	         });
		} else {
			swal("실패","이미지는 4개까지 업로드할 수 있습니다.");
		}
	    
	}

	// 파일 멀티 업로드 Callback
	function F_FileMultiUpload_Callback(files, result) {
	    var result = document.getElementById(result);
		for(var i=0; i < files.length; i++){
		    var img = document.createElement('img');
		    img.setAttribute("src", "${pageContext.request.contextPath}/resources/product/"+files[i].filename);
		    img.setAttribute("title", files[i].fnum)
		    img.className = "img_margin ej_img_btn";
		    img.onclick = function() {
		    	if(confirm("삭제하시겠습니까?") == true) {
			    	var temp = this;
					var fnum = this.getAttribute('title');
					
					$.ajax({
						url: '../../ajax/fileDeleteOne',
						data: {'fnum': fnum},
						success:function(result) {
							swal("삭제되었습니다.");
							temp.remove();
						}
					});
		    	}
		    };
		    result.appendChild(img);
		}
	}
	
</script>

<style>
    .dropzone
    {
        border:2px dotted #3292A2;
        width:100%;
        height:50px;
        color:#92AAB0;
        text-align:center;
        font-size:24px;
        padding:10px;
    }
    #result, #result_one {
    	width: 100%;
    	height: 150px;
    }
    
    .img_margin {
   		width: 20%;
    	height: 150px;
    	margin-left: 2.5%;
    	margin-right: 2.5%;
    }

	#erp_jh_event_sub {
		width: 90%;
		height: 16%;
		background-color: #f6f6f6;
		padding-top: 0.5%;
		margin-left: 5%;
	}
	
	#erp_jh_event_sub p {
		font-size: 30px;
	    font-weight: bold;
	    margin-top: 1.5%;
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
				<li><a href="../foundation/supplier">거래처 등록</a></li>
               <li><a href="../foundation/product">제품 등록</a></li>
               <li><a href="./menuRegist">메뉴 등록</a></li>
               <li><a href="./storageRegist">창고 등록</a></li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					구매관리
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
				<ul>
               		<li><a href="../order/orderRegist">주문 입력</a></li>
               		<li><a href="../order/graph/orderGraph">주문 현황 보기</a></li>
            	</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					자재관리
				<div class="fw_arrow sub3" >
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub3">
				 <ul>
	               <li><a href="../../erp/mater/materRegist?materKind=enter">입고 입력</a></li>
	               <li><a href="../../erp/mater/materRegist?materKind=rele">출고 입력</a></li>
	               <li><a href="../../erp/mater/materRegist?materKind=back">반품 입력</a></li>
	               <li><a href="../../erp/mater/materRegist?materKind=confin">불출 입력</a></li>
	            </ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
					조회
				<div class="fw_arrow sub4">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub4">
				<ul>
	               <li><a href="../../erp/into/intoList">조회 및 엑셀 다운</a></li>
	            </ul>
			</div>
			
			<!-- -------------------- -->
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				<div id="mr_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
				<!-- <div class="sales_title_menu">기초 정보</div>
				<div class="sales_title_menu">구매 관리</div>
				<div class="sales_title_menu">자재 관리</div>
				<div class="sales_title_menu">반품 관리</div>
				<div class="sales_title_menu">조 회</div> -->
			</div>
			
			<!-- main contents -->
			<div id="fw_main_contents">
				<!-- erp_jh_contents_title -->
				<div id="erp_jh_event_sub">
					
					<p>제품 등록</p>
				</div>
				
				<!-- 검색 기능 -->
				<div class="container" style="background-color: #EAEAEA;">
					<form name="ej_frm" action="./product" method="get">
						<div class="erp_ej_search" style="max-width: 420px;">
							<div class="erp_ej_inputBox">
								<select name="kind">
									<option value="code">품목코드</option>
									<option value="name">품목명</option>
									<option value="standard">규격</option>
								</select>
							</div>
							<div class="erp_ej_inputBox">
								<input type="text" name="search">
							</div>
							<div class="erp_ej_inputBox">
								<input class="ej_search_btn btn" type="submit" value="검색">
							</div>
						</div>
					</form>					
				</div>
				<!-- 검색 기능 끝 -->
				
				
				<!-- table Start -->
				<div class="container">
					<table class="table">
					    <thead>
					      <tr>
					        <th>품목코드</th>
					        <th>품목명</th>
					        <th>규격</th>
					        <th>가격</th>
					        <th>이미지</th>
					        <!-- 사용구분은 취소선이나 색깔로 표시 -->
					      </tr>
					    </thead>
					    <tbody>
						    <c:forEach items="${list}" var="dto">
						    	<tr>
						    		<td><a class="ej_modalOne_btn">${dto.code}</a></td>
						    		<td>${dto.name}</td>
						    		<td>${dto.standard}</td>
						    		<td>${dto.price}</td>
						    		<td>준비중</td>
						    	</tr>
						    </c:forEach>
					    </tbody>
					 </table>
					 
					 <!-- pager Start -->
					 	<div id="mr_pager" class="container" style="margin-top: 20px;">
							<c:if test="${pager.curBlock gt 1}">
								<span class="ej_list" title="${pager.startNum-1}">◀</span>
							</c:if>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<span class="ej_list" title="${i}">${i}</span>
							</c:forEach>
							<c:if test="${pager.curBlock lt pager.totalBlock}">
								<span class="ej_list" title="${pager.lastNum+1}">▶</span>
							</c:if>
						</div>
					 <!-- pager 끝 -->
				</div>
				<!-- table 끝 -->
					
				<!-- 등록 버튼 -->
				<div class="container" id="erp_jh_contents_bottom">
					<c:if test="${member.temp eq '영업/구매부'}">
						<button class="ej_right_btn btn" id="ej_write_btn">신규등록</button>
					</c:if>
				</div>
				<!-- 등록 버튼 끝 -->
				
			</div>
			<!-- END_main contents -->
	</div>
</div>



<!-- Modal -->
<div id="ej_modal" class="modal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
      	<!-- modal header -->
        <div class="modal-header">
          <button type="button" class="close ej_file_cancel">&times;</button>
          <h4 class="modal-title">|제품 등록</h4>
        </div>
        <!-- modal header 끝-->
        
        <!-- modal contents -->
       <form action="./productWrite" method="post" id="ej_write_frm" enctype="multipart/form-data">
       <input type="hidden" id="path" name="path" value="product">
       <input type="hidden" name="use" value="true">
        <div class="modal-body">
        	<div class="input-group input-group_modal or_input-group_modal">
			  <span class="input-group-addon">품목코드</span>
			  <input id="code" name="code" type="text" class="form-control" readonly="readonly">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal">
			  <span class="input-group-addon">품목명</span>
			  <input id="name" name="name" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal">
			  <span class="input-group-addon">규격</span>
			  <input id="standard" name="standard" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal">
			  <span class="input-group-addon">가격</span>
			  <input id="price" name="price" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal_2">
			  <span class="input-group-addon">개요</span>
			  <input id="memo" name="memo" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal_2">
			  <div class="dropzone">Drag & Drop Files Here</div> 
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal_2">
			  <div id="result"></div>
			</div>
			
			
        </div>
        <!-- modal contents 끝-->
        
        <!-- modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-default">등록</button>
          <button type="button" class="btn btn-default ej_file_cancel" data-dismiss="modal">Close</button>
        </div>
      </form>
      	<!-- modal footer 끝-->
      </div>
    </div>
  </div>
<!-- Modal 끝 -->

<!-- Modal Update / Delete 시작 -->
<div id="ej_modalOne" class="modal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
      	<!-- modal header -->
        <div class="modal-header">
          <button type="button" class="close ej_file_cancel">&times;</button>
          <h4 class="modal-title">|제품 등록</h4>
        </div>
        <!-- modal header 끝-->
        
        <!-- modal contents -->
       <form action="./productUpdate" method="post" id="ej_modalModify_frm" enctype="multipart/form-data">
       <input type="hidden" name="use" id="use_one">
        <div class="modal-body">
        	<div class="input-group input-group_modal or_input-group_modal">
			  <span class="input-group-addon">품목코드</span>
			  <input id="code_one" name="code" type="text" class="form-control" readonly="readonly">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal">
			  <span class="input-group-addon">품목명</span>
			  <input id="name_one" name="name" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal">
			  <span class="input-group-addon">규격</span>
			  <input id="standard_one" name="standard" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal">
			  <span class="input-group-addon">가격</span>
			  <input id="price_one" name="price" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal_2">
			  <span class="input-group-addon">개요</span>
			  <input id="memo_one" name="memo" type="text" class="form-control">
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal_2">
			  <div class="dropzone">Drag & Drop Files Here</div> 
			</div>
			
			<div class="input-group input-group_modal or_input-group_modal_2">
			  <div id="result_one"></div>
			</div>
			
			
        </div>
        <!-- modal contents 끝-->
        
        <!-- modal footer -->
        <div class="modal-footer">
        <c:if test="${member.temp eq '영업/구매부'}">
			<input type="submit" id="ej_modal_update" class="btn" value="수정">
			<input type="button" id="ej_modal_stop" class="btn" value="사용중지">
			<input type="button" id="ej_modal_delete" class="btn" value="삭제">
		</c:if>
			<button type="button" class="btn btn-default ej_file_cancel" data-dismiss="modal">Close</button>
        </div>
      </form>
      	<!-- modal footer 끝-->
      </div>
    </div>
  </div>
<!-- Modal Update / Delete 끝 -->

</body>
</html>