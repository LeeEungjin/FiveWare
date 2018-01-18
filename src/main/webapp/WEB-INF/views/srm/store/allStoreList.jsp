<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
					
					<c:forEach items="${storeList}" var="list">
						<div class="all_store_div">
							<div class="store_title_div">
								<span>&nbsp;[${list.code}]&nbsp;${list.store}</span>
							</div>
							
							<table class="table all_table">
							   	<tr>
							   		<td class="rb" colspan="2">사업자 등록 번호</td>
							   		<td class="rb" colspan="2">${list.storeNum}</td>
							   		
							   		<td class="rb">대표자명</td>
							   		<td class="rb">${list.name}</td>
							   	</tr>
							   	
							   	<tr>
									<td class="rb">주소</td>
									<td class="rb" colspan="5">${list.addr}</td>							   	
							   	</tr>
							   	
							   	<tr>
							   		<td class="rb">이메일</td>
							   		<td class="rb">${list.email}</td>
							   		
							   		<td class="rb">전화번호</td>
							   		<td class="rb">${list.tel}</td>
							   		
							   		<td class="rb">운영 시간</td>
							   		<td class="rb">${list.time}</td>
							   	</tr>
							   	
							   	<tr>
							   		<td class="rb">계좌 정보</td>
							   		<td class="rb" colspan="5">${list.bank}은행 계좌번호 : ${list.account}</td>
							   	</tr> 
							  
							 </table>				
						</div>
					</c:forEach>
							  