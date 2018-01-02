<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <link href="${url }/resources/css/erp/storeRegist.css" rel="stylesheet">


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

 


<title>Insert title here</title>
<script type="text/javascript">

		 
 $(function(){
	 
		$(".fw_menu").click(function(){
			var sub = $(this).attr("title");
			
			if($("."+sub).html().trim()=="∧"){
				$("."+sub).html("∨");
			}else{
				$("."+sub).html("∧");
			}
			
		});
	 
	 $("input[class=input_all]").click(function(){
			if($("input[class=input_all]").prop("checked")){
				$("input[class=input_chk]").prop("checked",true);
			}else{
				$("input[class=input_chk]").prop("checked",false);
			}
		});
	 
	 
	 $(".eb_view").click(function(){
		 var code=$(this).attr("title");
         $.ajax({
            data : {"code" : code},
            url : "./storeRegistView",
            type : "get",
            success : function(data){
            	alert("success");
            	/*  $("#eb_view_modal").html(data); */
           /*     $ (".viewCode").val(data.menuCode);
               $(".viewName").val(data.menuName);
               $(".viewPrice").val(data.price);
               $(".viewRecipe").val(data.recipe);
               $("#eb_view_modal").html(data.menuOption)
               var viewKind=data.menuKind;  */
              
            },
            error : function(data){
               alert("error");
            }
         }); 
	 });
	 
	


	 
 });
 
 function sample6_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullAddr = ''; // 최종 주소 변수
             var extraAddr = ''; // 조합형 주소 변수

             // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 fullAddr = data.roadAddress;

             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 fullAddr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
             if(data.userSelectedType === 'R'){
                 //법정동명이 있을 경우 추가한다.
                 if(data.bname !== ''){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있을 경우 추가한다.
                 if(data.buildingName !== ''){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('sample6_address').value = fullAddr;

             // 커서를 상세주소 필드로 이동한다.
             document.getElementById('sample6_address2').focus();
         }
     }).open();
 }
 
</script>
</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 


<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			회계
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
					<li> 지점 등록</li>
					<li> 예금 계좌 등록</li>
					<li> 부서 등록</li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					전표 입력
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
				<ul>
					<li> 일반 전표 입력</li>
					<li> 일반 관리비 입력</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
			<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					결산
				
			</div>
			
			
			
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
			
			<div id="eb_fw_main_1"></div>
			
			<div id="eb_fw_main_2">
				<table id="eb_fw_main_2_table">
					<tr >
						<td class="eb_row">회계</td>
						<td class="eb_row">예산</td>
						<td class="eb_row">영업/구매</td>
						<td class="eb_row">인사</td>
					</tr>
				</table>
			</div>
				
				
		</div>
			
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">지점등록</span>
				</div>
				
				<div id="eb_contents_box">
				
				 <div class="eb_blank"></div>
					
				<!-- <form action="./storeRegist" method="get"> -->
				   <input type="hidden" name="curPage" value="1">
					
					<table id="eb_contents_box_table" >
						
						<tr>
						  <td>코드</td>
						  <td><input type="text" name="search"></td>
						  <td>대표자 명</td>
						  <td><input type="text" name="search"></td>
						</tr>
						
						<tr>
							<td>지점명</td>
							<td><input type="text" name="search"></td>
							<td><button class="btn btn-default">search</button></td>
						</tr>
						</table>
				   <!-- </form> -->
				  
				</div> 
				
				<div id="eb_contents_table">
				  	
             				
             		<table class="table table-striped">
						   
						<thead id="eb_table_head">
						    <tr>
						     <th><input type="checkbox" class="input_all"></th>
						     <th>코드</th>
						     <th>지점명</th>
						     <th>주소</th>
						     <th>전화번호</th>
						     <th>영업시간</th>	     
						    </tr>
						 </thead>
						    
						    <tbody>
						    
						    	<c:forEach items="${list}" var="dto">
							      <tr>
							        <td><input type="checkbox" class="input_chk"></td>
							      	<td class="eb_view" title="${dto.code}" data-toggle="modal" data-target="#eb_view_modal">${dto.code}</td>
							        <td>${dto.store}</td>					
							        <td>${dto.addr}</td>
							        <td>${dto.tel}</td>								      
							        <td>${dto.time}</td>						      			   
							     </tr>
							     </c:forEach>
						   </tbody>
					 </table>
					
					<!-- view Modal -->
					
					<div class="modal fade" id="eb_view_modal">
			 
				<div class="modal-dialog">
				
					 <div class="modal-content">
						      
						        <!-- Modal Header -->
						<div class="modal-header">
						
						   <h4 class="modal-title"> | 지점 정보</h4>
						   
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
						       
						        </div>
						        
						        <!-- Modal body -->
				 <div class="modal-body">
				 
					<table id="eb_modal_table">
						<tr>
						   <td>지점명 코드</td>
						   <td>${view.code}</td>
						   <td>지점명</td>
						   <td>${view.store}</td>
						   
						</tr>
						
						<tr>
						   <td>대표자</td>
						   <td><input type="text" name="name"></td>
						   <td>사업자 등록 번호</td>
						   <td><input type="text" name="storeNum"></td>
						   
						</tr>
						          	
						<tr>
						   <td>주소</td>
						   <td>${view.addr}</td>
						   <td>영업시간</td>
						   <td><input type="text" name="time"></td>
						 
						</tr>
						          	
						<tr>
						   <td>전화번호</td>
						   <td><input type="text" name="tel"></td> 
						   <td>E-mail</td>
						   <td><input type="text" name="email"></td>
						</tr>
						          	
						<tr>
						   <td>은행</td>
						   <td><input type="text" name="bank"></td>
						   <td>계좌번호</td>
						   <td><input type="text" name="account"></td>
						 </tr>
						          
					</table>
					
				 </div>
						        
						        <!-- Modal footer -->
				<div class="modal-footer">
						<input type="submit" value="수정">
						<input type="submit" value="삭제">
				 </div>
						        
					</div>
				</div>
			</div>
					
				
				<div id="eb_page">
				
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
						  
						  <button class="btn btn-default">선택삭제</button>
						  
					      <button class="btn btn-default" data-toggle="modal" data-target="#myModal">신규등록</button>
					      
			 
			 
		<form action="storeRegistWrite" method="post">	 
			 <div class="modal fade" id="myModal">
			 
				<div class="modal-dialog">
				
					 <div class="modal-content">
						      
						        <!-- Modal Header -->
						<div class="modal-header">
						
						   <h4 class="modal-title"> | 지점 등록</h4>
						   
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
						       
						        </div>
						        
						        <!-- Modal body -->
				 <div class="modal-body">
				 
					<table id="eb_modal_table">
						<tr>
						   <td>지점명 코드</td>
						   <td><input type="text" name="code">
						   		<button class="btn btn-default">중복확인</button></td>
						   <td>지점명</td>
						   <td><input type="text" name="store"></td>
						   
						</tr>
						
						<tr>
						   <td>대표자</td>
						   <td><input type="text" name="name"></td>
						   <td>사업자 등록 번호</td>
						   <td><input type="text" name="storeNum"></td>
						   
						</tr>
						          	
						<tr>
						   <td>주소</td>
						   <td> 
							   	<input type="text" id="sample6_postcode" placeholder="우편번호" name="addr">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" placeholder="주소" name="addr">
								<input type="text" id="sample6_address2" placeholder="상세주소" name="addr">  
						   </td>
                               
                             
                              
						   <td>영업시간</td>
						   <td><input type="text" name="time"></td>
						 
						</tr>
						          	
						<tr>
						   <td>전화번호</td>
						   <td><input type="text" name="tel"></td> 
						   <td>E-mail</td>
						   <td><input type="text" name="email"></td>
						</tr>
						          	
						<tr>
						   <td>은행</td>
						   <td><input type="text" name="bank"></td>
						   <td>계좌번호</td>
						   <td><input type="text" name="account"></td>
						 </tr>
						          
					</table>
					
				 </div>
						        
						        <!-- Modal footer -->
				<div class="modal-footer">
						<input type="submit" value="등록">
				 </div>
						        
					</div>
				</div>
			</div>
		</form>
		</div>
	</div>
   </div>
</div>

</body>
</html>