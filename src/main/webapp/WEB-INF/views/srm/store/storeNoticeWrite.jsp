<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <link href="${url }/resources/css/srm/storeNotice.css" rel="stylesheet">
    <script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>

<title>Insert title here</title>
<script type="text/javascript">

		 
 $(function(){
	 
		 var message = '${message}';
	     if(message != ""){
	    	 swal({
                 title:message,
                 type: "success",
                 showCancelButton: false,
                 confirmButtonClass: "btn-primary",
                 confirmButtonText: "확인",
                 closeOnConfirm: false
               },
               function(){
					location.reload();
               });
	     }
	 
		$(".fw_menu").click(function(){
			var sub = $(this).attr("title");
			
			if($("."+sub).html().trim()=="∧"){
				$("."+sub).html("∨");
			}else{
				$("."+sub).html("∧");
			}
			
		});
		
		
		CKEDITOR.replace('eb_contents');

	 
 });
 
 
 
 
</script>
</head>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 


<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			게시판
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				게시판
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li><a href="${pageContext.request.contextPath}/srm/storeNotice">자유 게시판</a></li>
				</ul>
			</div>
			
	

		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
			<img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png">
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				<div class="eb_contents_text">
				 	<span  id="eb_contents_text_p">자유게시판</span>
				</div> 
				
				
			<form action="./storeNoticeWrite" method="post" id="frm">
				<input type="hidden" name="store" value="${member.store}">
				
				<div class="eb_contents">
					<table border="1" class="eb_writetable">
						<tr>
							<td class="eb_Wtable_td1" style="background-color: black; color: white;">글쓴이</td>
							<td class="eb_Wtable_td"><input type="text" name="write" class="eb_input" value="${member.name}" readonly="readonly"></td>
						</tr>	
						<tr>	
							<td class="eb_Wtable_td1" style="background-color: black; color: white;">제목</td>
							<td class="eb_Wtable_td"><input type="text" name="title" class="eb_input"></td>
						</tr>
						
						<tr>
								<td id="textarea" colspan="2">
										<div class="eb_textarea">
											<textarea id="eb_contents" name="contents" draggable="false"></textarea>
										</div>
									</td>
						
						</tr>
					
					
					</table>
				<input type="submit" value="등록" class="btn btn-default" id="writeBtn">
				
				</div>
				</form>	
				
		</div>
		

	
		
	
	</div>
   </div>


</body>
</html>