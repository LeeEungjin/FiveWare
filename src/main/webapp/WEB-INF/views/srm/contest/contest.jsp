<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
   <script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="${url}/resources/css/srm/contest/contest.css" rel="stylesheet">

<title>Insert title here</title>

<script type="text/javascript">

$(function(){
	CKEDITOR.replace('ar_recipe',{
		width: 600,
		height: 100
	});
	
	CKEDITOR.replace('ar_info',{
		width: 600,
		height: 150
	});
	
	$(".ar_insertBtn").click(function(){
		$("#ar_mphoto").val("");
		$("#ar_menu").val("");
		
		var code=$(this).attr("title");
		
		$("#ar_contestCode").val(code);
		$("#ar_store").val('${member.store}');
	
	});
	
	$(".ar_InsertBtn").click(function(){
		var recipe =CKEDITOR.instances.ar_recipe.getData();
		var info =CKEDITOR.instances.ar_info.getData();
	/* 	var file= $("#ar_mphoto").val();
		var a = file.substring(file.lastIndexOf("."));
		alert(a); */
		if($("#ar_mphoto").val()==""){
			alert("사진을 등록해주십시오.");
		}else if($("#ar_menu").val()==""){
			alert("메뉴명을 입력하세요.");
		}else if(recipe==""){
			alert("레시피를 입력하세요.");
		}else if(info==""){
			alert("메뉴 설명을 입력하세요.");
		}else{
			/* document.contestfrm.submit(); */
			$("#contestfrm").submit();
		}
	});
	
	$(".list").click(function(){
		var curPage = $(this).attr("title");
		
		document.ar_contestPage.curPage.value=curPage;
		document.ar_contestPage.submit();
	});
	
	$(".ar_like").click(function(){
		var ccnum=$(this).attr("title");
		var code=$(this).attr("id");
		var store='${member.store}';
		var state=$("#"+ccnum).attr("class");
		
		alert("state")

	  	$.post("./like", {ccnum:ccnum, code:code, store:store, state:state}, function(data){
			if(data=="like"){
				alert("참여해주셔서 감사합니다.");
				$("#"+ccnum).html("Like &#xf004");
			}
		});  
	});
	
	$(".ar_view").click(function(){
		var cnum = $(this).attr("title");
		
		$.ajax({
			url:"./contestJoinView",
			type:"POST",
			data:{
				"cnum":cnum
			}, success:function(data){
				$("#ar_View_Modal").html(data);
			}
		});
	});
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
			이벤트 & 공모전
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				이벤트
				<div class="fw_arrow sub1">
					∨
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li> 이벤트 현황 </li>
					<li> 이벤트 스케줄 </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu  fw_selected" data-toggle="collapse" data-target="#sub2" title="sub2" >
					공모전
				<div class="fw_arrow sub2">
					∧
				</div>
			</div>
			
			<div class="fw_subsub collapse  in"  id="sub2">
				<ul>
					<li> 공모전 현황 </li>
					<li> 공모전 참가 </li>
				</ul>
			</div>
		

</div>
	<div id="fw_mainwrap">
			<div id="fw_main">
				main Title
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">공모전</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
			
				<div id="ar_contestInfo">
					저희 아린카페에서는 회사의 발전을 위해 끈ㅇ님없이 공모전을 준비하고 있습니다. <br>
					공모전에서 1위 할 시에 성과금, 감사표 등 공모전마다 부상이 준비되어 있습니다.<br>
					각 지점장님들은 마음에 드는 게시글에 좋아요를 눌러주시기 바랍니다.<br>
					회사의 발전을 위하여 지점장님들의 활발한 참여 부탁드립니다.<br>
					감사합니다
				</div>
			</div>
			
			<form action="./contest" name="ar_contestPage">
				<input type="hidden" id="ar_curPage" name="curPage">
			</form>
			
			
				
			 	<c:forEach items="${list }" var="i" >			
			 	
			 	<div class="ar_contestWrap">
					<div class="ar_contestTitle">
						${i.sdate } ~${i.edate}  ${i.name }
					</div>
				<div class="ar_contestTitleBtn">
					<c:if test="${kind=='store' }">
						<input type="button" value="올리기" class="ar_insertBtn" title="${i.code }" data-toggle="modal" data-target="#ar_contest_Modal">
					</c:if>
				</div>	
					<div class="ar_ar_contestMenu">
						<c:forEach items="${list2 }" var="j" varStatus="k">
							<c:if test="${i.code==j.code}">
								<div class="ar_contestJoin">
									<div class="ar_contestPhoto">
										<img class="ar_menuimg" src="${url }/resources/contest/${j.photo}">
									</div>
									<div class="ar_contestContain">
										<p>지점 : ${j.store} </p>
										<p>메뉴명 : ${j.menuname}</p>
										<p>메뉴설명: ${j.account}</p>
									</div>
									
									<div class="ar_contestLike">
										<p class="ar_like" title="${j.cnum}" id="${i.code }">
											<c:if test="${result[k.index].cnum!=j.cnum}">
												<i style="font-size:17px" class="fa" id="${j.cnum}">Like &#xf08a;</i>
											</c:if>
											<c:if test="${result[k.index].cnum==j.cnum}">
												<i style="font-size:17px" class="fa" id="${j.cnum}">Like &#xf004;</i>
											</c:if>
										</p>
										<p class="ar_big" title="${i.code}${j.cnum}"><i style="font-size:17px" class="fa ar_view"  id="${i.code}${j.cnum}" title="${j.cnum }"data-toggle="modal" data-target="#ar_View_Modal">&#xf0b2;</i></p>
									</div>
								</div>							
							</c:if>
						</c:forEach>
					
					</div>
					</div>
				</c:forEach> 
				
						<div id="ar_pageWrap">
					
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
				
			</div>
				
			</div>
			
			<!-- Modal -->
				
				<div class="modal fade" id="ar_contest_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close jh_file_cancel" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">| 공모전 참가</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="contestJoin" method="post" id="contestfrm" name="contestfrm" enctype="multipart/form-data">
				        
				        
				        <div class="modal-body">
				        
				        	<div class="ar_modalTop">
				        		* 등록 시 수정, 삭제가 불가한 점을 참고하여 제출하여 주십시오. <br>
				        		------------------------------------------------<br>
				        	</div>
							
							<div class="input-group input-group_modal">
								<input type="text" name="code" id="ar_contestCode">
							  <span class="input-group-addon">지점명</span>
							  <input id="ar_store" name="store" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴사진</span>
							  <input id="ar_mphoto" name="menuphoto" type="file" class="form-control"  placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴명</span>
							  <input id="ar_menu" name="menuname" type="text" class="form-control"  placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							   <div id="area_text"><label class="jh_label" for="comment">레시피</label></div> 
							  <textarea name="recipe" id="ar_recipe"></textarea>
							</div>
							
							<div class="form-group">
						      <div id="area_text"><label class="jh_label" for="comment">메뉴에 대해 작성해주세요.</label></div> 
						      <textarea id="ar_info" name="account" class="form-control form-control_area" rows="5"></textarea>
						    </div>
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default ar_InsertBtn"  value="올리기">
				          <button type="button" class="btn btn-default" data-dismiss="modal">초기화</button>
				        </div>
				       </form>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->


			<!-- Modal -->
				
				<div class="modal fade" id="ar_View_Modal" role="dialog">
				   
				  </div>
				<!-- Modal 끝 -->

</div>
</body>
</html>