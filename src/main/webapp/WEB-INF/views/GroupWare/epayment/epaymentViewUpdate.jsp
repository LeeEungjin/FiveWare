<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <!-- Modal content-->
				
						         	
						         	<form action="./epaymentUpdate" name="UpdateFrm" id="Updatefrm"method="POST">
						         <table  id="eb_modal_table">
						         
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">문서 번호</td>
						         		<td class="eb_modal_table_td"><span id="eb_viewNum"><input type="text" value=" ${docuC.docunum }"  readonly="readonly"  name="docunum"></span></td>
						         		<td class="eb_modal_table_td_1">기안 날짜</td>
						         		<td class="eb_modal_table_td"><span id="eb_viewDraftdate">${docuC.draftdate}</span></td>
						         	</tr>
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">기안 부서</td>
						         		<td><span id="eb_viewDrafttemp">${docuC.drafttemp }</span></td>
						         		<td class="eb_modal_table_td_1">기안자</td>
						         		<td><span id="eb_viewDraftname">${docuC.draftname }</span></td>
						         	</tr>
						         	
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">제목</td>
						         		<td colspan="3"><input type="text" value=" ${docuC.title }" name="title" id="ar_uptitle"></td>
						         	</tr>
						         
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1" id="eb_modal_tr_id">내용</td>
						         		<td colspan="3"><textarea rows="" cols="" name="contents" id="ar_tableTextArea1" > ${docuC.contents }</textarea></td>
						         	</tr>
						         
						        <tr>
						        	<td colspan="4"> * 임시저장 후 결재요청 시 결재선과 파일을 변경할 수 없습니다.</td>
						              
						         </tr>
						         </table>
						        </form>
						      	
						          
						 