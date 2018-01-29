<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="modal-dialog modal-lg">
	<div class="modal-content">
				      
	<!-- modal header -->
	<div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	     <h4 class="modal-title">|자재 관리</h4>
				        </div>
	<!-- modal header 끝-->
				        
	<!-- modal contents -->
	<form action="./orderUpdate" method="post" id="or_write_frm">
	    <div class="modal-body">
	       	<div class="input-group input-group_modal or_input-group_modal">
			  	<span class="input-group-addon">입고코드</span>
			  	<input value="${materDTO.materCode}" type="text" class="form-control viewCode" readonly="readonly">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
			  	<span class="input-group-addon">계약일자</span>
				<input value="${materDTO.materDate}" type="date" class="form-control viewContractDate">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
				<span class="input-group-addon">부서</span>
				<input value="${materDTO.temp}" id="temp" name="temp" type="text" class="form-control viewTemp">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
				<span class="input-group-addon">작성자</span>
				<input value="${materDTO.name}" id="name" name="name" type="text" class="form-control viewName">
			</div>
	
			<div class="input-group input-group_modal memo_modal">
				<span class="input-group-addon">메모</span>
				<textarea class="form-control form-control_area viewMemo" rows="5" id="comment">${materDTO.materMemo}</textarea>
			</div>
							
							
			<div id="erp_jh_modal_update_table">
				<table id="er_modal_table" class="table">
					<thead>
						<tr>
							<th>주문코드</th>
							<th>제품코드</th>
						</tr>
					</thead>
								    
					<tbody id="productList_update_tbody">
						<c:forEach items="${orderView}" var="list"> 
							<tr>
								<td>${list.orderCode}</td>
								<td>${list.code}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
				
		 </div>
		<!-- modal contents 끝-->
				        
		<!-- modal footer -->
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default or_update_btn">수정 하기</button> -->
				<c:if test="${member.temp eq '영업/구매부'}">
				<button title="${materDTO.materCode}" type="button" data-dismiss="modal" class="btn btn-default mater_delete">삭제</button>
				</c:if>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</form>
		
		<!-- modal footer 끝-->
	</div>
</div>