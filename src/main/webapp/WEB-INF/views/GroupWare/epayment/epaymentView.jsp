<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <!-- Modal content-->
						      <div class="modal-content">
						        <div class="modal-header">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						          <h4 class="modal-title">결재문서</h4>
						        </div>
						        <div class="modal-body"  id="eb_modal" >
						         	<h1 id="ar_docuname">${docuC.kind } 사 유 서</h1>
						         	
						         		<div id="ar_signBoxWrap">
											<div id="ar_signBoxDiv">
													<div id="ar_signText">
														결 <br> 재
													</div>
														<div id="ar_signBoxBasis100">
															<div id="ar_signTemp"> 기 안</div>
															<div id="ar_singMember"><input type=text  readonly=readonly value='${docuC.drafttemp}'><input type=text  readonly=readonly value='${docuC.draftname }'></div>
															<input type=hidden value="${member.code}" name="draftcode">
														</div>
													<!-- for문 돌리기(결재선) -->
													<c:forEach items="${signmember}" var="list" varStatus="i" >
														<div id="ar_signBoxBasis${list.docunum}${i.index}" class="ar_backstamp" title="${list.statenum}">
															<div id="ar_signTemp"> ${list.approvaltemp}</div>
															<div id="ar_singMember"><input type=text  readonly=readonly value='${list.approvalrank}'><input type=text  readonly=readonly value='${list.approvalname}'></div>
															<input type="hidden" value="${list.ranking }" id="${list.approvalcode}"> 
														</div>
													</c:forEach>
											</div>
										</div>
						         	
						         	
						         <table  id="eb_modal_table">
						         
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">문서 번호</td>
						         		<td class="eb_modal_table_td"><span id="eb_viewNum">${docuC.docunum }</span></td>
						         		<td class="eb_modal_table_td_1">기안 날짜</td>
						         		<td class="eb_modal_table_td"><span id="eb_viewDraftdate">${docuC.draftdate}</span></td>
						         	</tr>
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">기안 부서</td>
						         		<td><span id="eb_viewDrafttemp">${docuC.drafttemp }</span></td>
						         		<td class="eb_modal_table_td_1">기안자</td>
						         		<td><span id="eb_viewDraftname">${docuC.draftname }</span></td>
						         		<input type="hidden" value="${docuC.draftcode}" name="approvalcode" id="ar_test">
						         	</tr>
						         	
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">제목</td>
						         		<td colspan="3"><span id="eb_viewTitle">${docuC.title }</span></td>
						         	</tr>
						         
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1" id="eb_modal_tr_id">내용</td>
						         		<td colspan="3"><span id="eb_viewContents">${docuC.contents }</span></td>
						         	</tr>
						         
						         </table>
						         
						         <div id="ar_fileLineWrap">
									<div id="ar_fileWrap">
										<c:forEach items="${file}" var="file" varStatus="i">
											<a href="../../file/arfileDown?filename=${file.filename}&oriname=${file.oriname}">${file.oriname}</a>
											
										</c:forEach>
									</div>
								</div>
								
						         <div id="ar_dateWrap">
						         	<div id="ar_dateDiv">
						         		<p id="ar_dateText"> ${dateresult }</p>
						         		<p id="ar_date">기안자 : ${docuC.draftname } </p>
						         	</div>
						         </div>
						         
						        </div>
						        <div class="modal-footer" id="ar_beforeBtn">
						      <c:if test="${type == 0}">
						        	<input type="button" class="btn btn-default" id="ar_approvalok" title="${docuC.docunum }" value="결재 승인" >
						        	<input type="button" class="btn btn-default" id="ar_approvalno" title="${docuC.docunum }"value="결재 거부" >
						          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						         </c:if>
						         
						         <c:if test="${docuC.state=='임시저장' }">
						         		<input type="button" class="btn btn-default" id="ar_approvalUpdate" title="${docuC.docunum }" value="수정" >
						         		<input type="button" class="btn btn-default" id="ar_approvalDelete" title="${docuC.docunum }" value="삭제" >
						         </c:if>
						        </div>
						        
						        <div class="modal-footer" id="ar_afterBtn">
						          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        </div>
						      </div>