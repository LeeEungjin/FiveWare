<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="modal-dialog modal-lg">
	<div class="modal-content">
				      
	<!-- modal header -->
	<div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	     <h4 class="modal-title">|주문 입력</h4>
				        </div>
	<!-- modal header 끝-->
				        
	<!-- modal contents -->
	<form action="./orderUpdate" method="post" id="or_write_frm">
	    <div class="modal-body">
	       	<div class="input-group input-group_modal or_input-group_modal">
			  	<span class="input-group-addon">주문코드</span>
			  	<input value="${orderDTO.orderCode}" id="orderCode" name="orderCode" type="text" class="form-control viewCode" readonly="readonly">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
			  	<span class="input-group-addon">계약일자</span>
				<input value="${orderDTO.contractDate}" id="contractDate" name="contractDate" type="date" class="form-control viewContractDate">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
				<span class="input-group-addon">부서</span>
				<input value="${orderDTO.temp}" id="temp" name="temp" type="text" class="form-control viewTemp">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
				<span class="input-group-addon">작성자</span>
				<input value="${orderDTO.name}" id="name" name="name" type="text" class="form-control viewName">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
				<span class="input-group-addon">거래처</span>
				<input type="text" value="${orderDTO.account}" class="form-control">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
				<span class="input-group-addon">납품장소</span>
				<input value="${orderDTO.delivery}" id="delivery" name="delivery" type="text" class="form-control viewDelivery">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
				<span class="input-group-addon">납기일</span>
				<input value="${orderDTO.deadline}" id="deadline" name="deadline" type="date" class="form-control viewDeadline">
			</div>
							
			<div class="input-group input-group_modal or_input-group_modal">
				<span class="input-group-addon">출하창고</span>
				<input type="text" value="${orderDTO.storageName}" class="form-control">
			</div>
							
			<div class="input-group input-group_modal memo_modal">
				<span class="input-group-addon">메모</span>
				<textarea name="orderMemo" class="form-control form-control_area viewMemo" rows="5" id="comment">${orderDTO.orderMemo}</textarea>
			</div>
							
							
			<div id="erp_jh_modal_update_table">
				<table id="or_modal_table" class="table">
					<thead>
						<tr>
							<th>제품코드</th>
							<th>수량</th>
							<th>단가</th>
							<th>총 주문 금액</th>
						</tr>
					</thead>
								    
					<tbody id="productList_update_tbody">
						<c:forEach items="${productList}" var="productList"> 
							<tr>
								<td>${productList.code}</td>
								<td>${productList.amount}</td>
								<td>${productList.price / productList.amount}</td>
								<td>${productList.price}</td>
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
				<button title="${orderDTO.orderCode}" type="button" data-dismiss="modal" class="btn btn-default or_delete">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</form>
		
		<!-- modal footer 끝-->
	</div>
</div>