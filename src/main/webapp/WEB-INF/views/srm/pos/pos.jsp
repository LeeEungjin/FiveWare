<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="${pageContext.request.contextPath}/resources/css/srm/pos/pos.css" rel="stylesheet">
<html>
<script type="text/javascript">
	$(function(){
		var myVar = setInterval(myTimer, 1000);

		function myTimer() {
		    var d = new Date();
		    $("#time").text(d.toLocaleTimeString());
		
		}
		
		$("#eb_staff_time").click(function(){
			
			var store='${member.store}';
			$.ajax({
				type : "get",
				url : "staffList",
				data : {"store" : store},
				success : function(data){
					
					$("#eb_staffList").html(data);
				
					
				},error : function(){
					alert("error");
				}
			});
			
			
			
		});
		
					
			 	$("#eb_staffList").on("click",".eb_startTime",function(){
			 		
					var num=$(this).attr("title");
					var regdate='${sysdate}';
					var time=$("#time").text();
					var store='${member.store}';
					
					if(confirm("출근처리 하시겠습니까?")==false){
						alert("출근처리가 취소되었습니다.");
						return false;
					}else{
					
			 		$.ajax({
						type : "POST",
						 url : "./staffTime",
						data :{
							"num" : num,
							"regdate" : regdate,
							"startTime" : time,
							"lastTime" : '0',
							"store" : store
						},success : function(data){
							alert(regdate+time+"출근처리 완료");
						},error : function(){
							alert("Error");
						}
						
					});
					}
				}); 
			 	
			 	$("#eb_staffList").on("click",".eb_lastTime",function(){
			
					var num=$(this).attr("title");
					var regdate='${sysdate}';
					var time=$("#time").text();
					
					if(confirm("퇴근처리하시겠습니까?")==false){
						alert("퇴근 처리가 취소되었습니다.")
						return false;
					}else{
					
			 		$.ajax({
						type : "POST",
						 url : "./staffTimeUpdate",
						data :{
							"num" : num,
							"lastTime" : time
						},success : function(data){
							alert(regdate+time+"퇴근처리 완료");
							alert(data);
						},error : function(){
							alert("Error");
						}
						
					});
					}
				}); 
			 	
	});
	
</script>
<head>
	<title>Home</title>

</head>
<body>
	<div class="wrap">
	
		<div class="logo">
			<table id="logo_Table">
				<tr> 
					<td>logo</td> 
					<td>지점 : ${member.store }</td> 
					<td>영업일자 : ${sysdate}</td> 
					<td>지점장 : ${member.name }</td> 
					<td><span id="time"></span></td> 
					<td>
						<input type="button" value="출/퇴근" class="btn btn-default" data-toggle="modal" data-target="#myModal" id="eb_staff_time">
					</td>
				</tr>
				
			</table>
		</div>
		
		
		
		<!--직원 출퇴근 modal  -->
		
		<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" id="eb_modal">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">출/퇴근 입력</h4>
        </div>
        <div class="modal-body" >
          <table id="eb_modal_table">
          	<thead class="eb_modal_thead">
          		<tr>
          			<th>지점</th>
          			<th>이름</th>
          			<th>근무 시간</th>
          			<th>출근 </th>
          			<th>퇴근 </th>
          		</tr>
          	</thead>
          	
          	<tbody id="eb_staffList" >
          		
          	
          	</tbody>
          	
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
		
		<div class="menuWrap1">
		
			<div class="menu1">
				<table id="menu1_table">
					<tr>
						<th>메뉴명</th>
						<th>정가</th>
						<th>수량</th>
						<th>할인</th>
						<th>금액</th>
					</tr>
					
					
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>	
					
				</table>
			
			</div>
			
			<div class="menu2">
				<p id="p1">총금액 : </p>
				<p id="p2"> 10000 won</p>
			</div>
			
			<div class="menu3">
			
			<div class="btn-group" id="eb_btn-group_1">
   			 	<button type="button" class="btn btn-primary b1">전체<br>취소</button>
   			 	<button type="button" class="btn btn-primary b1">선택<br>취소</button>
    			<button type="button" class="btn btn-primary b1">할인<br>처리</button>
    			<button type="button" class="btn btn-primary b1">수량<br>변경</button>
 			</div>
 			
 			  <div class="btn-group" id="eb_btn-group_2">
   			 	<button type="button" class="btn btn-primary b1">-</button>
   			 	<button type="button" class="btn btn-primary b1">+</button>
    			<button type="button" class="btn btn-primary b1">▲</button>
    			<button type="button" class="btn btn-primary b1">▼</button>
 			</div>  
				
			</div>
			
			<div class="menu4">
				<p id="p3">결제 정보</p>
					<div class="blank"></div>
						<table id="menu4_table">
							<tr>
								<td>총금액</td>
								<td>0</td>
							</tr>	
							<tr>
								<td>할인금액</td>
								<td>0</td>
							</tr>
							<tr>
								<td>받은금액</td>
								<td>0</td>
							</tr>
							<tr>
								<td>남은금액</td>
								<td>0</td>
							</tr>
							<tr>
								<td>거스름돈</td>
								<td>0</td>
							</tr>
					
					</table>
			</div>
			
			<div class="menu4_1">
		       <div class="price">
		       <p class="price_p">1000</p>
		       </div>
		       
		       <div class="price_1">
		       <div class="btn-group-vertical1">
    				<button type="button" class="btn btn-primary b3">7</button>
    				<button type="button" class="btn btn-primary b3">4</button>
    				<button type="button" class="btn btn-primary b3">1</button>
    				<button type="button" class="btn btn-primary b3">0</button>
  				</div>
		       </div>
		       
		       <div class="price_2">
		      	 <div class="btn-group-vertical1">
    				<button type="button" class="btn btn-primary b3">8</button>
    				<button type="button" class="btn btn-primary b3">5</button>
    				<button type="button" class="btn btn-primary b3">2</button>
    				<button type="button" class="btn btn-primary b3">00</button>
  				</div>
		       </div>
		       
		       <div class="price_3">
		       	<div class="btn-group-vertical1">
    				<button type="button" class="btn btn-primary b3">9</button>
    				<button type="button" class="btn btn-primary b3">6</button>
    				<button type="button" class="btn btn-primary b3">3</button>
    				<button type="button" class="btn btn-primary b3">C</button>
  					</div>
		       </div>
		       
		       <div class="price_4">
		       		<button type="button" class="btn btn-primary b4">〈 </button>
		       </div>
		       
		       <div class="price_5">
		    		<button type="button" class="btn btn-primary b4">Enter </button>
		       </div>
			</div>
			
			<div class="menu4_2">
				<div class="btn-group-vertical1">
    				<button type="button" class="btn btn-primary b2">Home Page</button>
    				<button type="button" class="btn btn-primary b2">주문</button>
    				<button type="button" class="btn btn-primary b2">환전</button>
    				<button type="button" class="btn btn-primary b2">상품<br>등록</button>
  				</div>
			</div>
			
		</div>
		
		<div class="menuWrap2">
		  <div class="menu5">
		  
		   <ul class="nav nav-tabs">
    		<li class="active"><a data-toggle="tab" href="#coffee">Coffee</a></li>
    		<li><a data-toggle="tab" href="#drink">Drink</a></li>
    		<li><a data-toggle="tab" href="#bread">Bread</a></li>
  		</ul>

  			<div class="tab-content">
    			<div id="coffee" class="tab-pane fade in active">
     			 	<h3>Coffee</h3>
      				<p>아메~~~</p>
    			</div>
    		
    			<div id="drink" class="tab-pane fade">
     			 	<p>스무디~~~</p>
   				
   				 </div>
    			<div id="bread" class="tab-pane fade">
      				<p>빵~~</p>
   			 	</div>
   
  				  
		 	</div>
		</div>
		
		
		   <div class="menu6">
		   		<div class="menu6_1">
		   				<button type="button" class="btn btn-primary b4">현금 결제</button>
		   		</div>
		   		
		   		<div class="menu6_234">
		   			<div class="menu6_2">
		   				<button type="button" class="btn btn-primary b4">영수증 관리</button>
		   			</div>
		   		
		   			<div class="menu6_3">
		   				<button type="button" class="btn btn-primary b4">부분 계산</button>
		   			</div> 
		   		
		   			<div class="menu6_4">
		   				<button type="button" class="btn btn-primary b4">현금 영수증</button>
		   			</div>
		   		</div>
		   		
		   		 <div class="menu6_5">
		   				<button type="button" class="btn btn-primary b4">신용카드 결제</button>
		   		</div> 
		   
		   </div>
		  
		</div>
		
 	</div>
</body>
</html>
