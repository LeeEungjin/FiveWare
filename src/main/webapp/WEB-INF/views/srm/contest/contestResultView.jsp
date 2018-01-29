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
    </head>
    <body>
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close jh_file_cancel" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">| 공모전 결과</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="contestJoin" method="post" id="contestfrm" name="contestfrm" enctype="multipart/form-data">
				        
				        
				        <div class="modal-body2">
				        
				        	<div class="ar_resultTop">
				        		${clist.sdate }~${clist.edate } 제 ${clist.num }회 공모전
				        			신제품 개발 
				        	</div>
							
							<div class="ar_contestJoin1">
									<div class="ar_contestPhoto">
										<img class="ar_menuimg" src="../../resources/contest/${one.photo}"> 
									</div>
									<div class="ar_contestContain">
										<p>지점 : ${one.store } </p>
										<p>메뉴명 : ${one.menuname }</p>
										<p>메뉴설명: ${one.account }</p>
									</div>
				        </div>
				        
				        <div class="ar_resultText">
				        	${one.store }점 축하드립니다.
				        	제 ${clist.num }회 공모전에서 당선되신 ${one.store }점에는 부상이
				        	지급될 예정이며, 앞으로도 활발한 활동 부탁드립니다.
				        	감사합니다.
				        	
				        	부상: ${clist.prize }
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				       
				       </form>
				      	<!-- modal footer 끝-->
				      </div>
			</body>
 </html>