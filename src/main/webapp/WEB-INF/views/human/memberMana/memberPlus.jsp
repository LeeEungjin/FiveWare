<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <script type="text/javascript" src="${url}/resources/js/jquery.form.min.js"></script>
 
 <link href="${url}/resources/css/human/memberMana/memberPlus.css" rel="stylesheet">

<title>Insert title here</title>

<script type="text/javascript">

	$(function(){
		
	/* 	$("#f").change(function(){
			alert($(this).val());
		}); */
		
		$("#ar_insertBtn").click(function(){
			
			$.ajax({
				type:"GET",
				url:"../../memberNum",
				success:function(data){
					$("#memberId").val(data);
					
					$.ajax({
						type:"GET",
						url:"./rankList",
						success:function(data){
							var i=0;
							$(data).each(function(){
								$("#memberRank").append("<option value=" + data[i] +">"+data[i]+"</option>");
								i++;
							});
						}
							});
					}
				});
		});
		
		$("#memInsertBtn").click(function(){
			var id=$("#memberId").val();
			var name=$("#memberName").val();
			var birth =$("#memberBirth").val();
			var phone=$("#memberPhone").val();
			var addr=$("#memberAddr").val();
			var email=$("#memberEmail").val();
			var hiredate=$("#memberHiredate").val();
			var temp = $("#memberTemp").val();
			var rank=$("#memberRank").val();
			var sal=$("#memberSal").val();
			var bank=$("#memberBank").val();
			var banknum=$("#memberBankNum").val();
			var vacation=$("#memberVacation").val();
			var month=$("#memberMonth").val();
			var other=$("#ar_memberOther").val();
			
			alert("등록");
			
			if(name==""){
				alert("사원명을 입력하세요.");
			}else if(birth==""){
				alert("생년월일을 입력하세요");
			}else if(phone==""){
				alert("전화번호를 입력하세요");
			}else if(addr==""){
				alert("주소를 입력하세요");
			}else if(email==""){
				alert("이메일을 입력하세요");
			}else if(hiredate==""){
				alert("입사일을 입력하세요");
			}else if(temp==""){
				alert("부서를 입력하세요");
			}else if(rank==""){
				alert("직급을 입력하세요");
			}else if(sal==""){
				alert("월급을 입력하세요");
			}else if(bank==""){
				alert("은행을 입력하세요");
			}else if(banknum==""){
				alert("계좌번호를 입력하세요");
			}else if(vacation==""){
				alert("휴가일수를 입력하세요");
			}else if(month==""){
				alert("월차일수를 입력하세요");
			}else{
				 $(this).attr("data-dismiss", "modal"); 
				memberInsertFrm.submit();
			} 
			
		});
		
		  $("#f").change(function() {
	            var form = $('#frm')[0];
	                var formData = new FormData(form);
	                formData.append("f", $("#f")[0].files[0]);
	                
	                $.ajax({
	                    url: 'file/ajax',
	                            processData: false,
	                            contentType: false,
	                            data: formData,
	                            type: 'POST',
	                            success: function(result){
	                                alert(result);
	                                $("#ar_photo").attr("src", "../../resources/member/"+result);
	                            },error:function(){
	                            	alert("에러");
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
			인사
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∨
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li> <a href="positionPlus">직책 등록 </a></li>
					<li> <a href="salPlus">급여 등록</a> </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub2" title="sub2" >
					사원관리
				<div class="fw_arrow sub2">
					∧
				</div>
			</div>
			
			<div class="fw_subsub collapse in"  id="sub2">
				<ul>
					<li><a href="memberPlus"> 사원 등록</a> </li>
					<li> 급여 등록 </li>
					<li> 퇴직자 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					급여관리
				<div class="fw_arrow sub3" >
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub3">
				<ul>
					<li> 급여 계산 </li>
					<li> 퇴직금 계산 </li>
					<li> 개인별 급여 현황 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
					근태 관리
				<div class="fw_arrow sub4">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub4">
				<ul>
					<li> 근태항목 등록 </li>
					<li> 휴가일수 등록 </li>
					<li> 근태 입력 </li>
					<li> 근태 조회 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub5" title="sub5" >
					조회
			
			</div>
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				mainTitle
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">사원 등록</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
			<form action="positionPlus" method="GET">
				<div class="ar_plusSearch">
					사원명  <input type="text" name="search" id="ar_psearch">
					<input type="submit" value="검색" id="ar_psearchBtn">
				</div>
			</form>
			</div>
			
			<div class="ar_plusDivWrap">
				<div class="ar_titleDiv">
					<div class="ar_memberNum ar_titleDiv1" > 사번	</div>
					<div class="ar_memberName ar_titleDiv1"> 성명 </div>
					<div class="ar_memberDepa ar_titleDiv1"> 부서 </div>
					<div class="ar_memberRank ar_titleDiv1"> 직급 </div>
					<div class="ar_memberBirth ar_titleDiv1"> 생년월일 </div>		
					<div class="ar_memberDate ar_titleDiv1"> 입사일 </div>	
					<div class="ar_memberDiff ar_titleDiv1"> 근속년수 </div>				
					<div class="ar_memberOther ar_titleDiv1"> 비고</div>
				</div>
				
				<c:forEach items="${positionList }" var="list">
					<div class="ar_listDiv">
						<div class="ar_memberNum ar_titleDiv1" > 사번	</div>
						<div class="ar_memberName ar_titleDiv1"> 성명 </div>
						<div class="ar_memberDepa ar_titleDiv1"> 부서 </div>
						<div class="ar_memberRank ar_titleDiv1"> 직급 </div>
						<div class="ar_memberBirth ar_titleDiv1"> 생년월일 </div>		
						<div class="ar_memberDate ar_titleDiv1"> 입사일 </div>	
						<div class="ar_memberDiff ar_titleDiv1"> 근속년수 </div>				
						<div class="ar_memberOther ar_titleDiv1"> 비고</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="ar_plusButtonWrap">
				<input type="button" id="ar_insertBtn" data-toggle="modal" data-target="#ar_memberInsert" value="신규 등록">
			</div>
			
			<!-- Modal -->
				
				<div class="modal fade" id="ar_memberInsert" role="dialog">
					 <form action="./memberInsertact" method="POST"  name="memberInsertFrm">
					    <div class="modal-dialog modal-m">
					      <div class="modal-content">
					      
					      	<!-- modal header -->
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">사원 등록</h4>
					        </div>
					        <!-- modal header 끝-->
					        
					       
					        <!-- modal contents -->
					        <div class="modal-body">
					        
						        <div class="ar_photoInsert" >
						        	<div id="ar_memberPhoto"><img alt="" src="" id="ar_photo"> </div>
						        	<form id="frm">
						        		<input type="file" id="f" name="humanPhoto">
						        	</form>
						        </div>
						        
					         <div class="ar_memberInfo">
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">사원코드</span>
					        		<input type="text" name="id" class="arin_pcodeInput" id="memberId">
					        	</div>
					        	
					       
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">휴대전화</span>
					        		<input type="text" name="phone" class="arin_pcodeInput" id="memberPhone">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">사 원 명</span>
					        		<input type="text" name="name" class="arin_pcodeInput3" id="memberName">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext1">이 메 일</span>
					        		<input type="text" name="email" class="arin_pcodeInput3" id="memberEmail">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">생년월일</span>
					        		<input type="text" name="birth" class="arin_pcodeInput" id="memberBirth">
					        	</div>
					        	
					        	<div class="ar_memberaddr" >
					        		<span class="ar_positiontext">주&nbsp&nbsp&nbsp&nbsp&nbsp소</span>
					        		<input type="text" name="addr" class="arin_pcodeInput2" id="memberAddr">
					        	</div>
					        </div>		
					        
							
					        </div>
					          <div class="modal-body1">
					          		<div class="ar_employee">
					          			
					          	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">입사일</span>
					        		<input type="date" name="hiredate" class="ar_employeeInput" id="memberHiredate">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">부&nbsp&nbsp&nbsp서</span>
					        		<input type="text" name="temp" class="ar_employeeInput" id="memberTemp">
					        	</div>
					        	
					        	<div class="ar_positionInsert2" >
					        		<span class="ar_positiontext">직&nbsp&nbsp&nbsp급</span>
					        		<!-- <input type="text" name="rank" class="ar_employeeInput" id="memberRank">  -->
					        		<select id="memberRank" name="rank">
					        			
					        		</select>
					        	</div>
					          			
					          		</div>
					          		
					          <div class="ar_employee">
					          	
					          	<div class="ar_positionInsert2" >
					        		<span class="ar_positiontext">은행명</span>
					        		<!-- <input type="text" name="bank" class="ar_employeeInput" id="memberBank"> -->
					        		<select id="memberBank" name="bank">
					        				<option value="신한">신한</option>
					        				<option value="국민"> 국민</option>
					        				<option value="농협">농협</option>
					        		</select>
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">계&nbsp&nbsp&nbsp좌</span>
					        		<input type="text" name="banknum" class="ar_employeeInput" id="memberBankNum">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">월&nbsp&nbsp&nbsp급</span>
					        		<input type="text" name="sal" class="ar_employeeInput" id="memberSal">
					        	</div>
					          		
					        </div>
					          </div>
					          
					           <div class="modal-body2">
					           			<div class="ar_positionInsert1" >
					        		<span class="ar_positiontext">휴가일수</span>
					        		<input type="number" name="vacation" class="arin_pcodeInput" id="memberVacation">
					        	</div>
					        	
					       
					        	<div class="ar_positionInsert1" >
					        		<span class="ar_membertext11">월차일수</span>
					        		<input type="number" name="month" class="arin_pcodeInput" id="memberMonth">
					        	</div>
					        	
					        	<div class="ar_positionInsert11" >
					        		<span class="ar_positiontext">비&nbsp&nbsp&nbsp&nbsp고</span>
					        		<textarea rows="" cols="" id="ar_memberOther" name="other" ></textarea>
					        	</div>
					           
					           </div>
					           
					          
					        <!-- modal contents 끝-->
					        
					        <!-- modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default"  id="memInsertBtn">등록</button>
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					        
					      	<!-- modal footer 끝-->
					      </div>
					    </div>
					    </form>
				  </div>
				<!-- Modal 끝 -->
				
				<!-- Modal -->
				
				<div class="modal fade" id="ar_positionUpdate" role="dialog">
					<form action="positionUpdate" method="POST" name="positionFrm2">
					    <div class="modal-dialog modal-m">
					      <div class="modal-content">
					      
					      	<!-- modal header -->
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">직책 수정</h4>
					        </div>
					        <!-- modal header 끝-->
					        
					        <!-- modal contents -->
					        <div class="modal-body">
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">직책코드</span>
					        		<input type="text" name="code" class="arin_pcodeInput1"  id="ppcode" readonly="readonly">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext1">직책명</span>
					        		<input type="text" name="rank" class="arin_pcodeInput" id="ppname" readonly="readonly">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">직책순위</span>
					        		<input type="text" name="ranking" class="arin_pcodeInput" id="ppranking">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
				        		<span class="ar_positiontext">사용여부</span>
				        		<select name="use" class="ar_sselect">
				        			<option value="사용" selected="selected">예</option>
				        			<option value="미사용" >아니오</option>	
				        		</select>
				        	</div>
							
					        </div>
					        <!-- modal contents 끝-->
					        
					        <!-- modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal" id="UpdateBtn">수정</button>
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					      	<!-- modal footer 끝-->
					      </div>
					    </div>
					    </form>
				  </div>
				<!-- Modal 끝 -->
	</div>
</div>

</body>
</html>