<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="${url}/resources/css/GroupWare/epayment/explanatory.css" rel="stylesheet">
  <link href="${url}/resources/css/GroupWare/epayment/explanatory_modal.css" rel="stylesheet">
 <script src="${url }/resources/SE2/js/HuskyEZCreator.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		// SmartEditor
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			//textarea ID
			elPlaceHolder : "ar_tableTextArea",
			/* 주소 바꿀껏  */
			sSkinURI : "../../resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});

		//전송버튼 클릭이벤트
		$("#ar_signAsk").click(
				function() {
					
					var num = document.getElementsByClassName("ar_draftrank").length;
					
					//id가 smarteditor인 textarea에 에디터에서 대입
					editor_object.getById["ar_tableTextArea"].exec(
							"UPDATE_CONTENTS_FIELD", []);

					// 이부분에 에디터 validation 검증

					//폼 submit
					if($("#ar_tableKindSelectBtn").val()==""){
						alert("유형을 선택하세요.");
					}else if($("#ar_docuTitle").val()==""){
						alert("제목을 입력하세요.");
					}else if($("#ar_tableTextArea").val()==""){
						alert("사유내용을 입력하세요.");
					}else if(num==0){
						alert("결재선을 선택하세요.");
					}else{
						var state=$("#ar_signAsk").attr("title");
						alert(state);
						 $("#frm").attr("action", "./epaymentInsert?state="+state);
						$("#frm").submit();
					}
					
				});
		
		$(".ar_storage").click(function(){
			var num = document.getElementsByClassName("ar_draftrank").length;
				//id가 smarteditor인 textarea에 에디터에서 대입
				editor_object.getById["ar_tableTextArea"].exec(
						"UPDATE_CONTENTS_FIELD", []);

				// 이부분에 에디터 validation 검증

				//폼 submit
				if(num==0){
					alert("결재선을 선택하세요.");
				}else{
					var state=$(this).val();
					alert(state);
					$("#frm").attr("action", "./epaymentInsert?state="+state);
					$("#frm").submit();
					
				}
					
				
		});
		
		$("#ar_signLine").click(function(){
			 $("#ar_tempWrap").html(""); 
			 
			$.ajax({
				type:"GET",
				url:"./signData",
				success:function(data){
					var i=0;
					$(data[0]).each(function(){
						var tempLine="<div class='ar_tempLineDiv ar_click' id="+i+" title="+data[0][i]+" accesskey='1'>";
						tempLine=tempLine+"<div class='ar_plusImg' id=ar_plusImg"+i+"></div>";
						tempLine=tempLine+"<div class='ar_conpany'>"+ data[0][i] +"</div>";
						tempLine=tempLine+"</div>";
						tempLine=tempLine+"<div class='ar_tempMem' id='ar_tempMem"+i+"'></div>";
						
						$("#ar_tempWrap").append(tempLine);
						
						i++;
					});
				}
			});
		});
		
		$("#ar_tempWrap").on("click", ".ar_click", function(){
			var temp=$(this).attr("title");
			var img=$(this).attr("id");			
			var access= $(this).attr("accesskey");
			
			access=access*1*-1;
			$("#ar_tempMem"+img).html("");
			
			if(access == -1){
				$(this).attr("accesskey", access);
				 $("#ar_plusImg"+img).css("background-position", "-72px 0")
				  $("#ar_tempMem"+img).css("display", "block !important");
				 $("#ar_tempMem"+img).slideToggle("slow");
			}else {
				$(this).attr("accesskey", access);
				 $("#ar_plusImg"+img).css("background-position", "-54px 0");	
				 $("#ar_tempMem"+img).slideToggle("slow");
			}
			
			$.ajax({
				type:"GET",
				url:"./tempMember",
				data:{
					"temp":temp
				}, success:function(data){
					
					var i=0;
					$(data).each(function(){
						var tempMem = "<p class=memname id=mem"+i+" title="+data[i].code+">"+data[i].name+data[i].rank +"</p>";
						$("#ar_tempMem"+img).append(tempMem);
						i++;
					})
				}
			});
			
			
		});
		
		
		
			
		$("#ar_tempWrap").on("dblclick", ".memname", function(){
			var code = $(this).attr("title");
			
			tableInsert(code);
					
		});

		$("#ar_signformat").click(function(){
			$(".tableLines").html("");
		});
		
		
		var code="";
		
		 $("#ar_tempWrap").on("click", ".memname", function(){
			
			$("#ar_tempWrap .memname").css("font-weight", "normal");
			$(this).css("font-weight", "bold");
			
			code=$(this).attr("title");
		}); 
		 
		 $("#ar_signok").click(function(){
			 tableInsert(code);
			 $("#ar_tempWrap .memname").css("font-weight", "normal");
		 });
		 
		 var code1="";
		 $("#ar_resultTable").on("click", ".tableLines", function(){
			$("#ar_resultTable .tableLines").css("background-color", "");
			$(this).css("background-color", "red"); 
			
			code1 = $(this).attr("id");
			alert(code1);
		 });
		 
		 //////////////////////////////////////
		 function test(){
			 var tablel=document.getElementsByClassName("ar_resultA");
			 for(var i=0; i<tablel.length; i++){
				 tablel[i].innerHTML="";
				 
			 }
			 
			 tablel[tablel.length-1].innerHTML="최종";
		 }
		 ///////////////////////////////////
		 
		 $("#ar_signdelete").click(function(){
			 
			$("#"+code1).html(""); 
			
			test();
		 });
		
		//SmartEditorend
		var count1 =0;
			$("#ar_tempDiv").click(function(){
				count1++;				
				 $("#ar_tempWrap").slideToggle("slow");
				 
				if(count1%2==0){
					 $(this).css("background-position", "-72px 0");					
				}else{
					 $(this).css("background-position", "-54px 0");
				}
		 });
			
			$("#ar_signInsertBtn").click(function(){
				var num=document.getElementsByClassName("ar_resultA");
				var mem = document.getElementsByClassName("ar_dataname");
				var rank = document.getElementsByClassName("ar_datarank");
				var temp = document.getElementsByClassName("ar_datatemp");
				var code = document.getElementsByClassName("ar_tablecode1");
				
				if(num.length==0){
					alert("결재선을 선택하세요.");
					$("#ar_signInsertBtn").attr("data-dismiss", "");
				}else{
					$("#ar_signBoxDiv").html("");
					
					var sign="<div id='ar_signText'>";
					sign=sign+"결 <br> 재";
					sign=sign+"</div>";
					sign=sign+"<div id='ar_signBoxBasis'>";
					sign=sign + "<div id='ar_signTemp'> 기 안</div>";
					sign = sign+"<div id='ar_singMember'><input type=text readonly=readonly value='${member.temp}'><input type=text name=draftrank class=ar_draftrank readonly=readonly value='${member.rank }'><input type=text readonly=readonly value='${member.name }'></div>";
					sign= sign+"<input type=hidden value='${member.code}' name='draftcode'>";
					sign= sign+"</div>";
					
					$("#ar_signBoxDiv").append(sign);
					
					for(var i=0; i<num.length; i++){
						sign= "<div id='ar_signBoxBasis'>";
						
						sign= sign+"<div id='ar_signTemp'><input type=text name=approvaltemp readonly=readonly value="+temp[i].value+"></div>";
						sign= sign+"<div id='ar_singMember'><input type=text name=approvalrank readonly=readonly value="+rank[i].value+"><input type=text name=approvalname readonly=readonly value="+mem[i].value+"></div>";
						sign= sign+"<input type=hidden value="+code[i].value+" name=approvalcode>";
						sign= sign+"</div>";
						
						$("#ar_signBoxDiv").append(sign);
					}					
					
					$("#ar_signInsertBtn").attr("data-dismiss", "modal");
				}
				
			});
	});
	
		var i =0;
	function tableInsert(code){
		$.ajax({
			type:"GET",
			url:"./memberSelect",
			data:{
				"code":code
			}, success:function(data){
				
					var boo = true;
				$(".ar_resultA").each(function(){
					
					if(data.code==$(this).attr("title")){
						alert("이미 결재선에 등록되어있습니다.");
						boo=false;
					}
				});
				
				if(boo){
					$("#ar_resultTable .ar_resultA").html("");
					var tr = "<tr class='tableLines' id="+data.code+" accesskey="+i+">";
					tr = tr +"<input type=hidden class=ar_tablecode1 value="+data.code+">";
					tr = tr + "<td id='ar_tableBlank"+i+"'title="+data.code+" class='ar_tabletds ar_resultA' accesskey="+i+" >최종</td>";
					tr = tr + "<td id='ar_tabletd2' class='ar_tabletds'>결재</td>";
					tr = tr + "<td id='ar_tabletd3' class='ar_tabletds'>"+"<input type=text readonly=readonly class=ar_dataname value="+data.name+"> <input type=text  readonly=readonly class=ar_datarank value="+ data.rank+"> 기안 <input type=text readonly=readonly class=ar_datatemp value="+data.temp+"></td>"
					tr = tr + "</tr>";
					
					$("#ar_resultTableBody").append(tr);
					i++;					
				}
				
		}
		});
	}
	
	

</script>
</head>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import>  

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
			<!-- submenu banner -->
		<div id="fw_subbanner">
			전자결재
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				결재함
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li> 미결함 </li>
					<li> 기결함 </li>
					<li> 반려함 </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					발신함
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
				<ul>
					<li> 기안 상신함</li>
					<li> 임시보관함</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					수신함
				<div class="fw_arrow sub3" >
					
				</div>
			</div>
			
		
</div>
	
<div id="fw_mainwrap">
			<div id="fw_main">
				기안문 작성
			</div>
			
	<div id="ar_explantBtnWrap">
		<div id="ar_explantBtn">
			<input type="button" value="결재선" class="ar_btnStyle" id="ar_signLine1">
			<input type="button" value="결재요청" class="ar_btnStyle" id="ar_signAsk" title="미결" >
			<input type="button" value="취소" class="ar_btnStyle1" id="ar_signCen">
		</div>
	</div>
	
	<div id="ar_explanTitle">
		사유서
	</div>
	
<form id="frm" action="./epaymentInsert" method="POST">
	<div id="ar_signBoxWrap">
		<div id="ar_signBoxDiv">
				<div id="ar_signText">
					결 <br> 재
				</div>
					<div id="ar_signBoxBasis">
						<div id="ar_signTemp"> 기 안</div>
						<div id="ar_singMember"><input type=text  readonly=readonly value='${member.temp}'><input type=text  readonly=readonly value='${member.name }'></div>
						<input type=hidden value="${member.code}" name="draftcode">
					</div>
				<!-- for문 돌리기(결재선) -->
				
		</div>
	</div>
	
	<div id="ar_signTableWrap">
		<table id="ar_signTable" border="1px">
			<tr>
				<td class="ar_tableTitle">문서번호</td>
				<td class="ar_tableInput"><input type="text"  class="ar_draftInput" value="${docunum }" name="docunum" readonly="readonly" ></td>
				<td class="ar_tableTitle">기안일자</td>
				<td class="ar_tableInput" ><input type ="text"  name="draftdate" class="ar_draftInput" readonly="readonly" value="${sysdate }"></td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">기안자</td>
				<td class="ar_tableInput"><input type="text"  name="draftname" class="ar_draftInput" readonly="readonly" value="${member.name }"></td>
				<td class="ar_tableTitle">기안부서</td>
				<td class="ar_tableInput"> <input type="text"  name="drafttemp" class="ar_draftInput" readonly="readonly" value="${member.temp }"></td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">유형</td>
				<td colspan="3" class="ar_tableInput">
				<select name="kind" id="ar_tableKindSelectBtn">
					<option value=""></option>
					<option value="지각">지각</option>
					<option value="조퇴">조퇴</option>
					<option value="결근">결근</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">문서제목</td>
				<td colspan="3" class="ar_tableInput"><input type="text" id="ar_docuTitle" name="title"></td>
			</tr>
			
			<tr>
				<td colspan="4" class="ar_tableInput" ><textarea rows="" cols="" id="ar_tableTextArea" name="contents" placeholder="육하원칙으로 작성하세요."></textarea> </td>
			</tr>
			
			
		</table>
	</div>
	
	<div id="ar_explantBtnWrap">
		<div id="ar_explantBtn">
			<input type="button" value="결재선" class="ar_btnStyle" id="ar_signLine" data-toggle="modal" data-target="#ar_positionInsert" >
			<input type="button" value="결재요청" class="ar_btnStyle" id="ar_signAsk" title="미결" >
			<input type="button" value="취소" class="ar_btnStyle1" id="ar_sign2">
		</div>
	</div>
	
	</form>
	
</div>
	<c:import url="./explanatory_modal.jsp"></c:import>
</div>

</body>
</html>