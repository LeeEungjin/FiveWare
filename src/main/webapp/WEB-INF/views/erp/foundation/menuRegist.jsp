<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/erp/menuRegist.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
		
 		$(".mr_btn").click(function(){
 			var menuName=$("#menuName").val();
 			var price=$("#price").val();
 			var recipe=$("#recipe").val();
 			
			if(menuName==""){
				alert("메뉴명을 입력해주세요.");
			}else if(price==""){
				alert("가격을 입력해주세요.");
			}else if(recipe=""){
				alert("레시피을 입력해주세요.");
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
			alert(code);
			$.ajax({
				data : {"menuCode" : code},
				url : "./menuRegistView",
				type : "get",
				success : function(data){
					$(".viewCode").val(data.menuCode);
					$(".viewName").val(data.menuName);
					$(".viewPrice").val(data.price);
					$(".viewRecipe").val(data.recipe);
					$(".menuOption").html(data.menuOption)
					var viewKind=data.menuKind;
					/* var sel2=$("#sel2").val(); */
					if(viewKind=='coffee'){
						$("#coffee").attr("selected", "selected");
					}else if(viewKind=='juice'){
						$("#juice").attr("selected", "selected");
					}else if(viewKind=='desert'){
						$("#desert").attr("selected", "selected");
					}
				},
				error : function(data){
					alert("error");
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
					alert("삭제 완료");
					location.reload();
				},
				error : function(data){
					alert("error");
				}
			});
		});
		
		/* $("#checkDelete").click(function(){
			alert("click");
			
			for(var i=0; i<$(".menucheck").length; i++){
				if($(".menucheck").prop("checked")){
					alert("?");
					var checkCode=$(".menucheck").attr("title");
				}
			 
			}
		}); */
		
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
					alert("삭제할 메뉴를 선택해주세요.");
				}else{
			
				alert("code Ar : "+codeAr.toString());
				
				$.ajax({
					type : "POST",
					url : "./menuRegistDelete",
					data : {
						"menuCode" : codeAr.toString()
					}, success : function(data){
						alert(count+"개의 메뉴가 삭제되었습니다.");
						location.reload();
					}
					});
				}
		});
		$("#checkDelete").click(function(){
			alert("click");
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
		
		/* var fileInput=$("#mr_fileInput");
		var fileZone=$("#mr_img_div");
		var submit=$("#mr_imgBtn");
		var fileList=[];
		
		$fileInput.on("change", function(){
			var file=$(this)[0].files;
			
			for(var i=0; i<img.length; i++){
				 fileList.push(file[i]);
				 fileZone.append("<p>file name : " + file[i].name + 
                         " file size : " + file[i].size + "bytes</p>");
			}
		});
		
		$fileZone.on("dragover dragenter dragleave", function(event){
	            event.stopPropagation();
	            event.preventDefault();
	            return false;
	        }, false);
		});
		
		$fileZone.on("drop", function(event){
            event.stopPropagation();
            event.preventDefault();
            
            $fileZone.css({border : "2px solid red"});
            
            var file = event.originalEvent.dataTransfer.files[0];
            console.log("filename : " + file.name);
            fileList.push(file);
            $fileZone.append("<p>file name : " + file.name + 
                             " file size : " + file.size + "bytes</p>");
        });
		
		$submit.click(function(){
			var formData=new FormData();
			var code=$("#menuCode").val();
			
			for(var i=0; i<fileList.length; i++){
				formDate.append("files", fileList[i]);
			}
			
			$.ajax({
				method : "POST",
                url : "./dragandrop",
                processData : false,
                contentType : false,
                data : {formData : formData,
                		code : code,
                		filename : file.name,
                		oriname : file.name
                },success : function(){
                    alert("success");
                }
			});
		});  */
	});
</script>

</head>
<body>

<c:import url="${url}/resources/temp/headerExample.jsp"></c:import>

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
   
      <!-- submenu banner -->
      <div id="fw_subbanner">
         자재관리
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
               <li> 거래처 등록</li>
               <li> 제품 등록</li>
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
               <li> 주문 입력</li>
               <li> 주문 현황 보기</li>
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
         <div class="fw_menu"  >
               	조회
         </div>
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				<!-- <div class="sales_title_menu">기초 정보</div>
				<div class="sales_title_menu">구매 관리</div>
				<div class="sales_title_menu">자재 관리</div>
				<div class="sales_title_menu">반품 관리</div>
				<div class="sales_title_menu">조 회</div> -->
			</div>
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					<div id="mr_icon">icon</div>
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
							      <input type="text" class="form-control" placeholder="Search" name="search">
							      
							      <div class="input-group-btn">
							        <button id="search_btn" class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
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
							      <li><a href="./menuRegist?kind=menukind&menukind=juice">음료</a></li>
							      <li><a href="./menuRegist?kind=menukind&menukind=desert">디저트</a></li>
							      
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
						        <th>사진</th>
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
							        <td>${mr_list.imgNull }</td>
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
						<button id="mr_checkDelete">선택삭제</button>
						<button id="mr_insert" class="modal_btn" data-toggle="modal" data-target="#jh_mr_Modal">신규등록</button>
					</div>
				<!-- 등록 버튼 끝 -->
				
				<!-- Modal -->
				
				<div class="modal fade" id="jh_mr_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|메뉴 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <!-- <form action="./menuRegistWrite" method="post" id="mr_frm"> -->
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴번호*</span>
							  <input id="menuCode" type="text" class="form-control"  placeholder="Additional Info" name="menuCode">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴구분*</span>
							  <select class="form-control" id="sel12" name="menuKind">
							        <option value="coffee">커피</option>
							        <option value="juice">음료</option>
							        <option value="desert">디저트</option>
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
							
							<form enctype="multipart/form-data">
							 <div class="input-group input-group_modal">
							  <span class="input-group-addon">사진</span>
							  <div id="mr_img_div">
							  </div>
							  <input type="file" id="mr_fileInput" multiple="multiple">
							  <button id="er_imgBtn">upload</button>
							</div>
							</form>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">레시피*</span>
							  <input id="recipe" type="text" class="form-control"  placeholder="Additional Info" name="recipe">
							</div>
							
							<div class="form-group">
							  <!-- <span class="input-group-addon">설명</span> -->
						      <div id="area_text"><label class="jh_label" for="comment">메뉴의 설명을 작성해주세요.</label></div> 
						      <textarea class="form-control form-control_area" rows="5" id="comment" name="menuOption"></textarea>
						    </div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default mr_btn"  value="등록">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				       <!--  </form> -->
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
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|메뉴 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="./menuRegistUpdate" method="post" id="mr_update_frm">
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴번호</span>
							  <input name="menuCode" id="msg" type="text" class="form-control viewCode"  placeholder="Additional Info" readonly="readonly">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴구분</span>
							  <select name="menuKind" class="form-control" id="sel2">
							        <option id="coffee" value="coffee">커피</option>
							        <option id="juice" value="juice">음료</option>
							        <option id="desert" value="desert">디저트</option>
							     </select>				
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴명</span>
							  <input name="menuName" id="msg" type="text" class="form-control viewName"placeholder="Additional Info" >
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">가격</span>
							  <input name="price" id="msg" type="text" class="form-control viewPrice" placeholder="Additional Info" >
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">사진</span>
							  <!-- <div id="mr_img_div"></div> -->
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">레시피</span>
							  <input name="recipe" id="msg" type="text" class="form-control viewRecipe" placeholder="Additional Info">
							</div>
							
							<div class="form-group">
							  <!-- <span class="input-group-addon">설명</span> -->
						      <div id="area_text"><label class="jh_label" for="comment">메뉴의 설명을 작성해주세요.</label></div> 
						      <textarea name="menuOption" class="form-control form-control_area menuOption" rows="5" id="comment"></textarea>
						    </div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default menuUpdate" data-dismiss="modal">수정</button>
						  <button type="button" class="btn btn-default menuDelete" data-dismiss="modal">삭제</button>				        
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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