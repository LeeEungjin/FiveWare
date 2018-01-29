<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/erp/menuRegist.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			swal(message);
		}
		
 		$(".mr_btn").click(function(){
 			var menuName=$("#menuName").val();
 			var price=$("#price").val();
 			var recipe=$("#recipe").val();
 			
			if(menuName==""){
				swal("메뉴명을 입력해주세요.");
			}else if(price==""){
				swal("가격을 입력해주세요.");
			}else if(recipe=""){
				swal("레시피을 입력해주세요.");
			}else{
				$("#mr_frm").submit();
				$(".mr_btn").attr("data-dismiss", "modal");
			}
		}); 
		
		$(".menuUpdate").click(function(){
			$("#mr_update_frm").submit();
		});
		
		var kind='${pager.kind}';
		$(".op").each(function(){
			if($(this).val()==kind){
				$(this).attr("selected", true);
			}
		});
		
		$(".list").click(function(){
			var cur = $(this).attr("title");
			var s = '${pager.search}';
			var t = '${pager.kind}';
			document.mr_search_frm.curPage.value=cur;
			document.mr_search_frm.search.value=s;
			document.mr_search_frm.kind.value=t;
			document.mr_search_frm.submit();
		});
		
		$("#allcheck").click(function() {
			if($("#allcheck").prop("checked")){
				$(".menucheck").prop("checked", true);
			}else{
				$(".menucheck").prop("checked", false);
			}
		});
		
		$(".menuView").click(function() {
			var code=$(this).attr("title");
			
			
			$.ajax({
				data : {"menuCode" : code},
				url : "./menuRegistView",
				type : "get",
				success : function(data){
		
					document.getElementById('result_one').innerHTML = "";
					
					$(".viewCode").val(data.menuView.menuCode);
					$(".viewName").val(data.menuView.menuName);
					$(".viewPrice").val(data.menuView.price);
					$(".viewRecipe").val(data.menuView.recipe);
					$(".menuOption").html(data.menuView.menuOption)
					var viewKind=data.menuView.menuKind;

					if(viewKind=='coffee'){
						$("#coffee").attr("selected", "selected");
					}else if(viewKind=='drink'){
						$("#juice").attr("selected", "selected");
					}else if(viewKind=='bread'){
						$("#desert").attr("selected", "selected");
					}
					
					F_FileMultiUpload_Callback(data.files, 'result_one');
					
				},
				error : function(data){
					swal("error");
				}
			});
		});
			
		$(".menuDelete").click(function(){
			var code=$(".viewCode").val();

			$.ajax({
				data : {"menuCode" : code},
				url : "./menuRegistDelete",
				type : "get",
				success : function(data){
					swal("삭제 완료");
					location.reload();
				},
				error : function(data){
					swal("error");
				}
			});
		});
		

		
		$("#mr_checkDelete").click(function(){
			var count=0;
			var code="";
			var codeAr=[];
			
			$(".menucheck").each(function(){
				
				if(this.checked){
					code=$(this).attr("title");
					count++;
					codeAr.push(code);
				}
			});
				if(codeAr.length<1){
					swal("삭제할 메뉴를 선택해주세요.");
				}else{
			
				$.ajax({
					type : "POST",
					url : "./menuRegistDelete",
					data : {
						"menuCode" : codeAr.toString()
					}, success : function(data){
						swal(count+"개의 메뉴가 삭제되었습니다.");
						location.reload();
					}
					});
				}
		});
		$("#checkDelete").click(function(){
			if($("#menucheck").prop("checked")){
			
			}
		});
		
		$("#mr_insert").click(function(){
			$.ajax({
				type:"GET",
				url:"../../codeName",
				success:function(data){
					$("#menuCode").val(data);
				}
			});
		});
		
///////////////////////File Cancel/////////////////////////////////////
		$(".jh_file_cancel").click(function() {
			
			var code=$("#menuCode").val();
			var path=$("#mr_path").val();
			
			$.ajax({
				type : "POST",
				url : "../../ajax/fileDelete",
				data : { code : code ,
						 path : path
				},
				success:function(){
				}
			});

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
	          
	          console.log(files);
	          
	          if(files.length < 1)
	               return;
	          
	          var mode = 'result';
	          var code = document.getElementById('menuCode').value;
	          if(code == '') {
	        	  code = document.getElementById('mr_update_code').value;
	        	  mode = 'result_one';
	          }
	          
	          F_FileMultiUpload(files, code, mode);
	     });
	 	 // Window Onload End
		
	 	 /* var id=$("#headerLoginIdValue").val();
	 	 
	 	 
	 	 
	 	 $("#headerLoginId").val(id); */
	 	 
	 	
	 	 
	});
	
	
	function F_FileMultiUpload(files, code, mode) {
		for(var i=0; i<files.length; i++) {
			var ext = files[i].name.split('.',2)[1];
			if(ext != 'jpg') {
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
	        	console.log(files[i]);
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
	            	F_FileMultiUpload_Callback(data, mode);
	            	
	            },
	            error: function() {
	            	swal("error");
	            }
	         });
		} else {
			swal("4개까지 이미지를 업로드할 수 있습니다.");
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
			    	console.log(temp);
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
        border:2px dotted #CE3636;
        width:119%;
        height:50px;
        color:#CE3636;
        text-align:center;
        font-size:24px;
        padding:10px;
            margin-top: 2%;
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
    
</style>

</head>
<body>

<c:import url="${url}/resources/temp/headerExample.jsp"></c:import>

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
   
      <!-- submenu banner -->
      <div id="fw_subbanner">
         구매/영업
      </div>
      <!-- submenu banner end -->
      
      <!-- submenu menu -->
         <div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub1" title="sub1">
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
         
         <!-- ----------3---------- -->
         <div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
               자재관리
            <div class="fw_arrow sub3">
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
         
         <!-- ----------4---------- -->
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
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
	
	<input id="headerLoginIdValue" type="hidden" value="${member.name}">
	
			<div id="fw_main">
				<div id="mr_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			</div>
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					
					<p id="mr_title">메뉴등록</p>
				</div>
				<div id="erp_jh_contents_search">
					<div id="mr_search">
						<!-- 검색 기능 -->
							<!-- select box -->
						
						
								<div class="input-group">
									<form action="./menuRegist" name="mr_search_frm" method="get">
								<input type="hidden" name="curPage" value="1">
								<select class="form-control" id="sel1" name="kind">
							        <option class="op" value="menuname">메뉴명</option>
							        <option class="op" value="recipe">레시피</option>
							        <option class="op" value="menuoption">설명</option>
							     </select>							
							<!-- select box 끝 -->
							      <input  type="text" class="form-control" placeholder="Search" name="search">
							      
							      <div class="input-group-btn">
							        <button id="search_btn" class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
							      </div>
							       </form>	
							    </div>
						   
						<!-- 검색 기능 끝 -->
						
						<!-- 부가 검색 -->
							<div class="dropdown">
							    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">상세검색
							    <span class="caret"></span></button>
							    
							    <ul class="dropdown-menu" id="test">
							      <li class="dropdown-header">가격</li>
							      <!-- <li><a><span title="price" class="mrFilter" id="mrPriceHigh">높은 순</span></a></li> -->
							      <li><a href="./menuRegist?order=desc">높은 순</a></li>
							      <li><a href="./menuRegist?order=asc">낮은 순</a></li>
							      
							      <li class="divider"></li>
							      <li class="dropdown-header">구분</li>
							      <li><a href="./menuRegist?kind=menukind&menukind=coffee">커피</a></li>
							      <li><a href="./menuRegist?kind=menukind&menukind=drink">음료</a></li>
							      <li><a href="./menuRegist?kind=menukind&menukind=bread">디저트</a></li>
							      
							      <li class="divider"></li>
							      <li><a  href="./menuRegist"><span class="mr_cusor" id="searchReset">검색 초기화</span></a></li>
							    </ul>
							 </div>
							<!-- 부가 검색 끝 -->
					</div>
				</div>
				
				<!-- table -->
					<div id="erp_jh_contents_table">
						<table class="table">
						    <thead>
						      <tr>
						        <th><input type="checkbox" id="allcheck"></th>
						        <th>코드</th>
						        <th>구분</th>
						        <th>이름</th>
						        <th>가격</th>
						        <th>첨부파일</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						    	<c:forEach items="${mr_list}" var="mr_list">
							      <tr>
							      	<td><input name="menucheck" type="checkbox" class="menucheck" title="${mr_list.menuCode}"></td>
							        <td>${mr_list.menuCode}</td>
							        <td>${mr_list.menuKind }</td>
							        <td  class="menuView" title="${mr_list.menuCode}" data-toggle="modal" data-target="#jh_mr_update_Modal">${mr_list.menuName }</td>
							        <td>${mr_list.price }</td>
							        
							        <c:if test="${mr_list.imgNull eq 'true'}">
							        	<td><i class="fa fa-close"></i></td>
							        </c:if>
							        
							        <c:if test="${mr_list.imgNull eq 'false'}">
							        	<td><i class="fa fa-file-image-o"></i></td>
							        </c:if>
							        
							      </tr>
						      </c:forEach>
						    </tbody>
						 </table>
						 
						 <!-- pager -->
						 	<div id="mr_pager">
						 		  <c:if test="${pager.curBlock gt 1}">
									<span class="list" title="${pager.startNum-1}">[이전]</span>
								</c:if>
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
									<span class="list" title="${i}">${i}</span>
								</c:forEach>
								<c:if test="${pager.curBlock lt pager.totalBlock}">
									<span class="list" title="${pager.lastNum+1}">[다음]</span>
								</c:if>
						 	</div>
						 <!-- pager 끝 -->
					</div>
				<!-- table 끝 -->
				
				<!-- 등록 버튼 -->
				
					<div id="erp_jh_contents_bottom">
						
						<c:if test="${member.temp == '영업/구매부'}">
							<button class="btn btn-default" id="mr_checkDelete">선택삭제</button>
							<button class="btn btn-default" id="mr_insert" class="modal_btn" data-toggle="modal" data-target="#jh_mr_Modal">신규등록</button>
						</c:if>
					</div>
				<!-- 등록 버튼 끝 -->
				
				<!-- Modal -->
				
				<div class="modal fade" id="jh_mr_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close jh_file_cancel" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|메뉴 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="./menuRegistWrite" method="post" id="mr_frm" enctype="multipart/form-data">
				        
				        <input type="hidden" id="mr_path" name="path" value="menuRegist">
				        
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴번호*</span>
							  <input id="menuCode" type="text" class="form-control"  placeholder="Additional Info" name="menuCode">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴구분*</span>
							  <select class="form-control" id="sel12" name="menuKind">
							        <option value="coffee">커피</option>
							        <option value="drink">음료</option>
							        <option value="bread">디저트</option>
							   </select>			
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴명*</span>
							  <input id="menuName" type="text" class="form-control" placeholder="Additional Info" name="menuName">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">가격*</span>
							  <input id="price" type="text" class="form-control"  placeholder="Additional Info" name="price">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">레시피*</span>
							  <input id="recipe" type="text" class="form-control"  placeholder="Additional Info" name="recipe">
							</div>
							
							<div class="form-group">
							  <!-- <span class="input-group-addon">설명</span> -->
						      <div id="area_text"><label class="jh_label" for="comment">메뉴의 설명을 작성해주세요.</label></div> 
						      <textarea class="form-control form-control_area" rows="5" id="comment" name="menuOption"></textarea>
						    </div>
						    
						    <div class="input-group input-group_modal or_input-group_modal_2">
							  <div class="dropzone">Drag & Drop Files Here</div> 
							</div>
							
							<div class="input-group input-group_modal or_input-group_modal_2">
							  <div id="result"></div>
							</div>
							
							<input type="hidden" name="imgNull" value="false">
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default mr_btn"  value="등록">
				          <button type="button" class="btn btn-default jh_file_cancel" data-dismiss="modal">Close</button>
				        </div>
				       </form>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
				<!-- --------------------------------------------------------------------------------------------------------- -->
				
				
				<!-- 수정 Modal -->
				
				<div class="modal fade" id="jh_mr_update_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close jh_file_cancel" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|메뉴 확인 및 수정</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="./menuRegistUpdate" method="post" id="mr_update_frm">
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴번호</span>
							  <input name="menuCode" id="mr_update_code" type="text" class="form-control viewCode"  placeholder="Additional Info" readonly="readonly">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴구분</span>
							  <select name="menuKind" class="form-control" id="sel2">
							        <option id="coffee" value="coffee">커피</option>
							        <option id="drink" value="juice">음료</option>
							        <option id="bread" value="desert">디저트</option>
							     </select>				
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴명</span>
							  <input name="menuName" type="text" class="form-control viewName"placeholder="Additional Info" >
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">가격</span>
							  <input name="price" type="text" class="form-control viewPrice" placeholder="Additional Info" >
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">레시피</span>
							  <input name="recipe"  type="text" class="form-control viewRecipe" placeholder="Additional Info">
							</div>
							
							<div class="form-group">
							  <!-- <span class="input-group-addon">설명</span> -->
						      <div id="area_text"><label class="jh_label" for="comment">메뉴의 설명을 작성해주세요.</label></div> 
						      <textarea name="menuOption" class="form-control form-control_area menuOption" rows="5" id="comment"></textarea>
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
				          <button type="button" class="btn btn-default menuUpdate" data-dismiss="modal">수정</button>
						  <button type="button" class="btn btn-default menuDelete" data-dismiss="modal">삭제</button>	
						</c:if>			        
				          <button type="button" class="btn btn-default jh_file_cancel" data-dismiss="modal">Close</button>
				        </div>
				        </form>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- 수정 Modal 끝 -->
				
				
			</div>
		</div>
	</div>
</body>
</html>