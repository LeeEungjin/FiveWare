<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="${pageContext.request.contextPath}/resources/css/srm/pos/pos.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<html>
<script type="text/javascript">
	$(function(){
		
		CKEDITOR.replace('postITarea');
		
		
		var message = '${message}';
	     if(message != ""){
	        swal(message);
	     }
		
		var myVar = setInterval(myTimer, 1000);

		function myTimer() {
		    var d = new Date();
		    $("#time").text(d.toLocaleTimeString());
		
		}
		
		//직원 리스트
		$("#eb_staff_time").click(function(){
			
			var store='${member.store}';
			$.ajax({
				type : "get",
				url : "staffList",
				data : {"store" : store},
				success : function(data){
					
					$("#eb_staffList").html(data);
				
					
				},error : function(){
					swal("error");
				}
			});
			
			
			
		});
		
		
		    //직원 출근			
			 	$("#eb_staffList").on("click",".eb_startTime",function(){
			 		
					var name=$(this).attr("title");
					var regdate='${sysdate}';
					var time=$("#time").text();
					var store='${member.store}';
			
					
					if(confirm("출근처리 하시겠습니까?")==false){
						swal("출근처리가 취소되었습니다.");
						return false;
					}else{
					
			  		$.ajax({
						type : "POST",
						 url : "./staffTime",
						data :{
							"name" : name,
							"regdate" : regdate,
							"startTime" : time,
							"lastTime" : '-',
							"store" : store
						},success : function(data){
							swal(regdate+time+"출근처리 완료");
						},error : function(){
							swal("Error");
						}
						
					}); 
					}
				}); 
			 	
		    
		    //직원 퇴근 
			 	$("#eb_staffList").on("click",".eb_lastTime",function(){
			
					var name=$(this).attr("title");
					var regdate='${sysdate}';
					var time=$("#time").text();
					
					if(confirm("퇴근처리하시겠습니까?")==false){
						swal("퇴근 처리가 취소되었습니다.")
						return false;
					}else{
					
			 		$.ajax({
						type : "POST",
						 url : "./staffTimeUpdate",
						data :{
							"name" : name,
							"lastTime" : time,
							"regdate"  : regdate
						},success : function(data){
							alert(regdate+time+"퇴근처리 완료");
							alert(data);
						},error : function(){
							alert("Error");
						}
						
					});
					}
				}); 
			 	
			 	
		    //메뉴
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
			 		var price_amount = $("#eb_amount"+menu).val()*1;
			 		
			 	
			 		 if(num.length==0) {
				 		$(".eb_menuTable").append("<tr class='eb_menuTable_tr"+menu+"'>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th product'><input type='text' class='eb_input' name='product' value="+menu+" readonly='readonly'></td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'><input type='text' name='price' value="+price+" readonly='readonly' class='eb_input'></td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'><input type='text' id='eb_amount"+menu+"' name='salesAmount' value='1' readonly='readonly' class='eb_input'></td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+0+"</td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'><input type='text' id='eb_price"+menu+"' name='productSales' value="+price+" readonly='readonly' class='eb_input'></td></tr>");
				 		$(".eb_menuTable").append("</tr>");
			 		 }else{
				 		$("#eb_amount"+menu).val(price_amount+1);
				 		var price1=price*1*(price_amount+1);
				 	
				 		$("#eb_price"+menu).val(price1);
			 			
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
			 				$("#drink").html(data);
			 			},error : function(){
			 				swal("error");
			 			}
			 		});
			 	});
			 	
			 	$("#eb_bread").click(function(){
			 		
			 		$.ajax({
			 			type : "get",
			 			url : "./posMenu",
			 			data : { "menuKind" : "bread"},
			 			success : function(data){
			 				$("#bread").html(data);
			 			},error : function(){
			 				swal("error");
			 			}
			 		});
			 		
			 	});
			 	
			 	
			 	
			 	$("#drink").on("click",".eb_menu",function(){
			 		var menu=$(this).text();
			 		var price=$(this).attr("title");
			 		var num=document.getElementsByClassName("eb_menuTable_tr"+menu);
			 		var price_amount = $("#eb_amount"+menu).val()*1;
			 		
				 	
			 		 if(num.length==0) {
				 		$(".eb_menuTable").append("<tr class='eb_menuTable_tr"+menu+"'>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th product'><input type='text' class='eb_input' name='product' value="+menu+" readonly='readonly'></td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'><input type='text'  value="+price+" readonly='readonly' class='eb_input'></td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'><input type='text' id='eb_amount"+menu+"' name='salesAmount' readonly='readonly' value='1' class='eb_input'></td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+0+"</td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'><input type='text' id='eb_price"+menu+"' name='productSales' value="+price+" readonly='readonly' class='eb_input'></td></tr>");
				 		$(".eb_menuTable").append("</tr>");
			 		 }else{
				 		$("#eb_amount"+menu).val(price_amount+1);
				 		var price1=price*1*(price_amount+1);
				 	
				 		$("#eb_price"+menu).val(price1);
			 			
			 		 }
			 		 var z = $("#p2").text()*1;
			 		
			 		$("#p2").text(z+price*1);
			 		$("#p4").text(z+price*1);
			 		
			 	});
			 	
			 	$("#bread").on("click",".eb_menu",function(){
			 		var menu=$(this).text();
			 		var price=$(this).attr("title");
			 		var num=document.getElementsByClassName("eb_menuTable_tr"+menu);
			 		var price_amount = $("#eb_amount"+menu).val()*1;
			 		
				 	
			 		 if(num.length==0) {
				 		$(".eb_menuTable").append("<tr class='eb_menuTable_tr"+menu+"'>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th product'><input type='text' class='eb_input' name='product' value="+menu+" readonly='readonly'></td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'><input type='text' name='price' value="+price+" readonly='readonly' class='eb_input'></td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'><input type='text' id='eb_amount"+menu+"' name='salesAmount' readonly='readonly' value='1' class='eb_input'></td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'>"+0+"</td>");
				 		$(".eb_menuTable").append("<td class='eb_menuTable_th'><input type='text' id='eb_price"+menu+"' name='productSales' value="+price+" readonly='readonly' class='eb_input'></td></tr>");
				 		$(".eb_menuTable").append("</tr>");
			 		 }else{
				 		$("#eb_amount"+menu).val(price_amount+1);
				 		var price1=price*1*(price_amount+1);
				 	
				 		$("#eb_price"+menu).val(price1);
			 			
			 		 }
			 		 var z = $("#p2").text()*1;
			 		
			 		$("#p2").text(z+price*1);
			 		$("#p4").text(z+price*1);
			 		
			 	});
			 	
			 	$("#eb_paymentBtn").click(function(){
			 		
			 	
			 		var time=$("#time").text();
			 		var totalPrice=$("#p2").text();
			 		$("#eb_timeSales").val(time);
			 		$("#eb_totalPrice").val(totalPrice);
			 		
			 		if($("#p4").text()==0){
			 			alert("메뉴 선택 먼저 해주세요.");
			 			return false;
			 		}
			 		
			 		if(confirm("결제 하시겠습니까?")==false){
			 			alert("결제가 취소되었습니다.");
			 			return false;
			 		}
			 		
			 		location.reload();
			 	});
			 	
			 	$("#eb_salesList").click(function(){
			 		 var regdate='${sysdate}';
			 		 var store='${member.store}';
			 	
			 		$.ajax({
			 			type :"get",
			 			url : "./storeSalesList",
			 			data : {
			 				"regdate" : regdate,
			 				"store" : store	
			 			},success : function(data){
			 				$("#eb_modal_contents1").html(data);
			 			}
			 		}); 
			 	});
			 	
			 	
			 	
			 	$("#eb_salesList2").click(function(){
			 		var regdate=$("#eb_modal_s").val();
			 		var store='${member.store}';
				 	
			 		$.ajax({
			 			type :"get",
			 			url : "./storeSalesList",
			 			data : {
			 				"regdate" : regdate,
			 				"store" : store	
			 			},success : function(data){
			 				
			 				$("#eb_modal_contents1").html(data);
	
			 			}
			 		}); 
			 	});
			 	
			 	$("#eb_modal_contents1").on("click",".eb_modal_tr",function(){
			 		var num=$(this).attr("title");
			 
			 		$.ajax({
			 			type : "get",
			 			url : "./ListView",
			 			data : { "num" : num},
			 			success : function(data){
			 				$("#eb_modal_contents2").html(data);
			 			}
			 		});
			 	});
			 	
			 	$("#eb_total").click(function(){
			 		var store='${member.store}';
			 		var storeCode='${member.code}';
			 		var regdate='${sysdate}';
			 		
			 		$.ajax({
			 			type : "POST",
			 			url : "./posTotal",
			 			data : {
			 				"store" : store,
			 				"regdate" : regdate,
			 				"storeCode" : storeCode
			 			}, success : function(data){
			 				alert(data);
			 			}
			 		});
			 		
			 	});
			 	
			 	
			 	/* $("#postInsertBtn").click(function(){
			 		
			 		var contents=$("#postITarea").val();
			 		
			 		if(contents==""){
			 			alert("내용을 입력해 주세요.");
			 		}else{
			 			alert("?");
			 			$("#postFrm").submit();
			 		}
			 		
			 	}); */
			 	
				$(".postDel").click(function(){
					var num=$(this).attr("title");
					var store=$("#storeName").val();
					
					$.ajax({
						type : "get",
			 			url : "../postIT/postDelete",
			 			data : { "num" : num,
			 					"store" : store},
			 			success : function(){
			 				swal("삭제 성공");
			 				location.reload();
			 			}
					});
				});		 	
			 	
			 	
			 	/* $("#skin2").click(function(){
			 		var skin=$(this).attr("title");
			 		
			 		alert(skin);
			 		
			 		$(this).style("border", "2px solid #bcbcbc");
			 		
			 	}); */
			 	
			 	
				var count=document.getElementsByClassName('postOne').length;
				
			 	for(var i=0; i<count+1; i++){
			 		var skin=$("#postColor"+(i)).attr("title");
			 		$("#postColor"+i).css("background-color", skin);
			 	}
			 	
			 	
			 	$(".postView").click(function(){
			 		var num=$(this).attr("accesskey");
			 		
			 		$.ajax({
			 			type : "get",
			 			url : "../postIT/postView",
			 			data : { "num" : num},
			 			success : function(data){
			 				$("#postView").html(data);
			 				$("#postView").css("visibility", "visible");
			 				
			 				var postViewSkin=$(".postViewSkin").val();
			 				
			 				$("#postView").css("background-color", postViewSkin);
			 			}
			 		});
			 		
			 	});
			 	
			 	
			 	$("#postView").on("click", "#postCloseBtn", function(){
			 		$("#postView").css("visibility", "hidden");
			 	});
				
			 	
	});
	
	
	function selectPost(index){
 		
 		var size=document.getElementsByClassName('postSkin').length;
 		var color=$("#skin"+index).attr("title");
 		
 		for(var i=0; i<size; i++){
 			if(i==index-1){
 				$("#skin"+(i+1)).css("border", "2px solid #bcbcbc");
 				$("#skinSelect").val(color);
 			}else{
 				$("#skin"+(i+1)).css("border", "2px solid white");
 			}
 		}
 	}
	
</script>
<head>
	<title>Home</title>

</head>
<body>
	<div class="wrap">
	
		<div class="logo">
			<table id="logo_Table">
				<tr> 
					<td><a href="${pageContext.request.contextPath}/srm" id="eb_home"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></a></td> 
					<td>지점 : ${member.store}</td> 
					<td>영업일자 : ${sysdate}</td> 
					<td>지점장 : ${member.name}</td> 
					<td><span id="time"></span></td> 
					<td>
						<input style="font-size: 13px;" type="button" value="출/퇴근" class="btn btn-default" data-toggle="modal" data-target="#myModal" id="eb_staff_time">
					</td>
					<td>
						<input style="font-size: 13px;" type="button" data-toggle="modal" data-target="#postIT" class="btn btn-default" value="포스트잇">
					</td>
				</tr>
				
			</table>
		</div>
		
		<!-- 포스트잇 modal -->
		<div class="modal fade" id="postIT" role="dialog">
			<div class="modal-dialog modal-sm">
			   <div class="modal-content post-content">
			     <div class="modal-header">
			       <button type="button" class="close" data-dismiss="modal">&times;</button>
			     </div>
			     <div class="modal-body post-body">
			        <form action="../postIT/postInsert" id="postFrm" method="post">
			        	<input type="hidden" name="store" value="${member.store}">
			        	<input type="hidden" id="skinSelect" name="skin" value="#ffe1e1">

			        	<div id="skin1" onclick="selectPost(1)" class="postSkin" title="#ffe1e1"></div>
			        	<div id="skin2" onclick="selectPost(2)" class="postSkin" title="#ffffdd"></div>
			        	<div id="skin3" onclick="selectPost(3)" class="postSkin" title="#e6ffe6"></div>
			        	<div id="skin4" onclick="selectPost(4)" class="postSkin" title="#e3e3ff"></div>
			        	<div id="skin5" onclick="selectPost(5)" class="postSkin" title="#ffe1ff"></div>
			        	
				        <textarea id="postITarea" rows="5" name="contents"></textarea>
				        <button style="font-size: 15px;" id="postInsertBtn" type="submit" class="btn btn-outline-secondary">등록</button>
			     	</form>
			     </div>
			     <div class="modal-footer">
			        <button style="font-size: 12px;" type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
			     </div>
			  </div>
			</div>
		</div>
		<!-- 포스트잇 modal 끝-->
		
		
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
		
		   	<form action="./storeSales" method="post">
		<div class="menuWrap1">
		   		<input id="storeName" type="hidden" name="store" value="${member.store}">
		   		<input type="hidden" name="regdate" value="${sysdate}">
		   		<input type="hidden" name="time" id="eb_timeSales">
		   		<input type="hidden" name="totalPrice" id="eb_totalPrice">
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
   			 	<button style="font-size: 17px;, width: 26%;" type="button" class="btn btn-outline-primary b1" id="eb_allCancel">전체<br>취소</button>
   			 	<button style="font-size: 17px;, width: 26%;" type="button" class="btn btn-outline-primary b1">선택<br>취소</button>
    			<button style="font-size: 17px;, width: 26%;" type="button" class="btn btn-outline-primary b1">할인<br>처리</button>
    			<button style="font-size: 17px;, width: 26%;" type="button" class="btn btn-outline-primary b1">수량<br>변경</button>
 			</div>
 			
 			  <div class="btn-group" id="eb_btn-group_2">
   			 	<button style="font-size: 30px;, width: 25%;" type="button" class="btn btn-outline-primary b1">-</button>
   			 	<button style="font-size: 30px;, width: 25%;" type="button" class="btn btn-outline-primary b1">+</button>
    			<button style="font-size: 30px;, width: 25%;" type="button" class="btn btn-outline-primary b1">▲</button>
    			<button style="font-size: 30px;, width: 25%;" type="button" class="btn btn-outline-primary b1">▼</button>
 			</div>  
				
			</div>
			
			<div class="menu4">
				<p style="font-size: 20px;" id="p3">결제 정보</p>
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
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="7" id="eb_7">7</button>
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="4" id="eb_4">4</button>
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="1">1</button>
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="0">0</button>
  				</div>
		       </div>
		       
		       <div class="price_2">
		      	 <div class="btn-group-vertical1">
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="8">8</button>
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="5">5</button>
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="2">2</button>
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="00">00</button>
  				</div>
		       </div>
		       
		       <div class="price_3">
		       	<div class="btn-group-vertical1">
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="9">9</button>
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="6">6</button>
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" value="3">3</button>
    				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b3" id="eb_remove">C</button>
  					</div>
		       </div>
		       
		       <div class="price_4">
		       		<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b4">〈 </button>
		       </div>
		       
		       <div class="price_5">
		    		<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b4" id="eb_enter">Enter </button>
		       </div>
			</div>
			
		
			
		</div>
		
		<div class="menuWrap2">
		  <div class="menu5">
		  
		   <ul class="nav nav-tabs">
    		<li class="active"><a style="font-size: 20px;" data-toggle="tab" href="#coffee" id="eb_coffee">Coffee</a></li>
    		<li><a style="font-size: 20px;" data-toggle="tab" href="#drink" id="eb_drink">Drink</a></li>
    		<li><a style="font-size: 20px;" data-toggle="tab" href="#bread" id="eb_bread">Bread</a></li>
  		</ul>

  			<div class="tab-content">
    			<div id="coffee" class="tab-pane fade in active">
     			 	
      				
      				<c:forEach items="${pos_menu}" var="dto">
      				<div class="eb_menuBox">
      					<p class="eb_menu" title="${dto.price}">${dto.menuName}</p>
      					<p class="eb_menuPrice" >${dto.price}</p>
      				</div>
      					
      				</c:forEach>
      			
    			</div>
    		
    			<div id="drink" class="tab-pane fade">
     			 	
	     			 	
	     			 	
   				
   				 </div>
   				 
    			<div id="bread" class="tab-pane fade">
      				
      			
      			
   			 	</div>
   
  				  
		 	</div>
		 	
		 	<div id="postView">
				<%-- <div id="pin"><img id="pin_img" src="${pageContext.request.contextPath}/resources/images/pos/pin.png"></div>
		 		<div id="postContents">${view.contents}</div> --%>
		 	</div>
		 	
		</div>
		
		
		   <div class="menu6">
		   	
		
		   		
		   		
		   		<div class="menu6_1">
		   			
		   			<input style="font-size: 20px;" type="submit" class="btn btn-outline-primary b4" value="결제" id="eb_paymentBtn">
		   			
		   		</div>
		
		   		
		   		<div class="menu6_234">
		   			<div class="menu6_2">
		   				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b4">영수증 관리</button>
		   			</div>
		   		
		   			<div class="menu6_3">
		   				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b4" id="eb_total">정산</button>
		   			</div> 
		   		
		   			<div class="menu6_4">
		   				<button style="font-size: 20px;" type="button" class="btn btn-outline-primary b4">현금 영수증</button>
		   			</div>
		   		</div>
		   		
		   		 <div class="menu6_5">
		   				<button style="font-size: 20px;" type="button" id="eb_salesList" class="btn btn-outline-primary b4 " data-toggle="modal" data-target="#eb_payment">결제 내역 보기</button>
		   		</div> 
		   
		   </div>
		
		    
		   
		  
		</div>
		</form>
			   
		   <!-- 결제 내역 modal창 -->
		   	<div class="modal fade" id="eb_payment" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content" id="eb_modal_contents">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">결제 내역</h4>
			        </div>
			     
			 
			        <div class="modal-body" id="eb_modal">
			          
			          <input type="date" name="regdate" id="eb_modal_s" style="margin-left: 10px;">
			          <input type="button" value="조회" id="eb_salesList2" class="btn btn-defalut">
			          
			          <div id="eb_modal_contents1">
				     
			          </div>
			          
			          <div id="eb_modal_contents2">
			          
			          </div>
			          
			        </div>
			       
			        
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
					  
 	</div>
 	
 	<div id="postList">
 		<c:forEach items="${postList}" var="post" varStatus="i">
 			<div class="postOne" id="postColor${i.count}" title="${post.skin}"><span class="postDel" title="${post.num}"><i class="fa fa-close"></i></span><br><span accesskey="${post.num}" class="postView">${post.num}번째<br>메모</span></div>
 		</c:forEach>
 	</div>
 	
</body>
</html>
