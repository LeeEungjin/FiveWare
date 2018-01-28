<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<link href="./resources/css/message.css" rel="stylesheet">
 <script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<script type="text/javascript">
	$(function(){
		
		
		//시간!!!
		 var myVar = setInterval(myTimer, 1000);

		function myTimer() {
		    var d = new Date();
		    $("#eb_Mtime").val(d.toLocaleTimeString());
		
		} 
		
		
		//list
		 $(".eb_M1").click(function(){
			$(".eb_Mall").css("display","none");
			$(".eb_Mlist").css("display","block");
			
			 
			 $.ajax({
					type:"GET",
					url:"./message/messageList",
					success:function(data){
						
						var i=0;
						$(data[0]).each(function(){
							var temp="<div  class='eb_MlistDiv eb_Mclick' id="+i+" title="+data[0][i]+" accesskey='1'>";
							temp=temp+"<div class='eb_MplusImg' id=eb_MplusImg"+i+"></div>";
							temp=temp+"<div class='eb_Mconpany'><i class='fa fa-angle-double-down' style='font-size:24px'></i> "+ data[0][i] +"</div>"; 
							temp=temp+"</div>";
						 	temp=temp+"<div class='eb_MtempMem' id='eb_MtempMem"+i+"'></div>"; 
							
							$(".eb_message2").append(temp);
							
							i++;
						}); 
						
						//안읽은거 부트스트랩!!!!
						alert(data[1]);
						
					}
				});
		}) 
		
		
			//list
			$(".eb_message2").on("click", ".eb_Mclick", function(){
			var temp=$(this).attr("title");
			var img=$(this).attr("id");			
			var access= $(this).attr("accesskey");
			
			access=access*1*-1;
			$("#eb_MtempMem"+img).html("");
			
			if(access == -1){
				$(this).attr("accesskey", access);
				 $("#eb_MplusImg"+img).css("background-position", "-72px 0")
				  $("#eb_MtempMem"+img).css("display", "block !important");
				 $("#eb_MtempMem"+img).slideToggle("slow");
			}else {
				$(this).attr("accesskey", access);
				 $("#eb_MplusImg"+img).css("background-position", "-54px 0");	
				 $("#eb_MtempMem"+img).slideToggle("slow");
			}
			
			$.ajax({
				type:"GET",
				url:"./message/memberList",
				data:{
					"temp":temp
				}, success:function(data){
					
					var i=0;
					$(data).each(function(){
						var tempMem = "<div  accesskey='"+temp+"' class=memname id=mem"+i+" title="+data[i].code+"><i class='fa fa-user-circle-o' style='font-size:30px'; ''></i>"+data[i].name+ data[i].rank +"</div>";
						$("#eb_MtempMem"+img).append(tempMem);
						i++;
					})
				}
			});
			
			
		});
		
		
		
		//보낸쪽지
		 $(".eb_messageBox1").click(function(){

			$(".eb_message2").css("display","none");
			$(".eb_message3").css("display","block");
			$(".eb_message4").css("display","none");
			
			
			
			var sCode='${member.code}';
			$.ajax({
				type : "get",
				url : "./message/sList",
				data : {
					"sCode" : sCode
				},success : function(data){
					$(".eb_message3").html(data);
				}
			})
		}); 

		
		
		 //받은 쪽지
		 $(".eb_messageBox2").click(function(){
			
				$(".eb_message2").css("display","none");
				$(".eb_message3").css("display","none");
				$(".eb_message4").css("display","block");
				
				var rCode='${member.code}';
				$.ajax({
					type : "get",
					url : "./message/rList",
					data : {
						"rCode" : rCode
					},success : function(data){
						$(".eb_message4").html(data);
					}
				})
			}); 
		
		 
		 
		 $(".eb_messageList").click(function(){
			 	$(".eb_message4").css("display","none");
				$(".eb_message3").css("display","none");
				$(".eb_message2").css("display","block");
			}); 
		 $(".eb_Mclose").click(function(){
			 	$(".eb_Mlist").css("display","none");
				$(".eb_Mall").css("display","block");
				 location.reload(); 
		 });
		 

			  CKEDITOR.replace('eb_Mtext'); 
			  
		$(".eb_Mclose2").click(function(){
			$(".eb_MsendForm").css("display","none");
		});  
		
		
		
		$(".eb_message2").on("click",".memname",function(){
			
			var temp=$(this).attr("accesskey");
			var receiveCode=$(this).attr("title");
			var receiveName=$(this).text();

			
			$("#eb_MnameInput").val(receiveName);
			$("#eb_rCode").val(receiveCode);

			
			
			$(".eb_MsendForm").css("display","block");
			
		});
		
		$("#eb_MsendBtn").click(function(){
			var sCode='${member.code}';
			var sName=$("#eb_MnameP2").text();
			var rCode=$("#eb_rCode").val();
			var rName=$("#eb_MnameInput").val();
			var contents=CKEDITOR.instances.eb_Mtext.getData();
			var time=$("#eb_Mtime").val();
	
	
		 	$.ajax({
				type : "POST",
				url : "./message/messageSend",
				data : {
					"sCode" : sCode,
					"sName" : sName,
					"rCode" :rCode,
					"rName" : rName,
					"contents" : contents,
					"time" : time,
					"read" : "읽지않음"
				},success : function(data){ 
					
					$(".eb_MsendForm").css("display","none");
					CKEDITOR.instances.eb_Mtext.setData("");
				
			
				}
			});
			
		
			}); 
		
		$(".eb_Mlist").on("click",".eb_MsList",function(){
			var num=$(this).attr("title");
			
			$.ajax({
				type : "get",
				url : "./message/view",
				data : {
					"num" : num
				},success :function(data){
					
					$(".eb_Mview").css("display","block");
					$("#eb_viewName").text(data.rName);
					$("#eb_viewRegdate").text(data.regdate);
					$("#eb_viewTime").text(data.time);
					$("#eb_MviewText").val(data.contents);
					$("#eb_Mnum").val(data.num);
				}
			})
			
		});
		
		
		
		$(".eb_Mlist").on("click",".eb_MrList",function(){
			var num=$(this).attr("title");
			
			$.ajax({
				type : "get",
				url : "./message/readUpdate",
				data : {
					"num" : num
				},success : function(){
					$("#eb_newImg").css("display","none");
				}
			})
			
			
			$.ajax({
				type : "get",
				url : "./message/view",
				data : {
					"num" : num
				},success :function(data){
					
					$(".eb_Mview").css("display","block");
					$("#eb_viewName").text(data.sName);
					$("#eb_viewRegdate").text(data.regdate);
					$("#eb_viewTime").text(data.time);
					$("#eb_MviewText").val(data.contents);
					$("#eb_MviewCode").val(data.sCode);
					$("#eb_Mnum").val(data.num);
				}
			})
			
		});
		
		
		$(".eb_viewClose").click(function(){
			$(".eb_Mview").css("display","none");
		})
		
		/*답장 */
		$(".eb_MrSendBtn").click(function(){
			
			$(".eb_MsendForm").css("display","block");
			$(".eb_Mview").css("display","none");
			
			var rCode=$("#eb_MviewCode").val();
			var rName=$("#eb_viewName").text();
			alert(rName);
			
			$("#eb_rCode").val(rCode);
			$("#eb_MnameInput").val(rName);
			
		});
		
		$(".eb_MdeleteBtn").click(function(){
			var num=$("#eb_Mnum").val();
			
			
			$.ajax({
				type : "get",
				url : "./message/delete",
				data : {
					"num" : num
				},success : function(data){
					alert(data);
					$(".eb_Mview").css("display","none");
				}
			})
		});
	
	});

		


	

</script>
</head>
<body>
	<div class="w3-card-4 eb_Mlist">
		<div class="eb_message1">
		
			<span class="eb_messageList"><i class="fa fa-address-card-o" style="font-size:25px; color :white; padding-top:5px; padding-left: 10px;"></i></span>
			<span class="eb_messageBox1" style="color : white; margin-left: 10px;">보낸 쪽지함</span>
			<span class="eb_messageBox2" style="color : white; margin-left: 10px;">받은 쪽지함 </span>
			<span class="eb_Mclose"><i class="fa fa-remove" style="font-size:24px; color: white; "></i></span>
		
		</div>
		
		<div class="eb_message2">
			<div class="eb_MmyName">
				<span id="eb_MnameP"><i class="fa fa-user-circle-o" style="font-size:35px; padding-top: 10px;"></i> </span>
				<span id="eb_MnameP2">${member.name}${member.rank} </span>
				 <hr>
			</div>
			
			
		
		</div>
		
		<div class="eb_message3" style="display: none;">
			<p>보낸 쪽지함</p>
		</div>
		
		<div class="eb_message4" style="display: none;">
			받은 쪽지함
			
		</div>
		
		
		</div>
		
		
		<div class="eb_Mall">
		
			<div class="eb_M1">
				<i class="fa fa-hand-o-up" style="font-size:20px" id="eb_Micon"></i>
			</div>
			
			<div class="eb_M2" >
		  		<p id="eb_Mp">Message</p>
		    </div>

</div>


	<div class="w3-card-4 eb_MsendForm" style="display: none;">
		<input type="hidden" id="eb_rCode" name="rCode">
		<input type="hidden" id="eb_Mtime" name="time">
	
		<div class="eb_MsendForm_h">
			<span class="eb_Mclose2"><i class="fa fa-remove" style="font-size:24px; color: white; "></i></span>
		
		</div>
	
		<div class="eb_MsendForm_c">
			<div class="eb_Mblank"></div>
		
			<div id="eb_Mbox1">
			
			<p>받는사람  <input type="text" id="eb_MnameInput" readonly="readonly"></p>
			
			
			</div>
			
			
			<div id="eb_Mbox2">
			
			<textarea id="eb_Mtext" class="eb_Mtext"></textarea>
			
			</div>
		
		</div>
		
		<div class="eb_MsendForm_f">
			<input type="button" value="보내기" id="eb_MsendBtn" >
		</div>
	</div>
	
	<!--view  -->
	<div class="w3-card-4 eb_Mview" style="display: none;">
	 <input type="hidden" id="eb_MviewCode">
	 <input type="hidden" id="eb_Mnum">
		<div class="eb_MsendForm_h">
			<span class="eb_viewClose" id="eb_viewClose"><i class="fa fa-remove" style="font-size:24px; color: white; "></i></span>
		
		</div>
	
		<div class="eb_MsendForm_c">
			<div class="eb_Mblank"></div>
		
			<div id="eb_Mview1">
			
			
			<span id="eb_viewName"></span>
			<span id="eb_viewRegdate"></span>
			<span id="eb_viewTime"></span>
			
			
			</div>
			
			
			<div id="eb_Mview2">
			
			<textarea id="eb_MviewText" readonly="readonly" ></textarea>
			
			</div>
		
		</div>
		
		<div class="eb_MsendForm_f">
			
				<input type="button" value="삭제" class="eb_MdeleteBtn">
				
				<input type="button" value="답장" class="eb_MrSendBtn">
			
			<input type="button" value="확인" class="eb_viewClose">
		</div>
	</div>


</body>
</html>