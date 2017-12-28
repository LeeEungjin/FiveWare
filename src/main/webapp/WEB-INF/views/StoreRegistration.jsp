<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <link href="${url }/resources/css/header/storeRegistration.css" rel="stylesheet">
 


<title>Insert title here</title>
<script type="text/javascript">

 $(function(){

		$(".fw_menu").click(function(){
			var sub = $(this).attr("title");
			
			if($("."+sub).html().trim()=="∧"){
				$("."+sub).html("∨");
			}else{
				$("."+sub).html("∧");
			}
			
		});
	 
	 $("input[class=input_all]").click(function(){
			if($("input[class=input_all]").prop("checked")){
				$("input[class=input_chk]").prop("checked",true);
			}else{
				$("input[class=input_chk]").prop("checked",false);
			}
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
			회계
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li> 지점 등록</li>
					<li> 예금 계좌 등록</li>
					<li> 부서 등록</li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					전표 입력
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
				<ul>
					<li> 일반 전표 입력</li>
					<li> 일반 관리비 입력</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
			<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					결산
				
			</div>
			
			
			
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		<div id="fw_main">
				ddddd
		</div>
			
			<div id="contents_wrap">
				 
				<div class="contents_text">
				 	<span class="glyphicon glyphicon-file" id="contents_text_p">지점등록</span>
				</div>
				
				<div id="contents_box">
				
				 <div class="blank"></div>
					
				
					<table id="contents_box_table" >
						
						<tr>
						 <td>지점 분류</td>
						 <td>
							<select>
						   	  	<option>선택</option>
							   	<option>선택</option>
							   	<option>선택</option>
						   	</select>
						  </td>
						  <td>코드</td>
						  <td><input type="text"></td>
						</tr>
						
						<tr>
							<td>지점명</td>
							<td><input type="text"></td>
							<td>대표자 명</td>
							<td><input type="text"></td>
							<td><button class="btn btn-default">search</button></td>
						</tr>
						</table>
				   
				  
				</div> 
				
				<div id="contents_table">
				  	
             				
             		<table class="table table-striped">
						   
						<thead id="table_head">
						    <tr>
						     <th><input type="checkbox" class="input_all"></th>
						     <th>코드</th>
						     <th>지점명</th>
						     <th>대표자 명</th>
						     <th>전화번호</th>
						     <th>담당자</th>
						    </tr>
						 </thead>
						    
						    <tbody>
						    
						    	<c:forEach begin="1" end="10">
							      <tr>
							      	<td><input type="checkbox" class="input_chk"></td>
							        <td>A00001</td>
							        <td>강남점</td>
							        <td>신아린</td>
							        <td>02)123-4567</td>
							        <td>조은비</td>
							      </tr>
							     </c:forEach>
						   </tbody>
					 </table>
					
				
				<div id="page">
					<p>◀ 1 2 3 4 5  ▶</p>
				</div>
						  
						  <button class="btn btn-default">선택삭제</button>
						  
					      <button class="btn btn-default" data-toggle="modal" data-target="#myModal">신규등록</button>
					      
			 
			 <div class="modal fade" id="myModal">
			 
				<div class="modal-dialog">
				
					 <div class="modal-content">
						      
						        <!-- Modal Header -->
						<div class="modal-header">
						
						   <h4 class="modal-title">지점 등록</h4>
						   
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
						       
						        </div>
						        
						        <!-- Modal body -->
				 <div class="modal-body">
				 
					<table id="modal_table">
						<tr>
						   <td>거래처 코드 </td>
						   <td><input type="text"></td>
						   <td>지점명</td>
						   <td><input type="text"></td>
						</tr>
						          	
						<tr>
						   <td>사업자 등록 번호</td>
						   <td><input type="text"></td>
						   <td>대표자</td>
						   <td><input type="text"></td>
						</tr>
						          	
						<tr>
						   <td>주소</td>
						   <td><input type="text"></td>
						   <td>전화번호</td>
						   <td><input type="text"></td>
						</tr>
						          	
						<tr>
						   <td>담당자</td>
						   <td><input type="text"></td>
						   <td>담당자 Email</td>
						   <td><input type="text"></td>
						</tr>
						          	
						<tr>
						   <td>은행</td>
						   <td><input type="text"></td>
						   <td>계좌번호</td>
						   <td><input type="text"></td>
						 </tr>
						          
					</table>
					
				 </div>
						        
						        <!-- Modal footer -->
				<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">등록</button>
				 </div>
						        
					</div>
				</div>
			</div>
		</div>
	</div>
   </div>
</div>

</body>
</html>