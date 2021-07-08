<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div id="main">
	<div id="content">

		<div class="page_aticle">
			<div class="lnb_menu" id="lnbMenu" >
				<div id="bnrCategory" class="bnr_category">
					<div class="thumb">
						<img src="" alt="카테고리배너">
					</div>
				</div>
				<div class="inner_lnb">
					<div class="ico_cate">
						<span class="tit">유형별</span>
					</div>
					<!-- 카테고리 네비게이션 부분 -->
					<ul class="list">
						<li>클렌징</li>
						<li>스킨케어</li>
						<li>마스크팩</li>
						<li>선케어</li>
						<li>베이스 메이크업</li>
						<li>립 메이크업</li>
						<li>아이 메이크업</li>
					</ul>
				</div>
			</div>
			<div id="goodsList" class="page_section section_goodslist">
				<!-- 신상품순,, 등등 select -->
				
				<!-- <div class="list_ability">
					<div class="sort_menu">
						<div>
						<div class="select_type user_sort">
							<a class="name_select"></a>
							<ul class="list">
								<li><a>신상품순</a></li>
								<li><a>인기상품순</a></li>
								<li><a>낮은가격순</a></li>
								<li><a>높은가격순</a></li>
							</ul>
						</div>
						<view-sort :page-type="pageType" :sort-data="sortData" :sort-delivery="sortDelivery" :delivery-check="deliveryCheck" :sort-user-check="sortUserCheck" :type="type" @sort-regist="sortRegist" @sort-layer-view="sortLayerView"></view-sort> 
						</div>
					</div>
				</div> -->
				<div class="list_goods">
					<div class="inner_listgoods">
						<ul class="list">
							<!-- 하나의 리스트 -->
							<li>
								<div class="item">
									<div class="thumb">
										<a class="img" style="background-image: url('${pageContext.request.contextPath }/resources/img/cometic/abc.jpg');">
											<img alt="aaa" src="${pageContext.request.contextPath }/resources/img/cometic/abc.jpg" width="308" height="396">
										</a>
										<div class="group_btn">
											<button type="button" class="btn btn_cart">
												<span class="screen_out">1385</span>
											</button>
										</div>
									</div>
									<a class="info"> 
										<span class="name">화장품...</span> 
										<span class="cost"> <span class="price">1800원</span></span> 
										<span class="desc">촉촉한 화장품</span>
									</a>
									<span class="tag"></span>
								</div>
							</li>
							<!-- 하나의 리스트 -->
							<li>
								<div class="item">
									<div class="thumb">
										<a class="img" style="background-image: url('${pageContext.request.contextPath }/resources/img/cometic/abc.jpg');">
											<img alt="aaa" src="${pageContext.request.contextPath }/resources/img/cometic/abc.jpg" width="308" height="396">
										</a>
										<div class="group_btn">
											<button type="button" class="btn btn_cart">
												<span class="screen_out">1385</span>
											</button>
										</div>
									</div>
									<a class="info"> 
										<span class="name">화장품...</span> 
										<span class="cost"> <span class="price">1800원</span></span> 
										<span class="desc">촉촉한 화장품</span>
									</a>
									<span class="tag"></span>
								</div>
							</li>
							<!-- 하나의 리스트 -->
							<li>
								<div class="item">
									<div class="thumb">
										<a class="img" style="background-image: url('${pageContext.request.contextPath }/resources/img/cometic/abc.jpg');">
											<img alt="aaa" src="${pageContext.request.contextPath }/resources/img/cometic/abc.jpg" width="308" height="396">
										</a>
										<div class="group_btn">
											<button type="button" class="btn btn_cart">
												<span class="screen_out">1385</span>
											</button>
										</div>
									</div>
									<a class="info"> 
										<span class="name">화장품...</span> 
										<span class="cost"> <span class="price">1800원</span></span> 
										<span class="desc">촉촉한 화장품</span>
									</a>
									<span class="tag"></span>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="layout-pagination" v-if="!noData">
					<div class="pagediv">
						<a href="#main" @click="onMoveList(1)" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a> <a href="#main" @click="onMoveList(pageCount-1)" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
						<list-goods-paging v-for="(paging, idx) in pagingCountArray" :idx="idx+1" :key="idx" :page-count="pageCount" :total-page-count="totalPageCount" @on-move-list="onMoveList"> </list-goods-paging>
						<a href="#main" @click="onMoveList(pageCount+1)" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a> <a href="#main" @click="onMoveList(totalPaging)" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../info/footer.jsp"></jsp:include>
