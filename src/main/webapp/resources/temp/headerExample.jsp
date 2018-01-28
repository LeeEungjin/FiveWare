<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<!-- header -->
	<div id="ej_sidebar" style="float: left;">
		<div class="ej_sidebar_contents">
			<p>
				<a href="${pageContext.request.contextPath}/" title="home">
					<span class="ej_home"></span>
				</a>
			</p>	
			
			<p>
				<a id="ej_menu">
					<span class="ej_icon"></span> <span id="ej_icon_contents">전체메뉴</span>
				</a>
			</p>
		</div>
		
		<!-- info -->
		<div class="ej_info_logout">
            <div class="ej_user_info">
            	<img src="${pageContext.request.contextPath}/resources/images/sidebar/avatar82.png" class="ej_default_img">
            </div>
            
            <div class="ej_user_name">
            	 NAME <%-- ${member.name} --%>
            </div>
            <div class="ej_user_sub_info">
            	<a href="#" class="ej_my_info">내정보</a>
            	<a href="${pageContext.request.contextPath}/member/memberLogout" class="ej_logout">로그아웃</a>
            </div>
        </div>
		
		
		<!-- menu list -->
		<div class="ej_sidebar_nav">
			<ul id="ej_menuList">
				<!-- ERP, GroupWare, SRM -->
				<li class="productMenu" title="ERP">
					<a href="${pageContext.request.contextPath}/erp">
						<span class="ej_sidebar_menu ej_menu_color ej_erp">ERP</span>
					</a>
				</li><li class="productMenu menuTooltip" title="GroupWare">
					<a href="${pageContext.request.contextPath}/groupware">
						<span class="ej_sidebar_menu  ej_menu_color ej_groupware">GroupWare</span>
					</a>
				</li><li class="productMenu menuTooltip" title="SRM">
					<a href="${pageContext.request.contextPath}/srm">
						<span class="ej_sidebar_menu ej_menu_color ej_srm">SRM</span>
					</a>
				</li>
			
				<li class="productMenu menuTooltip" title="공지">
					<a href="#">
						<span class="ej_sidebar_menu ej_notice">공지</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="회계">
					<a href="#">
						<span class="ej_sidebar_menu ej_account">회계</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="영업/구매">
					<a href="#">
						<span class="ej_sidebar_menu ej_sales">영업/구매</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="인사">
					<a href="#">
						<span class="ej_sidebar_menu ej_resource">인사</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="일정">
					<a href="#">
						<span class="ej_sidebar_menu ej_calendar">일정</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="쪽지">
					<a href="#">
						<span class="ej_sidebar_menu ej_facing">쪽지</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="주소록">
					<a href="#">
						<span class="ej_sidebar_menu ej_address">주소록</span>
					</a>
				</li>
				
				<li class="productMenu menuTooltip" title="조직도">
					<a href="#">
						<span class="ej_sidebar_menu ej_organization">조직도</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	
