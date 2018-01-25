<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="./resources/css/message.css" rel="stylesheet">
 <script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<script type="text/javascript">
	$(function(){
		
		
		//시간!!!
		/* var myVar = setInterval(myTimer, 1000);

		function myTimer() {
		    var d = new Date();
		    $("#time").text(d.toLocaleTimeString());
		
		} */
		
		
		 $(".eb_M1").click(function(){
			$(".eb_Mall").css("display","none");
			$(".eb_Mlist").css("display","block");
			
			 
			 $.ajax({
					type:"GET",
					url:"./message/messageList",
					success:function(data){
						
				 		
						var i=0;
						$(data[0]).each(function(){
							var temp="<hr><div  class='eb_MlistDiv eb_Mclick' id="+i+" title="+data[0][i]+" accesskey='1'>";
							temp=temp+"<div class='eb_MplusImg' id=eb_MplusImg"+i+"></div>";
							temp=temp+"<div class='eb_Mconpany'><i class='fa fa-angle-double-down' style='font-size:24px'></i> "+ data[0][i] +"</div>"; 
							temp=temp+"</div>";
						 	temp=temp+"<hr><div class='eb_MtempMem' id='eb_MtempMem"+i+"'></div>"; 
							
							$(".eb_message2").append(temp);
							
							i++;
						}); 
					}
				});
		}) 
		
		
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
						var tempMem = "<div  accesskey='"+temp+"' class=memname id=mem"+i+" title="+data[i].code+"><i class='fa fa-user-circle-o' style='font-size:30px'; ''></i> "+data[i].name+ data[i].rank +"</div>";
						$("#eb_MtempMem"+img).append(tempMem);
						i++;
					})
				}
			});
			
			
		});
		
		
		
		 $(".eb_messageBox1").click(function(){
			$(".eb_message2").css("display","none");
			$(".eb_message3").css("display","block");
			$(".eb_message4").css("display","none");
		}); 
		 
		 $(".eb_messageBox2").click(function(){
				$(".eb_message2").css("display","none");
				$(".eb_message3").css("display","none");
				$(".eb_message4").css("display","block");
			}); 
		
		 $(".eb_messageList").click(function(){
			 	$(".eb_message4").css("display","none");
				$(".eb_message3").css("display","none");
				$(".eb_message2").css("display","block");
			}); 
		 $(".eb_Mclose").click(function(){
			 	$(".eb_Mlist").css("display","none");
				$(".eb_Mall").css("display","block");
				/* location.reload(); */
		 });
		 

			  CKEDITOR.replace('eb_Mtext'); 
			  
		$(".eb_Mclose2").click(function(){
			$(".eb_MsendForm").css("display","none");
		});  
		
		
		
		$(".eb_message2").on("click",".memname",function(){
			
			var temp=$(this).attr("accesskey");
			var receiveCode=$(this).attr("title");
			var receiveName=$(this).text();
			var sendCode='${member.code}'
			var sendName='${member.name}'
			$("#eb_MnameInput").val(receiveName);
			
			$(".eb_MsendForm").css("display","block");
		});
		 
	});
	

</script>
</head>
<body>
	<div class="w3-card-4 eb_Mlist">
		<div class="eb_message1">
		
			<span class="eb_messageList"><i class="fa fa-address-card-o" style="font-size:25px; color :white; padding-top:5px; padding-left: 10px;"></i></span>
			<span class="eb_messageBox1"><i class="fa fa-paper-plane" style="font-size:25px; color: white;"></i></span>
			<span class="eb_messageBox2"><i class="fa fa-envelope" style="font-size:24px; color: white;"></i></span>
			<span class="eb_Mclose"><i class="fa fa-remove" style="font-size:24px; color: white; "></i></span>
		
		</div>
		
		<div class="eb_message2">
			<div class="eb_MmyName">
				<span id="eb_MnameP"><i class="fa fa-user-circle-o" style="font-size:35px; padding-top: 10px;"></i> </span>
				<span id="eb_MnameP2">${member.temp} | ${member.name} ${member.rank} </span>
				 <hr>
			</div>
			
			
		
		</div>
		
		<div class="eb_message3" style="display: none;">
			보낸 쪽지함
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
		<div class="eb_MsendForm_h">
			<span class="eb_Mclose2"><i class="fa fa-remove" style="font-size:24px; color: white; "></i></span>
		
		</div>
	
		<div class="eb_MsendForm_c">
			<div class="eb_Mblank"></div>
		
			<div id="eb_Mbox1">
			
			<p>받는사람  <input type="text" id="eb_MnameInput" readonly="readonly"></p>
			
			</div>
			
			
			<div id="eb_Mbox2">
			
			<textarea id="eb_Mtext"></textarea>
			
			</div>
		
		</div>
		
		<div class="eb_MsendForm_f">
			<input type="button" value="보내기" id="eb_MsendBtn" >
		</div>
	</div>

</body>
</html>