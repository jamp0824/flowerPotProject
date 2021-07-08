<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../info/header2.jsp"></jsp:include>


<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>

    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 1000px;
      margin: 20px auto;
      padding:50px 20px;
    }

  </style>
  
<title>SemiAdmin _ Calendar</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/vendors/simple-datatables/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/css/app.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/semiadmin_css/assets/images/favicon.svg" type="image/x-icon">

<!-- calendar script -->
<link href='${pageContext.request.contextPath}/resources/semiadmin_css/calendar/main.min.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/semiadmin_css/calendar/main.min.js'></script>
<link href='${pageContext.request.contextPath}/resources/semiadmin_css/calendar/demo-to-codepen.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/semiadmin_css/calendar/demo-to-codepen.js'></script>


<!-- Cart -->
<div class="wrap-header-cart js-panel-cart">
	<div class="s-full js-hide-cart"></div>

	<div class="header-cart flex-col-l p-l-65 p-r-25">
	
		<div class="header-cart-title flex-w flex-sb-m p-b-8">
			<span class="mtext-103 cl2"> Your Cart </span>

			<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
				<i class="zmdi zmdi-close"></i>
			</div>
		</div>

		<div class="header-cart-content flex-w js-pscroll">
			<ul class="header-cart-wrapitem w-full">
				<li class="header-cart-item flex-w flex-t m-b-12">
					<div class="header-cart-item-img">
						<img src="${pageContext.request.contextPath }/resources/images/item-cart-01.jpg" alt="IMG">
					</div>

					<div class="header-cart-item-txt p-t-8">
						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04"> White Shirt Pleat </a>

						<span class="header-cart-item-info"> 1 x $19.00 </span>
					</div>
				</li>

				<li class="header-cart-item flex-w flex-t m-b-12">
					<div class="header-cart-item-img">
						<img src="${pageContext.request.contextPath }/resources/images/item-cart-02.jpg" alt="IMG">
					</div>

					<div class="header-cart-item-txt p-t-8">
						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04"> Converse All Star </a>

						<span class="header-cart-item-info"> 1 x $39.00 </span>
					</div>
				</li>

				<li class="header-cart-item flex-w flex-t m-b-12">
					<div class="header-cart-item-img">
						<img src="${pageContext.request.contextPath }/resources/images/item-cart-03.jpg" alt="IMG">
					</div>

					<div class="header-cart-item-txt p-t-8">
						<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04"> Nixon Porter Leather </a>

						<span class="header-cart-item-info"> 1 x $17.00 </span>
					</div>
				</li>
			</ul>

			<div class="w-full">
				<div class="header-cart-total w-full p-tb-40">Total: $75.00</div>

				<div class="header-cart-buttons flex-w w-full">
					<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10"> View Cart </a>

					<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10"> Check Out </a>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${pageContext.request.contextPath }/resources/images/bg-02.jpg');">
	<h2 class="ltext-105 cl0 txt-center">이벤트</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		
				<div id='calendar'>
				
					<div class="demo-topbar"></div>
					
				</div>
			
	</div>
</section>

<script>

	$(document).ready(function() {
		
		(function yajax() {
			$.ajax({
				url : '${pageContext.request.contextPath }/magazine/magazineAjax',
				type : 'GET',
				dataType : 'json',
				success : function (data) {
					console.log(data);
					$('#magazine-test a img').attr('src','${pageContext.request.contextPath }'+data[0].rootfolder+data[0].uuidname);
					$('#magazine-title').html(data[0].title)
				}
			});

		})();
	});
	
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
	          end: '2020-09-11T10:00:00',
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
	          end: '2020-09-26',
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

<jsp:include page="../info/footer.jsp"></jsp:include>
</head>
</html>
