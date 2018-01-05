<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <!--  Modal Header -->
                  <div class="modal-header">
                  
                     <h4 class="modal-title"> | 계좌명 </h4>
                     
                      <button type="button"  class="close" data-dismiss="modal">&times;</button>
                         
                          </div>
                          
                         <!--  Modal body -->
             <div class="modal-body">
             
              <table id="eb_table">
              
						   
						<thead>
						    <tr>
						    	<th>코드</th>					
						     	<th>계좌명</th>		
						     	<th>은행</th>
						     	<th>계좌번호</th>			   
						    </tr>
						 </thead>
						    
						 <tbody>
						 
						 <c:forEach items="${list}" var="dto">
						 	<tr>
						 		<td>
						 			<input type='radio' value="${dto.memo}" name="memo">${dto.code}
						 		</td>
						 		<td>${dto.memo}</td>
						 		<td>${dto.bank}</td>
						 		<td>${dto.account}</td>
							</tr>
						</c:forEach>	
							
						 </tbody>
					 </table>
               
             </div>
                          
       