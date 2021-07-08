<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${pageContext.request.contextPath }/resources/images/banner_navy.png');">
	<h2 style="font-family: UhBeeSeulvely; font-weight: bolder; color: #ffffff">
		<a href="${pageContext.request.contextPath }/customerCenter/customerCenter" style="color: #ffffff">NOTICE</a>
	</h2>
</section>

<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="${pageContext.request.contextPath }" class="stext-109 cl8 hov-cl1 trans-04">
			홈 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>
		<a href="${pageContext.request.contextPath }/customerCenter/customerCenter" class="stext-109 cl8 hov-cl1 trans-04">
			고객센터 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>
		<span class="stext-109 cl4"> <a href="${pageContext.request.contextPath }/customerCenter/enquiry" class="stext-109 cl8 hov-cl1 trans-04">
				1:1 문의 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
		</span>
	</div>
</div>

<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row">
			<%-- <div class="col-md-4 col-lg-3 p-b-80">
				<div class="side-menu">


					<jsp:include page="keyword.jsp"></jsp:include>
					<jsp:include page="sidebar.jsp"></jsp:include>


					<div class="p-t-50">
						<h4 class="mtext-112 cl2 p-b-27">Tags</h4>

						<div class="flex-w m-r--5">
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Fashion </a> <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Lifestyle </a> <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Denim </a> <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Streetstyle </a> <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Crafts </a>
						</div>
					</div>
				</div>
			</div> --%>

			<div class="col-12 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<div class="table col-12 board-list ">
						<div class="p-t-32">
							<!-- 날짜 -->
							<div class="text-center">${content.regdate }</div>
							<!-- 제목 -->
							<h4 class="ltext-109 cl2 p-b-28 text-center mt-2">${content.title }</h4>
							<div>
								<img class="border rounded-circle ml-2 d-inlineblock" src="${pageContext.request.contextPath }/resources/images/product-min-02.jpg" width="50" height="50" alt="작성자 이름" /> <span class="cl12 m-l-4 m-r-6">|</span>
								<p class="ml-2 d-inline-block">by ${content.memberVo.nickname }</p>
								<span class="cl12 m-l-4 m-r-6">|</span>
								<p class="ml-2 d-inline-block">${content.memberVo.email }</p>
							</div>
							<hr />
							<!-- 내용 -->
							<div class="stext-117 cl6 p-b-26" style="min-height: 300px;">${content.content }</div>
						</div>
						<hr />
						<div class="text-right">
							<a href="${pageContext.request.contextPath }/customerCenter/edit?ccno=${content.ccno}" class="btn btn-secondary btn-primary">수정</a>
							<a href="${pageContext.request.contextPath }/customerCenter/delete?category?ccno=${content.ccno}" class="btn btn-secondary btn-primary">삭제</a>
							<a href="${pageContext.request.contextPath }/customerCenter/customerCenter?category=notice" class="btn btn-secondary btn-primary">목록</a>
						</div>

						<!-- <h2 class="my-3">1:1 문의</h2>
						<table class="table table-striped table-sm">
							<thead>
								<tr>
									<th>${content.title }</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>${content.content }</th>
								</tr>
							</tbody>	

						</table>
						<div style="float: left;">
							<input type="button" onclick="location.href='${pageContext.request.contextPath }/customerCenter/enquiry/edit?ccno=${content.ccno}'" value="수정">
							<a href="${pageContext.request.contextPath }/customerCenter/customerCenter?category=enquiry">목록</a>
							<a type="button" onclick="del(${content.ccno})" value="삭제"></a>
						</div>
						 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	function del(ccno) {
		location.href = "${pageContext.request.contextPath }/customerCenter/enquiry/delete?ccno="
				+ ccno;
	}
</script>
<jsp:include page="../info/footer.jsp"></jsp:include>