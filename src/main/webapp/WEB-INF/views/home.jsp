<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/home.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(function(){
	   
	   var message = '${message}';
	     if(message != ""){
	        alert(message);
	     }
	   
      $(".total_wrap").css("height", window.innerHeight);
      
      
      //로그인 후 이용
 /*      $(".eb_login").click(function(){
   			var member=$("#eb_code").val();
   			
    	if(member==""){
    		alert("로그인 후 이용해주세요.");
    	}else{
    		$("#eb_href_1").attr("href","erp");
    		$("#eb_href_2").attr("href","groupware");
    		$("#eb_href_3").attr("href","srm");
    	}
    	  
      }); */
   });
</script>
</head>
<body>
<div class="total_wrap_header"></div>

<!-- 전부 -->
<div class="total_wrap">
   <%-- <img src="${pageContext.request.contextPath}/resources/images/common/company.jpg" style="width:100%; height: 100%">  --%>
  <div class="main_wrap">
 <!-- 메뉴 -->
       <div class="menu_wrap">
       
             <div class="menu">
                <a href="erp" class="eb_login" id="eb_href_1">ERP</a>
             </div>
             
                <div class="menu">
                <a href="groupware" class="eb_login" id="eb_href_2">GroupWare</a>
             </div>
             
                <div class="menu">
                <a href="srm" class="eb_login" id="eb_href_3">SRM</a>
             </div>
       </div>
       
   	   <!--  로그인 -->
        <c:if test="${member eq null}">  
       <div class="login_wrap">
    

       <!--    <div class="logini_pic">
            	 로그인 아이콘
          </div> -->
          
          <!-- id, pw -->
         
        
          <form action="./member/memberLogin" method="get">
          <div class="login">
          	<div class="eb_blank"></div>
          
            <div class="eb_login_input">
            	<p><input type="text" class="eb_input" placeholder="ID" name="code"></p>
            
            	<p><input type="text" class="eb_input" placeholder="PASSWORD" name="pw"></p>
            </div>
             
             <div id="eb_box_1"></div>
             <div id="eb_box_2"></div>
          </div>
          </form>
          </div>
       
          </c:if>
       
    <!--    로그인 전 화면 끝 -->
       
       <!-- 로그인 끝 화면 시작 -->
       <c:if test="${member ne null }">
           <div class="login_after">
          
          <!-- 사원 정보 -->
              <div class="member_wrap">
                <div class="member_pci">
                   사진
                   사진
                </div>
                
                 <div class="member_info">
                   <div class="info">사원명  : <input type="text" readonly="readonly" value="${member.name }" id="eb_name"></div>
                   <div class="info">부서      : <input type="text" readonly="readonly" value="${member.temp }"></div>
                   <div class="info">직급      : <input type="text" readonly="readonly" value="${member.rank }"></div>
                   ------------------------------------------------<br>
                   알림?
                </div> 
             </div> 
             
            <!--  인사말? -->
              <div class="welcome">
                인사말?
                동영상?
                할일 ?
             </div> 
          </div> 
          </c:if>
       <!-- 로그인 끝 화면 끝 -->
   </div> 
</div>

</body>
</html>