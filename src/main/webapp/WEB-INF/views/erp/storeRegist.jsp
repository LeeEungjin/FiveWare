<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <link href="${url }/resources/css/erp/storeRegist.css" rel="stylesheet">
 


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
			
			<div id="eb_fw_main_1"></div>
			
			<div id="eb_fw_main_2">
				<table id="eb_fw_main_2_table">
					<tr >
						<td class="eb_row">회계</td>
						<td class="eb_row">예산</td>
						<td class="eb_row">영업/구매</td>
						<td class="eb_row">인사</td>
					</tr>
				</table>
			</div>
				
				
		</div>
			
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">지점등록</span>
				</div>
				
				<div id="eb_contents_box">
				
				 <div class="eb_blank"></div>
					
				
					<table id="eb_contents_box_table" >
						
						<tr>
						  <td>코드</td>
						  <td><input type="text"></td>
						  <td>대표자 명</td>
						  <td><input type="text"></td>
						</tr>
						
						<tr>
							<td>지점명</td>
							<td><input type="text"></td>
							<td><button class="btn btn-default">search</button></td>
						</tr>
						</table>
				   
				  
				</div> 
				
				<div id="eb_contents_table">
				  	
             				
             		<table class="table table-striped">
						   
						<thead id="eb_table_head">
						    <tr>
						     <th><input type="checkbox" class="input_all"></th>
						     <th>코드</th>
						     <th>지점명</th>
						     <th>주소</th>
						     <th>전화번호</th>
						     <th>영업시간</th>	     
						    </tr>
						 </thead>
						    
						    <tbody>
						    
						    	<c:forEach items="${list}" var="dto">
							      <tr>
							        <td><input type="checkbox" class="input_chk"></td>
							      	<td>${dto.code}</td>
							        <td>${dto.store}</td>					
							        <td>${dto.addr}</td>
							        <td>${dto.tel}</td>								      
							        <td>${dto.time}</td>							      			   
							     </tr>
							     </c:forEach>
						   </tbody>
					 </table>
					
				
				<div id="eb_page">
				
					<p>◀ 1 2 3 4 5  ▶</p>
				</div>
						  
						  <button class="btn btn-default">선택삭제</button>
						  
					      <button class="btn btn-default" data-toggle="modal" data-target="#myModal">신규등록</button>
					      
			 
			 
		<form action="storeRegistWrite" method="post">	 
			 <div class="modal fade" id="myModal">
			 
				<div class="modal-dialog">
				
					 <div class="modal-content">
						      
						        <!-- Modal Header -->
						<div class="modal-header">
						
						   <h4 class="modal-title"> | 지점 등록</h4>
						   
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
						       
						        </div>
						        
						        <!-- Modal body -->
				 <div class="modal-body">
				 
					<table id="eb_modal_table">
						<tr>
						   <td>지점명 코드</td>
						   <td><input type="text" name="code">
						   		<button class="btn btn-default">중복확인</button></td>
						   <td>지점명</td>
						   <td><input type="text" name="store"></td>
						   
						</tr>
						
						<tr>
						   <td>대표자</td>
						   <td><input type="text" name="name"></td>
						   <td>사업자 등록 번호</td>
						   <td><input type="text" name="storeNum"></td>
						   
						</tr>
						          	
						<tr>
						   <td>주소</td>
						   <td><input type="text" name="addr"></td>
						   <td>영업시간</td>
						   <td><input type="text" name="time"></td>
						 
						</tr>
						          	
						<tr>
						   <td>전화번호</td>
						   <td><input type="text" name="tel"></td> 
						   <td>E-mail</td>
						   <td><input type="text" name="email"></td>
						</tr>
						          	
						<tr>
						   <td>은행</td>
						   <td><input type="text" name="bank"></td>
						   <td>계좌번호</td>
						   <td><input type="text" name="account"></td>
						 </tr>
						          
					</table>
					
				 </div>
						        
						        <!-- Modal footer -->
				<div class="modal-footer">
						<input type="submit" value="등록">
				 </div>
						        
					</div>
				</div>
			</div>
		</form>
		</div>
	</div>
   </div>
</div>

</body>
</html>