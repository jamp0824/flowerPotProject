<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../info/header2.jsp"></jsp:include>
<style type="text/css">
@font-face {
	font-family: 'UhBeeSeulvely';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSeulvely.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

a:link {
	text-decoration: none;
}
</style>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
	style="background-image: url('${pageContext.request.contextPath }/resources/images/banner_navy.png');">
	<h2
		style="font-family: UhBeeSeulvely; font-weight: bolder; color: #ffffff">
		<a
			href="${pageContext.request.contextPath }/customerCenter/customerCenter"
			style="color: #ffffff">NOTICE</a>
	</h2>
</section>



<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="${pageContext.request.contextPath }"
			class="stext-109 cl8 hov-cl1 trans-04"> 홈 <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a
			href="${pageContext.request.contextPath }/customerCenter/customerCenter"
			class="stext-109 cl8 hov-cl1 trans-04"> 고객센터 <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> 1:1 문의 </span>
	</div>
</div>

<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-lg-3 p-b-80">
				<div class="side-menu">
					<jsp:include page="keyword.jsp"></jsp:include>
					<jsp:include page="sidebar.jsp"></jsp:include>


					<div class="p-t-50">
						<h4 class="mtext-112 cl2 p-b-27">Tags</h4>

						<div class="flex-w m-r--5">
							<a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Fashion </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Lifestyle </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Denim </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Streetstyle </a> <a href="#"
								class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Crafts </a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<div class="table col-12 board-list ">
						<h2 class="my-3">1:1 문의</h2>
						<jsp:include page="enquiry/list.jsp"></jsp:include>
					</div>


				</div>
			</div>


		</div>
	</div>
</section>

<script>
	$(document)
			.ready(
					function() {

						(function yajax() {
							$
									.ajax({
										url : '${pageContext.request.contextPath }/magazine/magazineAjax',
										type : 'GET',
										dataType : 'json',
										success : function(data) {
											console.log(data);
											$('#magazine-test a img')
													.attr(
															'src',
															'${pageContext.request.contextPath }'
																	+ data[0].rootfolder
																	+ data[0].uuidname);
											$('#magazine-title').html(
													data[0].title)
										}
									});

						})();
					});
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>