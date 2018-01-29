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
			var photo=$("#ar_photo").attr("src");
			/* alert(photo);
			
			alert("등록"); */
		
			if(photo==""){
				alert("사진을 선택하세요");
			}else if(name==""){
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
	                                $("#ar_photo").attr("src", "../../resources/member/"+result);
	                                $("#ar_filename").val(result);
	                            },error:function(){
	                            	alert("에러");
	                            }
	                    });
	         });
		  
		  $(".ar_memberCode").click(function(){
			  var code = $(this).attr("title");
			  
	 			var retiredate=new Date();
	 			var year=retiredate.getYear()+1900;
	 			var month = retiredate.getMonth()+1;
	 			var day = retiredate.getDate();	 		 	
	 			
	 			 if(month<10){
	 				month="0"+month;
	 			}
	 			 
	 			 if(day<10){
	 				day="0"+day;
	 			}
	 			 
	 			var today=year+"-" + month + "-" + day;
			
/* 	 			alert(today);
 */			  $.ajax({
				 type:"GET",
				 url:"./memberUpdate",
				 data:{
					 "code":code
				 },success:function(data){
					 
					$("#ar_retiredate").val(today);
					 
				     $("#u_memberId").val(data[0].code);
				     $("#u_memberName").val(data[0].name);
				     $("#u_memberPhone").val(data[0].phone);
				     $("#u_memberEmail").val(data[0].email);
				     $("#u_memberBirth").val(data[0].birth);
				     $("#u_memberAddr").val(data[0].addr);
				     $("#u_memberHiredate").val(data[0].hiredate);
				     $("#u_memberTemp").val(data[0].temp);
				     $("#u_memberRank").val(data[0].rank);
				     $("#u_memberBank").val(data[0].bank);
				     $("#u_memberBankNum").val(data[0].banknum);
				     $("#u_memberSal").val(data[0].sal);
				     $("#u_memberVacation").val(data[0].vacation);
				     $("#u_memberMonth").val(data[0].month);
				     $("#u_memberOther").val(data[0].other);
				     
				     $("#ar_uphoto").attr("src", "../../resources/member/"+data[1].filename);
					 $("#ar_ufilename").val(data[1].filename);
					  /* $("#f2").prop("selection", data[1].oriname); */
					 
					 var i=0;
					$(data[2]).each(function(){
						 $("#u_memberRank").append("<option value=" + data[2][i] +">"+data[2][i]+"</option>");
							i++;  
							
					 });
				 }
			  });
		  });
		  
		  $("#f2").change(function() {
	            var form = $('#frm2')[0];
	                var formData = new FormData(form);
	                formData.append("f2", $("#f2")[0].files[0]);
	                
	                $.ajax({
	                    url: 'file/ajax2',
	                            processData: false,
	                            contentType: false,
	                            data: formData,
	                            type: 'POST',
	                            success: function(result){
	                                /* alert(result); */
	                                $("#ar_uphoto").attr("src", "../../resources/member/"+result);
	                                $("#ar_ufilename").val(result);
	                            },error:function(){
	                            	alert("에러");
	                            }
	                    });
	         });
		  
		  $("#memUpdateBtn").click(function(){
				var id=$("#u_memberId").val();
				var name=$("#u_memberName").val();
				var birth =$("#u_memberBirth").val();
				var phone=$("#u_memberPhone").val();
				var addr=$("#u_memberAddr").val();
				var email=$("#u_memberEmail").val();
				var hiredate=$("#u_memberHiredate").val();
				var temp = $("#u_memberTemp").val();
				var rank=$("#u_memberRank").val();
				var sal=$("#u_memberSal").val();
				var bank=$("#u_memberBank").val();
				var banknum=$("#u_memberBankNum").val();
				var vacation=$("#u_memberVacation").val();
				var month=$("#u_memberMonth").val();
				var other=$("#u_memberOther").val();
				
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
					memberUpdateFrm.submit();
				} 
		  });
		  
		  $("#memDeleteBtn").click(function(){
			 	var code=$("#u_memberId").val();
			 	
			 	alert(code);
			 	$.ajax({
			 		type:"POST",
			 		url:"./memberDelete",
			 		data:{
			 			"code":$("#u_memberId").val(),
			 			"retiredate":$("#ar_retiredate").val()
			 		}, success:function(data){
				 			alert("퇴직처리 되었습니다.");
			 			location.reload();
			 		}, error:function() {
			 			alert("error");
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
					<li> <a href="${url }/human/basisInfo/positionPlus">직책 등록 </a></li>
					<li> <a href="${url }/human/basisInfo/salPlus">급여 등록</a> </li>
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
					<li><a href="#"> 사원 등록</a> </li>
					<li> <a href="retireeMana"> 퇴직자 </a></li>
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
					<li><a href="${url}/human/diliMana/diliPlus">  근태항목 등록 </a></li>
					<li><a href="${url}/human/diliMana/diliInput">  근태 입력 </a></li>
					<li><a href="${url}/human/diliMana/diliSearch">  근태 조회</a> </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
			
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub5" title="sub5" >
					블랙리스트
				<div class="fw_arrow sub5">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub5">
				<ul>
					<li><a href="${url}/community/blackList">  블랙리스트 </a></li>
				</ul>
			</div>
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				<div id="event_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">사원 등록</p>
			</div>
			
			<form action="memberPlus" method="GET">
				<div id="erp_jh_event_sub">
					<div id="event_contents">
						<p>　</p>
					사원명  <input type="text" name="search" id="ar_psearch">
					<input type="submit" value="검색" id="ar_psearchBtn">
					<p>　</p>
				</div>
			</div>
			</form>
			
			<div class="ar_plusDivWrap">
				<div class="ar_titleDiv">
					<div class="ar_memberNum ar_titleDiv1" > 사번	</div>
					<div class="ar_memberName ar_titleDiv1"> 성명 </div>
					<div class="ar_memberDepa ar_titleDiv1"> 부서 </div>
					<div class="ar_memberRank ar_titleDiv1"> 직급 </div>
					<div class="ar_memberBirth ar_titleDiv1"> 생년월일 </div>		
					<div class="ar_memberDate ar_titleDiv1"> 입사일 </div>
					<div class="ar_memberKind ar_titleDiv1"> 상태 </div>	
					<div class="ar_memberOther ar_titleDiv1"> 비고</div>
				</div>
				
				<c:forEach items="${memberList }" var="list">
					<div class="ar_listDiv">
						<div class="ar_memberNum ar_titleDiv1 ar_memberCode" data-toggle="modal" data-target="#ar_memberUpdate"  title="${list.code}"> ${list.code}	</div>
						<div class="ar_memberName ar_titleDiv1"> ${list.name} </div>
						<div class="ar_memberDepa ar_titleDiv1"> ${list.temp} </div>
						<div class="ar_memberRank ar_titleDiv1"> ${list.rank} </div>
						<div class="ar_memberBirth ar_titleDiv1"> ${list.birth} </div>		
						<div class="ar_memberDate ar_titleDiv1"> ${list.hiredate} </div>	
						<div class="ar_memberKind ar_titleDiv1"> ${list.kind} </div>	
						<div class="ar_memberOther ar_titleDiv1"> ${list.other}</div>
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
						        		<input type="file" id="f" name="oriname">
						        	</form>
						        	<input type="hidden" id="ar_filename" name="filename">
						        </div>
						        
					         <div class="ar_memberInfo">
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">사원코드</span>
					        		<input type="text" name="code" class="arin_pcodeInput" id="memberId">
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
					        		<textarea rows="" cols="" class="ar_memberOthertext" name="other"  id="ar_memberOther"></textarea>
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
				
				<div class="modal fade" id="ar_memberUpdate" role="dialog">
					 <form action="./memberUpdate" method="POST"  name="memberUpdateFrm">
					    <div class="modal-dialog modal-m">
					      <div class="modal-content">
					      
					      	<!-- modal header -->
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">사원 정보 수정</h4>
					        </div>
					        <!-- modal header 끝-->
					        
					    <div id="retiredate">					        
					        	<input type="date" id="ar_retiredate" name="retiredate">
					        </div> 
					        
					       
					        <!-- modal contents -->
					        <div class="modal-body">
					        
						        <div class="ar_photoInsert" >
						        	<div id="ar_memberPhoto"><img alt="" src="" id="ar_uphoto"> </div>
						        	<form id="frm2">
						        		<input type="file" id="f2" name="oriname"  src="dd">
						        	</form>
						        	<input type="hidden" id="ar_ufilename" name="filename">
						        </div>
						        
					         <div class="ar_memberInfo">
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">사원코드</span>
					        		<input type="text" name="code" class="arin_pcodeInput" id="u_memberId">
					        	</div>
					        	
					       
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">휴대전화</span>
					        		<input type="text" name="phone" class="arin_pcodeInput" id="u_memberPhone">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">사 원 명</span>
					        		<input type="text" name="name" class="arin_pcodeInput3" id="u_memberName">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext1">이 메 일</span>
					        		<input type="text" name="email" class="arin_pcodeInput3" id="u_memberEmail">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">생년월일</span>
					        		<input type="text" name="birth" class="arin_pcodeInput" id="u_memberBirth">
					        	</div>
					        	
					        	<div class="ar_memberaddr" >
					        		<span class="ar_positiontext">주&nbsp&nbsp&nbsp&nbsp&nbsp소</span>
					        		<input type="text" name="addr" class="arin_pcodeInput2" id="u_memberAddr">
					        	</div>
					        </div>		
					        
							
					        </div>
					          <div class="modal-body1">
					          		<div class="ar_employee">
					          			
					          	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">입사일</span>
					        		<input type="date" name="hiredate" class="ar_employeeInput" id="u_memberHiredate">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">부&nbsp&nbsp&nbsp서</span>
					        		<input type="text" name="temp" class="ar_employeeInput" id="u_memberTemp">
					        	</div>
					        	
					        	<div class="ar_positionInsert2" >
					        		<span class="ar_positiontext">직&nbsp&nbsp&nbsp급</span>
					        		<!-- <input type="text" name="rank" class="ar_employeeInput" id="memberRank">  -->
					        		<select id="u_memberRank" name="rank">
					        			
					        		</select>
					        	</div>
					          			
					          		</div>
					          		
					          <div class="ar_employee">
					          	
					          	<div class="ar_positionInsert2" >
					        		<span class="ar_positiontext">은행명</span>
					        		<!-- <input type="text" name="bank" class="ar_employeeInput" id="memberBank"> -->
					        		<select id="u_memberBank" name="bank">
					        				<option value="신한">신한</option>
					        				<option value="국민"> 국민</option>
					        				<option value="농협">농협</option>
					        		</select>
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">계&nbsp&nbsp&nbsp좌</span>
					        		<input type="text" name="banknum" class="ar_employeeInput" id="u_memberBankNum">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">월&nbsp&nbsp&nbsp급</span>
					        		<input type="text" name="sal" class="ar_employeeInput" id="u_memberSal">
					        	</div>
					          		
					        </div>
					          </div>
					          
					           <div class="modal-body2">
					           			<div class="ar_positionInsert1" >
					        		<span class="ar_positiontext">휴가일수</span>
					        		<input type="number" name="vacation" class="arin_pcodeInput" id="u_memberVacation">
					        	</div>
					        	
					       
					        	<div class="ar_positionInsert1" >
					        		<span class="ar_membertext11">월차일수</span>
					        		<input type="number" name="month" class="arin_pcodeInput" id="u_memberMonth">
					        	</div>
					        	
					        	<div class="ar_positionInsert11" >
					        		<span class="ar_positiontext">비&nbsp&nbsp&nbsp&nbsp고</span>
					        		<textarea rows="" cols="" class="ar_memberOthertext" name="other"  id="u_memberOther"></textarea>
					        	</div>
					           
					           </div>
					           
					          
					        <!-- modal contents 끝-->
					        
					        <!-- modal footer -->
					        <div class="modal-footer">
					        	
						          <button type="button" class="btn btn-default"  id="memUpdateBtn">수정</button>
						          <button type="button" class="btn btn-default"  id="memDeleteBtn">퇴직</button>
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