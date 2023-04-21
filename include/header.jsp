<%@ page language="java" pageEncoding="UTF-8"%>
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			DDIT <sup>(JSP)</sup>
		</div>
	</a>
	<hr class="sidebar-divider"/>
	<div class="sidebar-heading">MAIN MENU</div>
	<li class="nav-item collapsed">
		<a class="nav-link" href="#"> 
			<i class="fas fa-fw fa-folder"></i> <span>1장 JSP개요</span>
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#jsp2class" 
			aria-expanded="true" aria-controls="jsp2class"> 
			<i class="fas fa-fw fa-folder"></i> 
			<span>2장 스크립트 태그</span>
		</a>
		<div id="jsp2class" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">1. 스크립트 태그의 종류</h6>
				<a class="collapse-item" href="/ch02/scripting.jsp">scripting.jsp</a>
			</div>
		</div>
	</li>
	<hr class="sidebar-divider">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>