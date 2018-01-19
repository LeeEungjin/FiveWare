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
			 	
			 	
			 	$(".b3").click(function(){
			 		var number=$(this).val();
			 	
			 		if(number!='='){
			 		$(".price_p").text($(".price_p").text()+number);			 			
			 		}
			 	
			 	});
			 	
			 	$("#eb_remove").click(function(){
			 		$(".price_p").text("");
			 	});
			 	
			 	$("#eb_enter").click(function(){
			 		var price=$(".price_p").text();
			 		var receive=$("#p4").text();
			 		
			 		
			 		$("#eb_receive").text(price);
			 		$("#eb_change").text(price*1-receive*1);
			 		$("#eb_rest").text(price*1-receive*1);
			 		$(".price_p").text("");
			 	});
			 	
			 	$(".eb_menu").click(function(){
			 		var menu=$(this).text();
			 		var price=$(this).attr("title");
			 		var num=document.getElementsByClassName("eb_menuTable_tr"+menu);
			 		var price_amount = $("#eb_amount"+menu).html()*1;
			 		
			 		
			 		 if(num.length==0) {
				 		$(".eb_menuTable").append("<tr class='eb_menuTable_tr"+menu+"'>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+menu+"</td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+price+"</td><td class='eb_menuTable_th' id='eb_amount"+menu+"'>"+1+"</td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+0+"</td><td class='eb_menuTable_th' id='eb_price"+menu+"'>"+price+"</td></tr>");
				 		$(".eb_menuTable").append("</tr>");
			 		 }else{
				 		$("#eb_amount"+menu).html(price_amount+1);
				 		var price1=price*1*(price_amount+1);
				 	
				 		$("#eb_price"+menu).html(price1);
			 			
			 		 }
			 		 var z = $("#p2").text()*1;
			 		
			 		$("#p2").text(z+price*1);
			 		$("#p4").text(z+price*1);
			 		
			 	});
			 	
			 	$("#eb_allCancel").click(function(){
			 		$(".eb_menuTable").html("");
			 		$("#p2").text("");
			 		$("#p4").text("0");
			 	});
			 	
			 	$("#eb_drink").click(function(){
			 		
			 		$.ajax({
			 			type : "get",
			 			url : "./posMenu",
			 			data : { "menuKind" : "drink"},
			 			success : function(data){
			 				$("#eb_drink_table").html(data);
			 			},error : function(){
			 				alert("error");
			 			}
			 		});
			 	});
			 	
			 	$("#eb_bread").click(function(){
			 		
			 		$.ajax({
			 			type : "get",
			 			url : "./posMenu",
			 			data : { "menuKind" : "bread"},
			 			success : function(data){
			 				$("#eb_bread_table").html(data);
			 			},error : function(){
			 				alert("error");
			 			}
			 		});
			 		
			 	});
			 	
			 	
			 	
			 	$("#eb_drink_table").on("click",".eb_menu",function(){
			 		var menu=$(this).text();
			 		var price=$(this).attr("title");
			 		var num=document.getElementsByClassName("eb_menuTable_tr"+menu);
			 		var price_amount = $("#eb_amount"+menu).html()*1;
			 		
			 		
			 		 if(num.length==0) {
				 		$(".eb_menuTable").append("<tr class='eb_menuTable_tr"+menu+"'>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+menu+"</td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+price+"</td><td class='eb_menuTable_th' id='eb_amount"+menu+"'>"+1+"</td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+0+"</td><td class='eb_menuTable_th' id='eb_price"+menu+"'>"+price+"</td></tr>");
				 		$(".eb_menuTable").append("</tr>");
			 		 }else{
				 		$("#eb_amount"+menu).html(price_amount+1);
				 		var price1=price*1*(price_amount+1);
				 	
				 		$("#eb_price"+menu).html(price1);
			 			
			 		 }
			 		 var z = $("#p2").text()*1;
			 		
			 		$("#p2").text(z+price*1);
			 		$("#p4").text(z+price*1);
			 		
			 	});
			 	
			 	$("#eb_bread_table").on("click",".eb_menu",function(){
			 		var menu=$(this).text();
			 		var price=$(this).attr("title");
			 		var num=document.getElementsByClassName("eb_menuTable_tr"+menu);
			 		var price_amount = $("#eb_amount"+menu).html()*1;
			 		
			 		
			 		 if(num.length==0) {
				 		$(".eb_menuTable").append("<tr class='eb_menuTable_tr"+menu+"'>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+menu+"</td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+price+"</td><td class='eb_menuTable_th' id='eb_amount"+menu+"'>"+1+"</td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+0+"</td><td class='eb_menuTable_th' id='eb_price"+menu+"'>"+price+"</td></tr>");
				 		$(".eb_menuTable").append("</tr>");
			 		 }else{
				 		$("#eb_amount"+menu).html(price_amount+1);
				 		var price1=price*1*(price_amount+1);
				 	
				 		$("#eb_price"+menu).html(price1);
			 			
			 		 }
			 		 var z = $("#p2").text()*1;
			 		
			 		$("#p2").text(z+price*1);
			 		$("#p4").text(z+price*1);
			 		
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
					<td>지점 : ${member.store}</td> 
					<td>영업일자 : ${sysdate}</td> 
					<td>지점장 : ${member.name}</td> 
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
				<thead>
					<tr>
						<th class="eb_menuTable_th">메뉴명</th>
						<th class="eb_menuTable_th">정가</th>
						<th class="eb_menuTable_th">수량</th>
						<th class="eb_menuTable_th">할인</th>
						<th class="eb_menuTable_th">금액</th>
					</tr>
					</thead>
					
					<tbody class="eb_menuTable">
					
					</tbody>
				</table>
			
			</div>
			
			<div class="menu2">
				<p id="p1">총금액 : </p>
				<p id="p2">0</p>
			</div>
			
			<div class="menu3">
			
			<div class="btn-group" id="eb_btn-group_1">
   			 	<button type="button" class="btn btn-primary b1" id="eb_allCancel">전체<br>취소</button>
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
								<td class="eb_table_td">총금액</td>
								<td><p id="p4">0</p></td>
							</tr>	
							<tr>
								<td>할인금액</td>
								<td>0</td>
							</tr>
							<tr>
								<td>받은금액</td>
								<td><p id="eb_receive">0</p></td>
							</tr>
							<tr>
								<td>남은금액</td>
								<td><p id="eb_rest">0</p></td>
							</tr>
							<tr>
								<td>거스름돈</td>
								<td><p id="eb_change">0</p></td>
							</tr>
					
					</table>
			</div>
			
			<div class="menu4_1">
		       <div class="price">
		       <p class="price_p"></p>
		       </div>
		       
		       <div class="price_1">
		       <div class="btn-group-vertical1">
    				<button type="button" class="btn btn-primary b3" value="7" id="eb_7">7</button>
    				<button type="button" class="btn btn-primary b3" value="4" id="eb_4">4</button>
    				<button type="button" class="btn btn-primary b3" value="1">1</button>
    				<button type="button" class="btn btn-primary b3" value="0">0</button>
  				</div>
		       </div>
		       
		       <div class="price_2">
		      	 <div class="btn-group-vertical1">
    				<button type="button" class="btn btn-primary b3" value="8">8</button>
    				<button type="button" class="btn btn-primary b3" value="5">5</button>
    				<button type="button" class="btn btn-primary b3" value="2">2</button>
    				<button type="button" class="btn btn-primary b3" value="00">00</button>
  				</div>
		       </div>
		       
		       <div class="price_3">
		       	<div class="btn-group-vertical1">
    				<button type="button" class="btn btn-primary b3" value="9">9</button>
    				<button type="button" class="btn btn-primary b3" value="6">6</button>
    				<button type="button" class="btn btn-primary b3" value="3">3</button>
    				<button type="button" class="btn btn-primary b3" id="eb_remove">C</button>
  					</div>
		       </div>
		       
		       <div class="price_4">
		       		<button type="button" class="btn btn-primary b4">〈 </button>
		       </div>
		       
		       <div class="price_5">
		    		<button type="button" class="btn btn-primary b4" id="eb_enter">Enter </button>
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
    		<li class="active"><a data-toggle="tab" href="#coffee" id="eb_coffee">Coffee</a></li>
    		<li><a data-toggle="tab" href="#drink" id="eb_drink">Drink</a></li>
    		<li><a data-toggle="tab" href="#bread" id="eb_bread">Bread</a></li>
  		</ul>

  			<div class="tab-content">
    			<div id="coffee" class="tab-pane fade in active">
     			 	<h3>Coffee</h3>
      				<table>
      				<c:forEach items="${pos_menu}" var="dto">
      					<tr>
      						<td><p class="eb_menu" title="${dto.price}">${dto.menuName}</p></td>
      						<td><p class="eb_menuPrice" >${dto.price}</p></td>
      					</tr>
      				</c:forEach>
      				</table>
    			</div>
    		
    			<div id="drink" class="tab-pane fade">
     			 	
	     			 	<table id="eb_drink_table">
	     			 	
	     			 	</table>
	     			 	
   				
   				 </div>
   				 
    			<div id="bread" class="tab-pane fade">
      				
      				<table id="eb_bread_table">
      				
      				</table>
      			
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
