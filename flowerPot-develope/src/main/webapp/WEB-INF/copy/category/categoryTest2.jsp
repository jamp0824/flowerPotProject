<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div id="main">
	<div id="content">

		<div id="qnb" class="quick-navigation">


			<div class="bnr_qnb" id="brnQuick"></div>
			<div class="side_recent" style="display: none">
				<strong class="tit">최근 본 상품</strong>
				<div class="list_goods" data-height="209">
					<ul class="list"></ul>
				</div>
				<button type="button" class="btn btn_up off">최근 본 상품 위로 올리기</button>
				<button type="button" class="btn btn_down">최근 본 상품 아래로 내리기</button>
			</div>

		</div>

		<div class="section_view">
			<!-- 공유하기 박스 -->
			<div id="shareLayer">
				<div class="layer_share">
					<div class="inner_layersns">
						<h3 class="screen_out">SNS 공유하기</h3>
						<ul class="list_share">
							<li><a class="btn btn_fb" data-sns-name="페이스북" data-sns="facebook" href="#none"><img src="https://res.kurly.com/mobile/service/goodsview/1804/ico_facebook.png" alt="페이스북"><span class="txt">공유하기</span></a></li>
							<li><a class="btn btn_tw" data-sns-name="트위터" data-sns="twitter" href="#none"><img src="https://res.kurly.com/mobile/service/goodsview/1804/ico_twitter.png" alt="트위터"><span class="txt">트윗하기</span></a></li>
							<li class="btn_url"><input type="text" class="inp" value="" readonly="readonly"> <a class="btn_copy off" data-sns-name="링크 복사" data-sns="copy" href="#none">URL 복사<img src="https://res.kurly.com/mobile/service/goodsview/1804/ico_checked_x2.png" alt=""></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!--  -->
			<div id="sectionView" >
				
				<div class="inner_view">
					<div class="thumb" style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1452160872126y0.jpg')">
						<img src="https://res.kurly.com/mobile/service/goodsview/1910/bg_375x482.png" alt="상품 대표 이미지" class="bg" >
					</div>
					<p class="goods_name">
						<span class="btn_share">
							<button id="btnShare" data-goodsno="1385">공유하기</button>
						</span>
						<strong class="name">무농약 간편 샐러드 6종</strong>
						<span class="short_desc">내 마음대로 골라담고 세척되어 바로 먹을 수 있는 신선한 샐러드</span>
					</p>
					<p class="goods_price">
						<span class="position">
							<span class="dc">
								<span class="dc_price">
									1,800
								</span>
								<span class="won">원</span>
							</span>
						</span>
						<span class="not_login">
							<span>로그인 후, 적립혜택이 제공됩니다.</span>
						</span>
					</p>
					<!-- 상품 설명 부분 -->
					<div class="goods_info">
						<dl class="list">
							<dt class="tit">배송구분</dt>
							<dd class="desc">샛별배송/택배배송</dd>
						</dl>
						<dl class="list">
							<dt class="tit">원산지</dt>
							<dd class="desc">샛별배송/택배배송</dd>
						</dl>
						<dl class="list">
							<dt class="tit">포장타입</dt>
							<dd class="desc">샛별배송/택배배송</dd>
						</dl>
						<dl class="list">
							<dt class="tit">유툥기한</dt>
							<dd class="desc">샛별배송/택배배송</dd>
						</dl>
						<dl class="list">
							<dt class="tit">참고사항</dt>
							<dd class="desc">샛별배송/택배배송</dd>
						</dl>
						<dl class="list">
							<dt class="tit">안내사항</dt>
							<dd class="desc">샛별배송/택배배송</dd>
						</dl>
					</div>
				</div>
				<!-- 상품선택 부분 -->
				<div id="cartPut">
					<div class="cart_option cart_type2">
						<div class="inner_option">
							<strong class="tit_cart">무농약 간편 샐러드 6종</strong>
						</div>
						<div class="in_option">
							<div class="list_goods">
								<div class="box_select">
									<strong class="name">상품선택</strong>
									<div class="inner_select">
										<a class="txt_select">상품선택</a>
									</div>
								</div>
								<ul class="list">
									<li class="off">
										<span class="btn_position on">
											<button type="button" class="btn_del">
												<span>삭제하기</span>
											</button>
										</span>
										<span class="name">
											<span>(품절) [간편 샐러드] 손질 양상추 60g</span>
										</span>
										<div class="option">
											<span class="price"><span class="dc_price">1,850원</span></span>
										</div>
									</li>
									<li class="off sold_out"></li>
									<li class="off"></li>
									<li class="off"></li>
									<li class="off"></li>
									<li class="off"></li>
									
								</ul>
							</div>
							<div class="total">
								<div class="price">
									<strong class="tit">총 상품금액 :</strong>
									<span class="sum">
											<span class="num">0</span>
											<span class="won">원</span>
									</span>
								</div>
								<p class="txt_point">
									<span class="ico">적립</span>
									<span class="no_login">
										<span>로그인 후, 적립혜택 제공</span>
									</span>
								</p>
							</div>
						</div>
						<div class="group_btn off">
							<div class="view_function">
								<button type="button" class="btn btn_save">늘 사는 것</button>
								<button type="button" class="btn btn_alarm">재입고 알림</button>
							</div>
							<span class="btn_type1">
								<button type="button" class="txt_type">장바구니 담기</button>
							</span>
						</div>
					</div>
					
					<!-- 미완성 부분 -->
					<div class="cart_option cart_type1">
					</div>
					<form action="">
					</form>
					<!-- 미완성 부분 -->
					
				</div>
			</div>
			
			<div id="cartPut">
				
				<form name="frmBuyNow" method="post" action="/shop/order/order.php">
					<input type="hidden" name="mode" value="addItem"> <input type="hidden" name="goodsno" value="">
				</form>

				<form name="frmWishlist" method="post"></form>
			</div>
		</div>



		<div class="layout-wrapper goods-view-area">


			
			<div class="goods-add-product">
				<h3 class="goods-add-product-title">RELATED PRODUCT</h3>
				<div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
					<button class="goods-add-product-move goods-add-product-move-left __slide-go-left">왼쪽으로 슬라이드 이동</button>
					<button class="goods-add-product-move goods-add-product-move-right __slide-go-right">오른쪽으로 슬라이드 이동</button>
					<div class="goods-add-product-list-wrapper" style="height: 320px">
						<ul class="goods-add-product-list __slide-mover">
							<li class="goods-add-product-item __slide-item">
								<div class="goods-add-product-item-figure">
									<a href="/shop/goods/goods_view.php?&goodsno=5160" target="_blank"><img src='//img-cf.kurly.com/shop/data/goods/1542873164262m0.jpg' class="goods-add-product-item-image" onerror=this.src= 'https://res.kurly.com/mobile/service/common/bg_1x1.png' /></a>
								</div>
								<div class="goods-add-product-item-content">
									<div class="goods-add-product-item-content-wrapper">
										<p class="goods-add-product-item-name">[리더브랜드] 베이비 비트 250g</p>
										<p class="goods-add-product-item-price">6,400원</p>
									</div>
								</div>
							</li>
							<li class="goods-add-product-item __slide-item">
								<div class="goods-add-product-item-figure">
									<a href="/shop/goods/goods_view.php?&goodsno=4972" target="_blank"><img src='//img-cf.kurly.com/shop/data/goods/1481190140705m0.jpg' class="goods-add-product-item-image" onerror=this.src= 'https://res.kurly.com/mobile/service/common/bg_1x1.png' /></a>
								</div>
								<div class="goods-add-product-item-content">
									<div class="goods-add-product-item-content-wrapper">
										<p class="goods-add-product-item-name">[컬리ONLY] 카메야 와사비 드레싱 2종</p>
										<p class="goods-add-product-item-price">8,900원</p>
									</div>
								</div>
							</li>
							<li class="goods-add-product-item __slide-item">
								<div class="goods-add-product-item-figure">
									<a href="/shop/goods/goods_view.php?&goodsno=8687" target="_blank"><img src='//img-cf.kurly.com/shop/data/goods/1504754982988m0.jpg' class="goods-add-product-item-image" onerror=this.src= 'https://res.kurly.com/mobile/service/common/bg_1x1.png' /></a>
								</div>
								<div class="goods-add-product-item-content">
									<div class="goods-add-product-item-content-wrapper">
										<p class="goods-add-product-item-name">[훈도다이] 유자폰즈 (유즈 폰즈)</p>
										<p class="goods-add-product-item-price">6,900원</p>
									</div>
								</div>
							</li>
							<li class="goods-add-product-item __slide-item">
								<div class="goods-add-product-item-figure">
									<a href="/shop/goods/goods_view.php?&goodsno=3320" target="_blank"><img src='//img-cf.kurly.com/shop/data/goods/1470382407978m0.jpg' class="goods-add-product-item-image" onerror=this.src= 'https://res.kurly.com/mobile/service/common/bg_1x1.png' /></a>
								</div>
								<div class="goods-add-product-item-content">
									<div class="goods-add-product-item-content-wrapper">
										<p class="goods-add-product-item-name">유기농 신선초 (즙용) 300g</p>
										<p class="goods-add-product-item-price">2,600원</p>
									</div>
								</div>
							</li>
							<li class="goods-add-product-item __slide-item">
								<div class="goods-add-product-item-figure">
									<a href="/shop/goods/goods_view.php?&goodsno=3666" target="_blank"><img src='//img-cf.kurly.com/shop/data/goods/147080626133m0.jpg' class="goods-add-product-item-image" onerror=this.src= 'https://res.kurly.com/mobile/service/common/bg_1x1.png' /></a>
								</div>
								<div class="goods-add-product-item-content">
									<div class="goods-add-product-item-content-wrapper">
										<p class="goods-add-product-item-name">[MEYER] 프라임 꽃등심 300g(냉장)</p>
										<p class="goods-add-product-item-price">39,000원</p>
									</div>
								</div>
							</li>
							<li class="goods-add-product-item __slide-item">
								<div class="goods-add-product-item-figure">
									<a href="/shop/goods/goods_view.php?&goodsno=79" target="_blank"><img src='//img-cf.kurly.com/shop/data/goods/1470791620774m0.jpg' class="goods-add-product-item-image" onerror=this.src= 'https://res.kurly.com/mobile/service/common/bg_1x1.png' /></a>
								</div>
								<div class="goods-add-product-item-content">
									<div class="goods-add-product-item-content-wrapper">
										<p class="goods-add-product-item-name">유기농 바나나 500g</p>
										<p class="goods-add-product-item-price">3,200원</p>
									</div>
								</div>
							</li>
							<li class="goods-add-product-item __slide-item">
								<div class="goods-add-product-item-figure">
									<a href="/shop/goods/goods_view.php?&goodsno=99" target="_blank"><img src='//img-cf.kurly.com/shop/data/goods/1589778574907m0.jpg' class="goods-add-product-item-image" onerror=this.src= 'https://res.kurly.com/mobile/service/common/bg_1x1.png' /></a>
								</div>
								<div class="goods-add-product-item-content">
									<div class="goods-add-product-item-content-wrapper">
										<p class="goods-add-product-item-name">친환경 대추방울토마토 500g</p>
										<p class="goods-add-product-item-price">4,990원</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
				<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품설명</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기 <span class="count_review"></span></a></li>

					<li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span>( 396 )</span></a></li>
				</ul>
				<div class="goods-view-infomation-content __active" id="goods-description">


					<div class='goods_wrap'>
						<div class="goods_intro">
							<div class="pic">
								<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv00000069651_1.jpg">
							</div>
							<div class="context last">
								<h3>
									<small>원하는 대로 섞어 만드는 하루치 건강</small> 무농약 간편 샐러드 6종
								</h3>
								<p class="words">짙은 녹색의 잎채소는 식이섬유부터 미네랄, 철분, 비타민, 엽산 등 각종 영양분이 풍부한데요. 잎채소의 영양분을 효과적으로 섭취하는 방법은 무엇일까요? 익히지 않고 생으로 먹는 것이죠. 컬리가 여러분의 건강을 위해 간편하게 즐길 수 있는 샐러드를 준비했습니다. 조금씩 다른 맛과 생김새, 영양분을 가진 잎채소를 한 팩으로 만나보세요.</p>
							</div>
						</div>
						<div class="goods_point">
							<h3>
								<span>Kurly's Check Point</span>
							</h3>
							<div class="context last">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv00000069642_1.jpg">
								</div>
							</div>
						</div>
						<div class='goods_desc'>
							<div class="context">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20170328/gv40000001406_1.jpg">
								</div>
								<p class="words">
									<strong class="sub_tit">뜯어서 바로바로 </strong> 간편 샐러드의 모든 채소는 이미 세척 및 전처리가 완료된 상태로, 씻을 필요 없이 바로 샐러드로 드실 수 있습니다. 편하게 뜯어 살짝 드레싱만 곁들여도 좋고요. 고기 먹을 때, 비빔밥이나 비빔국수의 고명이 필요할 때도 어울리죠. 한 끼 식사로 우유나 요거트만 먹기에는 뭔가 허전할 때 준비해도 좋습니다.
								</p>
							</div>
							<div class="context last">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20170328/gv10000001407_1.jpg">
								</div>
								<p class="words">
									<strong class="sub_tit">안심하고 즐기는 샐러드</strong> 생채소를 익히지 않고 그대로 먹어야 하는데 어디서, 어떻게 재배 가공됐는지 꼼꼼한 체크가 필수겠죠. 컬리는 샐러드 채소를 전문으로 생산, 가공, 유통하는 농업회사법인 미래원에서 만든 제품으로 준비했습니다. 채소를 직영농장에서 직접 재배하는 것은 물론 미니채소, 허브류를 전문적으로 가공하고 유통하는 곳이죠. 뛰어난 기술과 엄격한 기준 아래 전 공정이 이뤄지니 안심하고 드셔도 좋아요.
								</p>
							</div>
						</div>
						<div class="goods_tip">
							<h3>
								<span>Kurly’s Tip</span>
							</h3>
							<div class="tip_box">
								<div class="context last">
									<div class="pic">
										<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv40000069644_1.jpg">
									</div>
								</div>
							</div>
						</div>
						<div class='goods_pick'>
							<h3>
								<span>Kurly’s Pick</span>
							</h3>
							<div class="context ">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv00000069645_1.jpg">
								</div>
								<p class="words">
									<strong class="sub_tit"> <span class="option_tit">01. 손질 로메인</span></strong> <b>&#12539;중량</b> : 1팩(40g) <br /> <b>&#12539;테이스팅 노트</b> : 상추과의 채소지만 상추와 달리 쓴맛이 적고 씹는 맛이 아삭합니다. 겉잎은 약간 쓰지만 안쪽의 잎은 달고 향긋해요.<br />
								</p>
							</div>
							<div class="context ">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv10000069646_1.jpg">
								</div>
								<p class="words">
									<strong class="sub_tit"> <span class="option_tit">02. 손질 그린믹스</span></strong> <b>&#12539;중량</b> : 1팩(40g)<br /> <b>&#12539;구성</b> : 로메인, 적근대, 치커리 <br /> <b>&#12539;테이스팅 노트</b> : 약간의 단맛과 쌉쌀함이 적절히 어우러져요. 잎이 부드러운 채소를 주로 모았기에 식감이 좋습니다.
								</p>
							</div>
							<div class="context ">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv40000069647_1.jpg">
								</div>
								<p class="words">
									<strong class="sub_tit"> <span class="option_tit">03. 손질 양상추</span></strong> <b>&#12539;중량</b> : 1팩(60g)<br /> <b>&#12539;테이스팅 노트</b> : 진한 향이나 맛은 없지만 수분이 전체의 94~95% 정도를 차지해 싱그러운 식감이 뛰어납니다.
								</p>
							</div>
							<div class="context ">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv00000069648_1.jpg">
								</div>
								<p class="words">
									<strong class="sub_tit"> <span class="option_tit">04. 손질 적채&양배추</span></strong> <b>&#12539;중량</b> : 1팩(80g)<br /> <b>&#12539;구성</b> : 적채, 양배추<br /> <b>&#12539;테이스팅 노트</b> : 약간 쌉싸름하면서도 단맛이 돌아 고기와 잘 어울립니다. <br />
								</p>
							</div>
							<div class="context ">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv40000069649_1.jpg">
								</div>
								<p class="words">
									<strong class="sub_tit"> <span class="option_tit">05. 파프리카 슬라이스</span></strong> <b>&#12539;중량</b> : 1팩(100g)<br /> <b>&#12539;테이스팅 노트</b> : 피망과 닮았지만 매운맛이 없고 단맛이 돌아 그냥 깨끗하게 씻어서 먹기만 해도 새콤달콤하게 즐길 수 있어요. <br />
								</p>
							</div>
							<div class="context last">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv20000069650_1.jpg">
								</div>
								<p class="words">
									<strong class="sub_tit"> <span class="option_tit">06. 어린잎채소 믹스</span></strong> <b>&#12539;중량</b> : 1팩(40g)<br /> <b>&#12539;테이스팅 노트</b> : 떪은 맛이 적고 부드러운 식감이라 누구나 편하게 먹을 수 있는 제품이에요.
								</p>
							</div>
						</div>
						<div class='goods_tip'>
							<h3>
								<span>Kurly’s Tip</span>
							</h3>
							<div class='tip_box'>
								<div class='context'>
									<p class="words">
										<strong>섭취 전 참고해주세요</strong> 해당 상품의 패키지에는 세척 후 섭취하라는 안내 문구가 붙어있습니다. 이미 세척을 마친 제품이기 때문에 그대로 섭취하셔도 무방하다는 것을 알려드리며, 조금 더 깔끔하게 드시고 싶으시다면 한 번 더 세척하셔도 좋습니다.
									</p>
								</div>
							</div>
						</div>
						<div class='goods_note'>
							<h3>
								<span>Kurly’s Note</span>
							</h3>
							<div class="context last">
								<div class="pic">
									<img src="//img-cf.kurly.com/shop/data/goodsview/20170328/gv40000001427_1.jpg">
								</div>
								<p class="words"></p>
							</div>
						</div>
					</div>

				</div>
				<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor __active">상품이미지</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기 <span class="count_review"></span></a></li>

					<li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span>( 396 )</span></a></li>
				</ul>
				<div class="goods-view-infomation-content" id="goods-image">
					<div id="goods_pi">
						<p class="pic">
							<img src="//img-cf.kurly.com/shop/data/goodsview/20191126/gv00000069643_1.jpg">
						</p>
					</div>
				</div>
				<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor __active">상세정보</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기 <span class="count_review"></span></a></li>

					<li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span>( 396 )</span></a></li>
				</ul>
				<div class="goods-view-infomation-content" id="goods-infomation">
					<table width=100% border=0 cellpadding=0 cellspacing=1 class="extra-information">
						<tr>
							<th scope="row" class="goods-view-form-table-heading">상품명</th>
							<td>간편 샐러드 6종</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">유통기한</th>
							<td>농산물이므로 별도의 유통기한은 없으나 가급적 빨리 드시길 바랍니다.</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">포장단위</th>
							<td>손질 로메인:40g, 손질 그린믹스 40g, 손질 양상추 60g, 어린잎 채소믹스 40g, 손질 양배추+적채 80g, 파프리카 슬라이스 100g</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">인증여부</th>
							<td>무농약 이상</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">생산자/취급자</th>
							<td>농업회사법인 팜에이트(주)</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">관련법상 표기사항</th>
							<td>유전자 변형 농산물 미포함</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">원산지</th>
							<td>국내산</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">보관방법</th>
							<td>냉장보관</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">제조일자(포장일)</th>
							<td>제품 전/후면 별도표기</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">소비자상담실 전화번호</th>
							<td>마켓컬리 고객행복센터 (1644-1107)</td>
						</tr>
					</table>

					<div class="whykurly_area">
						<div class="row">
							<strong class="tit_whykurly">WHY KURLY</strong>
							<div class="txt_area" id="why_kurly">
								<list-icon-title-desc device="pc"></list-icon-title-desc>
							</div>
						</div>
					</div>


					<div class="happy_center fst">
						<div class="happy">
							<h4 class="tit">고객행복센터</h4>
							<p class="sub">
								<span class="emph">궁금하신 점이나 서비스 이용에 불편한 점이 있으신가요?</span><span class="bar"></span> 문제가 되는 부분을 사진으로 찍어<span class="bar"></span> 아래 중 편하신 방법으로 접수해 주시면<span class="bar"></span> 빠르게 도와드리겠습니다.
							</p>
						</div>
						<ul class="list">
							<li>
								<div class="tit">전화 문의 1644-1107</div>
								<div class="sub">오전 7시~오후 7시 (연중무휴)</div>
							</li>
							<li>
								<div class="tit">카카오톡 문의</div>
								<div class="sub">오전 7시~오후 7시 (연중무휴)</div>
								<div class="expend">
									카카오톡에서 ’마켓컬리’를 검색 후<br> 대화창에 문의 및 불편사항을<br> 남겨주세요.
								</div>
							</li>
							<li>
								<div class="tit">홈페이지 문의</div>
								<div class="sub">
									24시간 접수 가능<br> 로그인 > 마이컬리 > 1:1 문의
								</div>
								<div class="expend">고객센터 운영 시간에 순차적으로 답변해드리겠습니다.</div>
							</li>
						</ul>
					</div>
					<div class="happy_center order">
						<div class="happy unfold">
							<h4 class="tit">주문 취소 안내</h4>
							<ul class="sub">
								<li><strong class="emph">[입금 확인] 단계</strong> 마이컬리 > 주문 내역 상세페이지에서 직접 취소하실 수 있습니다.</li>
								<li><strong class="emph">[입금 확인] 이후 단계</strong> 고객행복센터로 문의해주세요.</li>
								<li><strong class="emph">결제 승인 취소 / 환불</strong> 결제 수단에 따라 영업일 기준 3~7일 내에 처리해드립니다.</li>
							</ul>
							<a data-child-id="orderCancel" href="#none" class="asked"> <span class="txt" data-open="자세히 보기" data-close="닫기">자세히 보기</span> <img src="https://res.kurly.com/pc/ico/2001/pc_arrow_open@2x.png" alt="아이콘" class="ico">
							</a>
						</div>
						<div class="happy_faq">
							<div id="orderCancel" class="questions hide"></div>
						</div>
					</div>
					<div class="happy_center lst">
						<div class="happy unfold">
							<h4 class="tit">교환 및 환불 안내</h4>
							<p class="sub">고객님의 단순 변심으로 인한 반품은 어려울 수 있으니 양해 부탁드립니다.</p>
							<a data-child-id="refund" href="#none" class="asked"> <span class="txt" data-open="자세히 보기" data-close="닫기">자세히 보기</span> <img src="https://res.kurly.com/pc/ico/2001/pc_arrow_open@2x.png" alt="아이콘" class="ico">
							</a>
						</div>
						<div class="happy_faq">
							<span class="item">01. 받으신 상품에 문제가 있는 경우</span>
							<div id="refund1" class="questions hide"></div>
						</div>
						<div class="happy_faq">
							<span class="item">02. 단순 변심, 주문 착오의 경우</span>
							<div id="refund2" class="questions hide"></div>
						</div>
						<div class="happy_faq">
							<span class="item">03. 교환·반품이 불가한 경우</span>
							<div id="refund3" class="questions hide"></div>
						</div>
					</div>

				</div>
				<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor __active">고객후기 <span class="count_review"></span></a></li>

					<li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span>( 396 )</span></a></li>
				</ul>
				<div class="goods-view-infomation-content" id="goods-review" data-load="0"></div>

				<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
					<li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기 <span class="count_review"></span></a></li>
					<li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor __active">상품문의 <span>( 396 )</span></a></li>
				</ul>
				<div class="goods-view-infomation-content" id="goods-qna" data-load="0"></div>
			</div>
		</div>
	</div>
</div>

<div id="layerDSR">
	<div class="bg_dim"></div>
	<div class="in_layer">
		<div class="inner_layer layer_star">
			<strong class="dsr_result">샛별배송 지역입니다.</strong>
			<div class="ani">
				<img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_kurly.png" src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="샛별배송 이미지">
			</div>
			<p class="dsr_desc">
				<strong class="emph">오늘 밤 11시 전</strong>까지 주문시<br> <strong class="emph">다음날 아침 7시</strong> 이전 도착합니다!
			</p>
			<p class="dsr_notice">샛별배송은 휴무 없이 매일 배송 합니다</p>
		</div>
		<div class="inner_layer layer_normal">
			<strong class="dsr_result">택배배송 지역입니다.</strong>
			<div class="ani">
				<img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_car.png" src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="택배배송 이미지">
			</div>
			<p class="dsr_desc">
				<strong class="emph">밤 8시 전</strong>까지 주문시<br> <strong class="emph">다음날</strong> 도착합니다!
			</p>
			<p class="dsr_notice">일요일은 배송 휴무로 토요일에는 주문 불가</p>
		</div>
		<div class="inner_layer layer_none">
			<strong class="dsr_result">배송 불가 지역입니다.</strong>
			<div class="ani">
				<img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_none.png" src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="배송불가 이미지">
			</div>
			<p class="dsr_desc">
				<strong class="emph">도로명 주소</strong>로 검색하셨다면,<br> <strong class="emph">지번 주소(구 주소)</strong>로 다시 시도해 주세요.
			</p>
			<p class="dsr_notice">배송지역을 확장하도록 노력하겠습니다!</p>
		</div>
		<div class="layer_btn1">
			<button type="button" class="btn_close" onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();">확인</button>
		</div>
		<button type="button" class="layer_close" onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();"></button>
	</div>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>