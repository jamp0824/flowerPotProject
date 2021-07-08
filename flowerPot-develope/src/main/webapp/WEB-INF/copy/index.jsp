<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="info/header.jsp"></jsp:include>


<div id="main">
	<div id="content">
		<div class="mainVisual">
			<div>
				<img alt="" src="${pageContext.request.contextPath }/resources/img/1.jpg">
			</div>
			<div>
				<img alt="" src="${pageContext.request.contextPath }/resources/img/2.jpg">
			</div>
			<div>
				<img alt="" src="${pageContext.request.contextPath }/resources/img/3.jpg">
			</div>
			<div>
				<img alt="" src="${pageContext.request.contextPath }/resources/img/4.jpg">
			</div>
		</div>

		<div id="kurlyMain" class="page_aticle page_main"">
			<div class="main_type2">
				<div class="product_list">
					<div class="tit_goods">
						<h3 class="tit">리뷰</h3>
					</div>
					<div class="list_goods">
						<div class="main-review">
							<div>
								<h3>1</h3>
							</div>
							<div>
								<h3>2</h3>
							</div>
							<div>
								<h3>3</h3>
							</div>
							<div>
								<h3>4</h3>
							</div>

						</div>
					</div>

					<div class="tit_goods">
						<h3 class="tit">오늘의 추천</h3>
					</div>
					<div class="list_goods">

						<div class="today-best">
							<div>
								<h3>1</h3>
							</div>
							<div>
								<h3>2</h3>
							</div>
							<div>
								<h3>3</h3>
							</div>
							<div>
								<h3>4</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>

	$('.mainVisual').slick({
		dots : true,
		infinite : true,
		arrows : true,
		autoplay : true,
		autoplaySpeed : 3000,
		speed : 300,
		slidesToShow : 1,
		adaptiveHeight : true
	});

	$('.main-review').slick({
		dots : true,
		infinite : true,
		arrows : true,
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 3
	});

	$('.today-best').slick({
		dots : true,
		infinite : true,
		arrows : true,
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 3
	});
</script>

<jsp:include page="info/footer.jsp"></jsp:include>

