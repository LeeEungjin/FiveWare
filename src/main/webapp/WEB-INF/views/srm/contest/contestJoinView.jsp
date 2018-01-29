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
				        
				        <!-- modal contents -->
				        <form action="contestJoin" method="post" id="contestfrm" name="contestfrm" enctype="multipart/form-data">
				        
				        
				        <div class="modal-body">
							<div class="ar_Viewphoto">
								<img src="../../resources/contest/${one.photo}"> 
							 
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">지점명</span>
							  <input id="ar_store" name="store" type="text" class="form-control" readonly="readonly" value="${one.store }">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴명</span>
							  <input id="ar_menu" name="menuname" type="text" class="form-control" readonly="readonly" value="${one.menuname }">
							</div>
							
							<div class="input-group input-group_modal ar_area" >
							   <div id="area_text"><label class="jh_label" for="comment">레시피</label></div> 
							  <textarea name="recipe" id="ar_recipe" class="form-control form-control_area" readonly="readonly" >${one.recipe }</textarea>
							</div>
							
							<div class="form-group  ar_area">
						      <div id="area_text"><label class="jh_label" for="comment">메뉴설명</label></div> 
						      <textarea id="ar_info" name="account" class="form-control form-control_area"  readonly="readonly">${one.account}</textarea>
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
			</body>
 </html>