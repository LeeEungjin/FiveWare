<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!-- header -->
	<div id="ej_sidebar" style="float: left;">
		<div class="ej_sidebar_contents">
			<p>
				<a href="#" title="home">
					<span class="ej_home"></span>
				</a>
			</p>	
			
			<p>
				<a id="ej_menu">
					<span class="ej_icon"></span> <span id="ej_icon_contents">전체메뉴</span>
				</a>
			</p>
		</div>
		
		<div class="ej_info_logout">
            <ul class="ej_user_info">
                <li id="ej_userImg" class="ej_per"></li>
            </ul>
        </div>
		
		
		<div class="ej_sidebar_nav">
			<ul id="ej_menuList">
				<!-- ERP, GroupWare, SRM -->
				<li class="productMenu menuTooltip" title="ERP">
					<a href="#">
						<span class="ej_sidebar_menu ej_menu_color">ERP</span>
					</a>
				</li><li class="productMenu menuTooltip" title="GroupWare">
					<a href="#">
						<span class="ej_sidebar_menu ej_menu_color">GroupWare</span>
					</a>
				</li><li class="productMenu menuTooltip" title="SRM">
					<a href="#">
						<span class="ej_sidebar_menu ej_menu_color">SRM</span>
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