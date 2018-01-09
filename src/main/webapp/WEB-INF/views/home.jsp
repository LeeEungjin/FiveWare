<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/home.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(function(){
      $(".total_wrap").css("height", window.innerHeight);
   });
</script>
</head>
<body>
<div class="total_wrap_header"></div>

<!-- 전부 -->
<div class="total_wrap">
   <img src="${pageContext.request.contextPath}/resources/images/common/company.jpg" style="width:100%; height: 100%"> 
  <div class="main_wrap">
 <!-- 메뉴 -->
       <div class="menu_wrap">
             <div class="menu">
                <a href="erp">ERP</a>
             </div>
             
                <div class="menu">
                <a href="groupware">GroupWare</a>
             </div>
             
                <div class="menu">
                <a href="srm">SRM</a>
             </div>
       </div>
       
   	   <!--  로그인 -->
       <div class="login_wrap">
          <div class="logini_pic">
            	 로그인 아이콘
          </div>
          
          <!-- id, pw -->
          <div class="login">
             <input type="text" placeholder="  　id" class="loginid  wrap" name="id">
             <input type="text" placeholder=" 　 password" class="loginpw wrap" name="pw">
             
           	  아이디저장
             <div class="idsave wrap">
                <input type="checkbox" >  <!-- 아이디 저장 -->
             </div>
             
            <!--  보안문자 -->
             <div class="security wrap">
                
             </div>
             
          <!--    로그인버튼   -->           
                <input type="button"  class="wrap loginbtn" value="로그인">
   
             
          </div>
          
          
       </div>
       
    <!--    로그인 전 화면 끝 -->
       
       <!-- 로그인 끝 화면 시작 -->
          <div class="login_after">
          
         <!--  사원 정보 -->
             <div class="member_wrap">
                <div class="member_pci">
                 <!--   사진
                   사진 -->
                </div>
                
                <div class="member_info">
                   <div class="info">사원명  : <input type="text" readonly="readonly" value=""></div>
                   <div class="info">부서      : <input type="text" readonly="readonly" value=""></div>
                   <div class="info">직급      : <input type="text" readonly="readonly" value=""></div>
                   ------------------------------------------------<br>
                   <!-- 알림? -->
                </div>
             </div>
             
             <!-- 인사말? -->
             <div class="welcome">
                인사말?
                동영상?
                할일 ?
             </div>
          </div>
       <!-- 로그인 끝 화면 끝 -->
   </div> 
</div>

</body>
</html>