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
      
      
      $("#eb_cbtn").click(function(){
    	 $("#eb_frm").prop("action","./member/memberLogin");
    	
    	 $("#eb_frm").submit();
      });
      
      $("#eb_sbtn").click(function(){
    	 $("#eb_frm").prop("action","./member/storeLogin");
    	
    	 $("#eb_frm").submit();
      });
      
      
      
      
      //로그인 후 이용
/*        $(".eb_login").click(function(){
    	  
   			var member=$("#eb_code").val();
   			var kind='${kind}';

   			
    	if(member==""){
    		alert("로그인 후 이용해주세요.");
    	}else{
    	
    		if(kind=="member"){
    		$("#eb_href_1").attr("href","erp");
    		$("#eb_href_2").attr("href","groupware");
    		
    		$("#eb_href_3").click(function(){
    			alert("지점사람들만 이용가능합니다.");
    	    });    		
    			
    		}else{
    			$("#eb_href_2").attr("href","groupware");
        		$("#eb_href_3").attr("href","srm");
        		
        		$("#eb_href_1").click(function(){
        			alert("본사사람들만 이용가능합니다.");
        	    }); 
    			
    		}
    	}
	  
      });  */
       
      
 
      
   
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
    

       <div class="logini_pic">
            	 로그인 아이콘
          </div>
          
          <!-- id, pw -->
         <form action="" id="eb_frm"> 
          <div class="login" >

              <input type="text" placeholder="id" class="loginid wrap" name="code" id="eb_code">
             <input type="text" placeholder="password" class="loginpw wrap" name="pw">

             
           	  아이디저장
             <div class="idsave wrap">
                <input type="checkbox" >  <!-- 아이디 저장 -->
             </div>
             
            <!--  보안문자 -->
             <div class="security wrap">
                
             </div>
             
          <!--    로그인버튼   -->           
                <input type="button"  class="wrap loginbtn" id="eb_cbtn" value="본사 로그인">
   				
   				<input type="button"  class="wrap loginbtn" id="eb_sbtn" value="지점 로그인">
   
             
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
                
               <c:if test="${kind eq 'member'}"> 
                 <div class="member_info">
                   <div class="info">사원명  : <input type="text" readonly="readonly" value="${member.name }" id="eb_name"></div>
                   <div class="info">부서      : <input type="text" readonly="readonly" value="${member.temp }"></div>
                   <div class="info">직급      : <input type="text" readonly="readonly" value="${member.rank }"></div>
                   ------------------------------------------------<br>
                   알림?
                </div> 
                </c:if>
                
                 <c:if test="${kind eq 'store'}"> 
                      <div class="member_info">
                   <div class="info">지점명  : <input type="text" readonly="readonly" value="${member.store }" id="eb_name"></div>
               
                   ------------------------------------------------<br>
                   알림?
                </div> 
                </c:if>
                
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