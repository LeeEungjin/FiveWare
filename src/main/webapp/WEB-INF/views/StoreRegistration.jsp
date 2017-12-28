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
			subTitle
		</div>
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				ddddd
			</div>
			
			<div id="contents_wrap">
				 <div class="contents_text">
				   <span id="contents_text_p">지점 등록</span>
				</div>
				
				<div id="contents_box">
				
					<table id="contents_box_table" border="1" >
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
						        <td>조은비</td>
						        <td>02)123-4567</td>
						        <td>신아린</td>
						      </tr>
						      </c:forEach>
						    </tbody>
						  </table>
					
				<div id="page">
					<p>◀ 1 2 3 4 5  ▶</p>
				</div>
						  <button class="btn btn-default">선택삭제</button>
					
					</div>
					

				</div>
			
			
	</div>
</div>

</body>
</html>