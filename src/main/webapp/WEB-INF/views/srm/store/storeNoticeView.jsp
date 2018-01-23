<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link href="${url }/resources/css/srm/storeNotice.css" rel="stylesheet">

<title>Insert title here</title>
<script type="text/javascript">

		 
 $(function(){
	 
		 var message = '${message}';
	     if(message != ""){
	        alert(message);
	     }
	 
		$(".fw_menu").click(function(){
			var sub = $(this).attr("title");
			
			if($("."+sub).html().trim()=="∧"){
				$("."+sub).html("∨");
			}else{
				$("."+sub).html("∧");
			}
			
		});
		
		/*page 처리  */
		  $(".eb_list").click(function(){
				
				var cur=$(this).attr("title");
				var s = '${pager.search}';
				var t = '${pager.kind}';
				document.frm.curPage.value=cur;
				document.frm.search.value=s;
				document.frm.kind.value=t;
				document.frm.submit();
			});
	 
			var num=${view.num};
			
			$.ajax({
			 	type: "get",
				url : "./storeNoticeReplyView",
				data :  {"num" : num},
				success : function(data){
				
					$("#eb_replyBox2").html(data);
					
				}
			});
			
			$("#eb_replyBtn").click(function(){
				var store='${member.store}';
				var write='${member.name}';
				var title="-";
				var contents=$("#eb_replyText").val();

			 	$.ajax({
					type : "post",
					url : "./storeReply",
					data : {
						"num" : num,
						"store" : store,
						"write" : write,
						"title" : title,
						"contents" : contents
					},success : function(data){
						location.reload();
						$("#eb_replyBox2").html(data);
					}
				});
					
			});
			
		
			
	 
 });
 
 
 
 
</script>
</head>
<body>
<c:import url="${url}/resources/temp/headerExample_srm.jsp"></c:import> 


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
			
			<div id="eb_fw_main_1"></div>
			
			<div id="eb_fw_main_2">
				<table id="eb_fw_main_2_table">
					<tr >
						<td class="eb_row">전체 지점 정보</td>
						<td class="eb_row">우리 매장 관리</td>
						<td class="eb_row">이벤트</td>
						<td class="eb_row">공지사항</td>
					</tr>
				</table>
			</div>
				
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">자유게시판</span>
				</div>
			
				
				
				<div id="eb_contents_table">
				  	
             				
             		<table id="eb_viewTable" >
						   <tr>
						   	<td colspan="4" class="eb_tableTitle"> ${view.title }</td>
						   
						   </tr>
			
						
						    <tr>
						     <td class="eb_Wtable_td2">지점명 : ${view.store}</td>
						 
						     <td class="eb_Wtable_td2">글쓴이 : ${view.write}</td>
								   
						     <td class="eb_Wtable_td2">날짜 : ${view.regdate}</td>
					
						     <td class="eb_Wtable_td2">조회수 : ${view.hit} </td>
				   
						    </tr>
					
						    <tr>
						    	<td colspan="4" id="eb_td">${view.contents}</td>
						    </tr>
						    
						
					 </table>
		</div>
			
		<c:if test="${member.store eq view.store}">
			<a href="./storeNoticeDelete?num=${view.num}"><input type="button" value="삭제"  class="w3-button w3-black" ></a>
			<a href="./storeNoticeUpdate?num=${view.num}"><input type="button" value="수정"  class="w3-button w3-black" ></a>
		</c:if>	
			<div id="eb_replyBox">
		
			
				<textarea id="eb_replyText"></textarea>
				<input type="button" value="등록"  class="w3-button w3-black" id="eb_replyBtn">
		
			</div>
			
			<div id="eb_replyBox2">
				
			</div>
			
	
		
		
		
				
	
		
		
	
		
		
	</div>
   </div>
</div>

</body>
</html>