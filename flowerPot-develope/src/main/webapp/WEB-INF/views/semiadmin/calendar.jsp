<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<!-- https://fullcalendar.io/docs/initialize-globals  -->

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SemiAdmin _ Calendar</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/css/bootstrap.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/vendors/simple-datatables/style.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/css/app.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/images/favicon.svg" type="image/x-icon">
	
	<!-- php -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/calendar/demo-to-codepen.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/calendar/php/get-events.php" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/calendar/php/utils.php" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/calendar/php/get-time-zones.php" >

<!-- calendar script -->
<link href='${pageContext.request.contextPath}/resources/semiadmin_css/calendar/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/semiadmin_css/calendar/main.js'></script>

<script src='${pageContext.request.contextPath}/semiadmin_css/calendar/demo-to-codepen.js'></script>

<style>
#calendar{
  width:90%; height:90%; 
}

#main .demo-topbar{
width:80%; height:80%; 
}

</style>

</head>
<body>
       <!-- sidebar -->
   <jsp:include page="sidebar.jsp"></jsp:include>
        				
		<div id="main">
		<div class="demo-topbar">
			<nav class="navbar navbar-header navbar-expand navbar-light">
				<a class="sidebar-toggler" href="#"> 
				<span class="navbar-toggler-icon"></span></a>
				<button class="btn navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					
					<ul	class="navbar-nav d-flex align-items-center navbar-light ml-auto">
					
						<li class="dropdown nav-icon">
						   <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
								<div class="d-lg-inline-block">
									<i data-feather="bell"></i>
								</div>
						   </a>
						   
					
							   <div class="dropdown-menu dropdown-menu-right dropdown-menu-large">
								  <h6 class='py-2 px-4'>Notifications</h6>
								    <ul class="list-group rounded-none">
									   <li class="list-group-item border-0 align-items-start">
									    	<div class="avatar bg-success mr-3">
										    	<span class="avatar-content">
												<i data-feather="shopping-cart"></i></span>
											</div>
										<div>
											<h6 class='text-bold'>New Order</h6>
											<p class='text-xs'>An order made by Light &emp; Salt for FlowerPot</p>
										</div>
									</li>
								</ul>
							</div>
							</li>
							
						<li class="dropdown nav-icon mr-2">
						<a href="#"	data-toggle="dropdown"
							class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
								<div class="d-lg-inline-block">
									<i data-feather="mail"></i>
								</div>
						</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a class="dropdown-item" href="#">
									<i data-feather="user"></i>
									Account</a> <a class="dropdown-item active" href="#">
									<i data-feather="mail"></i> Messages</a> 
									<a class="dropdown-item" href="#">
									<i data-feather="settings"></i> Settings</a>
								 	<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">
									<i data-feather="log-out"></i>Logout</a>
							</div></li>
							
						<li class="dropdown">
						<a href="#" data-toggle="dropdown"
							class="nav-link dropdown-toggle nav-link-lg nav-link-user">
								<div class="avatar mr-1">
									<img src="../resources/semiadmin_css/assets/images/avatar/avatar-s-1.png" alt="" srcset="">
								</div>
								<div class="d-none d-md-block d-lg-inline-block">Hi, 성은</div>
						</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a class="dropdown-item" href="#"><i data-feather="user"></i>Account</a> 
									<a class="dropdown-item active" href="#">
									<i data-feather="mail"></i> Messages</a> 
									<a class="dropdown-item" href="#">
									<i data-feather="settings"></i> Settings</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">
								<i data-feather="log-out"></i>Logout</a>
							</div></li>
					</ul>
				</div>
				</div>
				
			</nav>

			<!-- calendar start  -->
				<div id='calendar'></div><br/>
			<!-- calendar end -->
		

</div>
			    <jsp:include page="footerbar.jsp"></jsp:include>
		
					<!-- modal 
           Button trigger for basic modal
                <button type="button" class="btn btn-outline-primary block" data-toggle="modal" data-target="#default"
                		style="width:90%; height:90%; margin: 0 20px;">
                        Launch Modal
                        </button>
                        
            	<div class="modal fade text-left" id="default" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
                       			 aria-hidden="true">
                            <div class="modal-dialog modal-dialog-scrollable" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="myModalLabel1"> 일정 추가 </h5>
                                        <button type="button" class="close rounded-pill" data-dismiss="modal" aria-label="Close">
                                            <i data-feather="x"></i>
                                       </button>
                                    </div>
                                </div>
                            </div>
                        </div>-->
                        
<!-- Bordered table end -->
		<!-- 	 <jsp:include page="footerbar.jsp"></jsp:include> -->

	
	<!-- calendar script -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth'
			});
			calendar.render();
		});
		
		
		document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');

		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek'
		      },
		      initialDate: '2020-09-12',
		      events: [
		        {
		          start: '2020-09-11T10:00:00',
		          end: '2020-09-11T16:00:00',
		          display: 'background',
		          color: '#ff9f89'
		        },
		        {
		          start: '2020-09-13T10:00:00',
		          end: '2020-09-13T16:00:00',
		          display: 'background',
		          color: '#ff9f89'
		        },
		        {
		          start: '2020-09-24',
		          end: '2020-09-28',
		          overlap: false,
		          display: 'background'
		        },
		        {
		          start: '2020-09-06',
		          end: '2020-09-08',
		          overlap: false,
		          display: 'background'
		        }
		      ]
		    });

		    calendar.render();
		  });
		
	</script>

</body>
</html>