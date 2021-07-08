<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div class="layout-wrapper">
	<p class="goods-list-position"></p>
</div>
<div class="layout-page-header">
	<h2 class="layout-page-title">주문서</h2>
	<div class="pg_sub_desc">
		<p>주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
	</div>
</div>

<div id="main">
	<div id="content">
		<div class="user_form">
			<div class="layout-wrapper">
				<h2 class="tit_section fst">상품 정보</h2>
				<style type="text/css">
#orderGoodsList {
	display: none
}

.order_goodslist .show_tbl {
	display: block;
	position: relative;
	height: 94px
}

.order_goodslist .show_tbl .inner_show {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	padding: 20px 0 20px;
	border-top: 1px solid #333;
	border-bottom: 1px solid #ddd;
	font-size: 14px;
	line-height: 20px;
	text-align: center;
	letter-spacing: -0.3px
}

.order_goodslist .show_tbl .name {
	padding-bottom: 14px
}

.order_goodslist .show_tbl .btn_show {
	font-size: 14px;
	line-height: 20px;
	font-family: 'Noto Sans';
	font-weight: 700;
	color: #512772
}

.order_goodslist .show_tbl .btn_show .txt {
	padding-right: 12px
}

.order_goodslist .show_tbl .btn_show .ico {
	width: 14px;
	vertical-align: middle
}
</style>
				<div class="page_aticle order_goodslist">
					<div class="show_tbl" style="display: none;">
						<div class="inner_show">
							<div class="name">[KF365] DOLE 실속 바나나 1.1kg 외 1개 상품을 주문합니다.</div>
							<a class="btn_show" href="#none"><span class="txt">상세보기</span><img
								class="ico"
								src="https://res.kurly.com/pc/ico/1803/ico_arrow_open_28x16.png"
								alt="열기"></a>
						</div>
					</div>
					<div id="orderGoodsList" style="display: block;">
						<table class="tbl tbl_type1">
							<caption style="display: none">상품 정보 상세보기</caption>
							<colgroup>
								<col style="width: 120px">
								<col style="width: auto">
								<col style="width: 186px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><span class="screen_out">상품이미지</span></th>
									<th scope="col" class="th_info">상품 정보</th>
									<th scope="col">상품금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<input type="hidden" name="adultpro[]" value="0">
									<td class="thumb"><img
										src="//img-cf.kurly.com/shop/data/goods/1542967126781s0.jpg"
										width="150" class="goods-cart-product-image"
										onerror="this.src='/shop/data/skin/designgj/img/common/noimg_300.gif'">
									</td>
									<td class="info">
										<div class="name">[KF365] DOLE 실속 바나나 1.1kg</div>
										<dl>
											<dt class="screen_out">단일상품</dt>
											<dd>2개 / 개 당 2,850원</dd>
										</dl>
									</td>
									<td class="price">5,700원</td>
								</tr>
								<tr>
									<input type="hidden" name="adultpro[]" value="0">
									<td class="thumb"><img
										src="//img-cf.kurly.com/shop/data/goods/1556256041424s0.jpg"
										width="150" class="goods-cart-product-image"
										onerror="this.src='/shop/data/skin/designgj/img/common/noimg_300.gif'">
									</td>
									<td class="info">
										<div class="name">[선물세트] 송강당x컬리 기획세트 (퍼플)</div>
										<dl>
											<dt class="screen_out">단일상품</dt>
											<dd>1개 / 개 당 311,000원</dd>
										</dl>
									</td>
									<td class="price">311,000원</td>
								</tr>
							</tbody>
						</table>
					</div>
					<input type="hidden" value="2" id="itemCount"> <input
						type="hidden" value="[KF365] DOLE 실속 바나나 1.1kg" id="itemFstCount">
				</div>

				<form id="form" name="frmOrder" action="/shop/order/settle.php"
					method="post" onsubmit="return chkForm2(this)" class="order_view"
					novalidate="">
					<input type="hidden" name="ordno" value="1596526648718"> <input
						type="hidden" name="settlement_price" value="316700"> <input
						type="hidden" name="item_apply_coupon[]"> <input
						type="hidden" name="item_apply_coupon[]"> <input
						type="hidden" name="settlekind_option" value=""> <input
						type="hidden" name="starGoods" value=""> <input
						type="hidden" name="starGoodsCount" value="0"> <input
						type="hidden" name="tgd_pckg_no" value=""> <input
						type="hidden" name="tgd_item_no" value="">
					<div id="apply_coupon"></div>
					<input type="hidden" name="apr_coupon_data" value="">

					<h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
					<div class="order_section data_orderer">
						<table class="goodsinfo_table">
							<tbody>
								<tr class="fst">
									<th>보내는 분 *</th>
									<td class="td_readonly"><input type="text"
										name="nameOrder" value="윤신영" required="required"
										msgr="보내는 분의 이름을 적어주세요" style="width: 162px"
										readonly="readonly" class="read_only"></td>
								</tr>
								<tr class="field_phone">
									<th>휴대폰 *</th>
									<td class="td_readonly"><input style="width: 43px;"
										type="text" name="mobileOrder[]" value="010" size="3"
										maxlength="3" option="regNum" required="" label="주문자 휴대폰번호"
										readonly="readonly" class="read_only"> <span
										class="bar"><span style="left: -10px"></span></span> <input
										style="width: 50px;" type="text" name="mobileOrder[]"
										value="2124" size="4" maxlength="4" option="regNum"
										required="" label="주문자 휴대폰번호" readonly="readonly"
										class="read_only"> <span class="bar"><span
											style="left: -10px"></span></span> <input style="width: 50px;"
										type="text" name="mobileOrder[]" value="5690" size="4"
										maxlength="4" option="regNum" required="" label="주문자 휴대폰번호"
										readonly="readonly" class="read_only"></td>
								</tr>
								<tr>
									<th>이메일 *</th>
									<td class="td_readonly"><input style="width: 360px;"
										type="text" id="emaili" name="email"
										value="phantom_ysy@naver.com" required="" option="regEmail"
										readonly="readonly" class="read_only">
										<p class="txt_guide">
											<span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다.</span> <span
												class="txt txt_case2">정보 변경은 <span class="txt_desc">마이컬리
													&gt; 개인정보 수정</span> 메뉴에서 가능합니다.
											</span>
										</p></td>
								</tr>
							</tbody>
						</table>
					</div>



					<input type="hidden" name="zonecode" id="zonecode" value="21363">
					<input type="hidden" name="zipcode[]" id="zipcode0" value="">
					<input type="hidden" name="zipcode[]" id="zipcode1" value="">
					<input type="hidden" name="address" id="address"
						value="인천 부평구 청천동 200 (부평1차 금호타운)"> <input type="hidden"
						name="road_address" id="road_address"
						value="인천 부평구 안남로 272 (부평1차 금호타운)"> <input type="hidden"
						name="address_sub" id="address_sub" value="104동 1702호"> <input
						type="hidden" name="deliPoli" id="deliPoli" value="0"> <input
						type="hidden" id="means_inp" name="means" value="1379"> <input
						type="hidden" id="addressBookNo" name="addressbook_no"
						value="4596863">
					<h2 class="tit_section" id="divAddressWrapper">
						배송 정보 <span class="desc">*배송 휴무일: 샛별배송 (휴무없음), 택배배송 (일요일)</span>
					</h2>
					<div class="order_section order_address" id="dataDelivery">
						<h3 href="#none" class="section_crux">배송지</h3>
						<div class="section_full">
							<span class="no_address" id="noAddress" style="display: none;">배송지를
								입력해주세요</span> <span class="address" id="divDestination" style="">
								<span class="tag" id="addrTags"> <span class="badge star"
									id="addrBadge">샛별배송</span> <span class="badge default">기본배송지</span></span>
								<span class="addr" id="addrInfo">인천 부평구 청천동 200 (부평1차
									금호타운) 104동 1702호 <span class="num">[21363]</span>
							</span>
							</span>
							<div class="receiving" id="receiverInfo">윤신영, 010-2124-5690</div>
							<button type="button" id="btnUpdateAddress"
								data-address-no="3318397" class="btn active">변경</button>
						</div>
					</div>
					<div class="order_section order_reception" id="divReception"
						style="">
						<h3 class="section_crux">받으실 장소</h3>
						<div class="section_full">
							<span class="no_place" id="noReceptionArea">장소를 선택해 주세요</span> <span
								class="place" id="areaInfo" style="display: none;"></span> <span
								class="way" id="meanType" style="display: none;"></span>
							<button type="button" id="btnUpdateSubAddress"
								data-address-no="3318397" class="btn active">입력</button>

						</div>
					</div>
					<div id="divFrozen" class="order_section order_pack">
						<h3 class="section_crux">냉동상품 포장*</h3>
						<div class="section_full">
							<input type="hidden" name="isFrozenPack" value="0"> <label
								class="label_radio checked"> <input type="radio"
								name="frozenPack" value="0" checked="checked"> <span
								class="ico"></span> 종이박스 포장 (기본)
							</label> <label class="label_radio"><input type="radio"
								name="frozenPack" value="1"> <span class="ico"></span>
								스티로폼 박스 포장 </label>
						</div>
					</div>

					<div id="bnrOrder" class="bnr_order" style="display: block;">
						<a href="#layerShow" class="btn_layershow"><img
							src="https://res.kurly.com/pc/service/order/2004/bnr_order_allpaper.png"
							alt="All Paper Challenge"></a>
						<p class="screen_out">지구를 위해 모든 포장재를 종이로 새롭게 바뀐 포장재 알아보기</p>
					</div>

					<div class="tax_absolute">
						<div class="inner_sticky" id="sticky" style="top: 0px;">
							<h2 class="tit_section">결제 금액</h2>
							<div id="orderitem_money_info">
								<dl class="amount fst">
									<dt class="tit">주문 금액</dt>
									<dd class="price">316,700 원</dd>
								</dl>
								<dl class="amount sub">
									<dt class="tit">상품 금액</dt>
									<dd class="price" id="paper_goodsprice">316,700 원</dd>
								</dl>
								<dl class="amount sub">
									<dt class="tit">상품 할인</dt>
									<dd class="price sales_area">
										<span class="pm_sign normal" style="display: none;">-</span> <span
											id="special_discount_amount" class="normal"> 0 </span> 원
									</dd>
									<dd id="paper_sale" class="screen_out">- 0원</dd>
								</dl>
								<dl class="amount">
									<dt class="tit">배송비</dt>
									<dd class="price delivery_area">
										<div id="paper_delivery_msg1" style="display: none;">
											<span class="pm_sign" style="display: none;">+</span> <span
												id="paper_delivery" class="">0</span> <span
												id="paper_delivery2" style="display: none">0</span> 원
										</div>
										<div id="paper_delivery_msg2" style="display: block;">0
											원</div>
										<div id="paper_delivery_msg_extra" class="small"
											style="display: none;"></div>
										<span id="free_delivery_coupon_msg" class="screen_out">미적용</span>
										<input type="hidden" name="free_delivery" value="0">
									</dd>
								</dl>
								<dl class="amount">
									<dt class="tit">쿠폰 할인</dt>
									<dd class="price coupon_area">
										<span class="pm_sign" style="display: none;">-</span> <span
											id="apr_coupon_data">0 원</span> <input type="hidden"
											name="coupon" size="12" value="0" readonly="">
									</dd>
								</dl>
								<dl class="amount">
									<dt class="tit">적립금 사용</dt>
									<dd class="price">
										<span class="num pay_sum" id="paper_reserves">0 원</span> <input
											type="hidden" name="coupon_emoney" size="12" value="0"
											readonly="">
									</dd>
								</dl>
								<dl class="amount lst">
									<dt class="tit">최종 결제 금액</dt>
									<dd class="price">
										<span id="paper_settlement">316,700</span> <span class="won">원</span>
									</dd>
								</dl>
								<p class="reserve">
									<span class="ico">적립</span> 구매 시 <span class="emph"><span
										id="expectAmount">15,835</span> 원 (5%)</span>
								</p>
							</div>
						</div>
					</div>

					<div class="data_payment">
						<div class="tbl_left">
							<h2 class="tit_section">쿠폰 / 적립금</h2>

							<table class="goodsinfo_table heights defalut_pos">
								<tbody>
									<tr>
										<th class="coupon_set">쿠폰 적용</th>
										<td class="coupon_set">
											<div class="view_popselbox">
												<div id="popselboxView" style="display: block;">적용할
													쿠폰을 선택해주세요</div>
												<div id="popSelbox" class="layer_coupon">
													<ul id="addpopSelList" class="list">
														<li class="fst checked ">
															<div class="inner_item">
																<span class="txt_tit default">쿠폰 적용 안 함</span>
															</div>
														</li>
														<li style="pointer-events: none;">
															<div class="inner_item">
																<div class="item_row">
																	<div class="item_td left">
																		<span class="txt_apr coupon_na">사용불가</span><span
																			class="txt_is_dc" style="display: none;">원 할인</span>
																	</div>
																	<div class="item_td">
																		<span class="txt_tit coupon_na">[농할갑시다]농축산물기획전
																			20% 할인 (최대 1만원)</span> <span class="txt_desc coupon_na">농할갑시다
																			우리농축산물 기획전 상품 20% 할인 (최대 1만원)</span> <span
																			class="txt_expire coupon_na">유효기간 2020-08-09
																			까지</span>
																		<div id="apply_delivery_coupon"
																			class="is_delivery_coupon" style="display: none;">0</div>
																		<div class="txt_apply_coupon" style="display: none;">la_171626105</div>
																	</div>
																</div>
															</div>
														</li>
													</ul>
													<div class="coupon_list_default" style="display: none;">
														<li class="fst checked ">
															<div class="inner_item">
																<span class="txt_tit default">쿠폰 적용 안 함</span>
															</div>
														</li>
													</div>
													<div id="listItem" style="display: none">
														<div class="inner_item">
															<div class="item_row">
																<div class="item_td left">
																	<span class="txt_apr"></span>
																</div>
																<div class="item_td">
																	<span class="txt_tit"></span> <span class="txt_desc"></span>
																	<span class="txt_expire"></span>
																	<div id="apply_delivery_coupon"
																		class="is_delivery_coupon" style="display: none;"></div>
																	<div class="txt_apply_coupon" style="display: none;"></div>
																</div>
															</div>
														</div>
													</div>
													<button id="popSelboxCancel" type="button"
														class="btn btn_cancel screen_out">취소</button>
													<button id="popSelboxSelect" type="button"
														class="btn btn_conf screen_out">확인</button>
													<button id="popSelboxClose" type="button"
														class="btn_close screen_out">닫기</button>
												</div>
												<p class="txt">
													(보유쿠폰: <span class="coupon_sum">1</span> 개)
												</p>
											</div>
											<div class="txt_notavailable" style="display: none;">
												<p>사용 가능한 쿠폰이 없습니다.</p>
											</div>
											<div>
												<p class="txt_ques">
													<a href="#none" class="btn_link" id="happyTalk">쿠폰사용문의(카카오톡)
														&gt;</a>
												</p>
											</div>
										</td>
									</tr>
									<tr
										style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
										<th>적립금 적용 <input type="hidden" value="0"
											name="checkEmoney"></th>
										<td>
											<table class="order-disc-tbl coupon_area">
												<tbody>
													<tr>
														<input type="hidden" name="emoney" id="emoney" value="0">
														<td class="emoney_td_l no_emoney">사용 가능한 적립금이 없습니다.</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>


					<div class="data_method">
						<h2 class="tit_section" id="titFocusMethod">결제 수단</h2>

						<input type="hidden" name="escrow" value="N">
						<table class="goodsinfo_table tbl_left">
							<tbody>
								<tr>
									<th>일반결제</th>
									<td class="noline" style="position: relative"><label
										class="label_radio checked" id="settlekindCard"
										onclick="option_pay_standard('');"> <input
											type="radio" name="settlekind" value="c"
											onclick="input_escrow(this,'N');" checked="checked">
											신용카드
									</label></td>
								</tr>

								<tr class="card_detail">
									<th></th>
									<td>
										<div id="cardSelect">
											<div>
												<div class="card_select">
													<div class="select_box">
														<strong class="tit">카드를 선택해주세요</strong>
														<!---->
														<select name="card_code" class="list"><option
																disabled="disabled" value="">카드를 선택해주세요</option>
															<option value="61">현대 (무이자)</option>
															<option value="41">신한 (무이자)</option>
															<option value="31">비씨 (무이자)</option>
															<option value="11">KB국민 (무이자)</option>
															<option value="51">삼성 (무이자)</option>
															<option value="36">씨티 (무이자)</option>
															<option value="71">롯데 (무이자)</option>
															<option value="21">하나(외환) (무이자)</option>
															<option value="91">NH채움 (무이자)</option>
															<option value="33">우리 (무이자)</option>
															<option value="34">수협</option>
															<option value="46">광주 (무이자)</option>
															<option value="35">전북 (무이자)</option>
															<option value="42">제주</option>
															<option value="62">신협체크</option>
															<option value="38">MG새마을체크</option>
															<option value="39">저축은행체크</option>
															<option value="37">우체국카드</option>
															<option value="30">KDB산업은행</option>
															<option value="15">카카오뱅크</option></select>
													</div>
													<!---->
													<div class="select_box">
														<strong class="tit off">할부기간을 선택해주세요</strong>
														<!---->
														<!---->
													</div>
												</div>
												<!---->
												<!---->
												<!---->
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<th>CHAI 결제</th>
									<td><label class="label_radio"> <input
											type="radio" name="settlekind" value="chai"
											onclick="input_escrow(this,'N')"> <img
											src="https://res.kurly.com/pc/service/order/2001/logo_chi_x2.png"
											height="18" alt="Chai 결제"> <img
											src="https://res.kurly.com/pc/service/order/2008/bubble_chai_200801.png"
											height="20" alt="첫결제 시 3천원 즉시할인, 매 결제 2.5% 적립" class="bubble">
									</label></td>
								</tr>
								<tr>
									<th>토스 결제</th>
									<td><label class="label_radio"> <input
											type="radio" name="settlekind" value="toss"
											onclick="input_escrow(this,'N')"> <img
											src="http://res.kurly.com/pc/service/order/1912/toss-logo-signature.svg"
											height="18" alt="토스 결제">
									</label></td>
								</tr>
								<tr>
									<th>네이버페이 결제</th>
									<td class="noline"><label class="label_radio"> <input
											type="radio" name="settlekind" value="n"
											onclick="input_escrow(this,'N');"> <img
											src="//res.kurly.com/pc/service/order/1710/ico_naverpay_v3.png"
											height="20" alt="네이버 페이 로고">
									</label></td>
								</tr>
								<tr>
									<th>PAYCO 결제</th>
									<td><label class="label_radio"> <input
											type="radio" name="settlekind" value="t"
											onclick="input_escrow(this,'N');check_naverNcashUseAble();">

											<span style="display: inline-block"><img
												src="https://static-bill.nhnent.com/payco/checkout/img/v2/btn_checkout2.png"
												alt="PAYCO 간편결제" style="border: 0 none; vertical-align: top"></span>

									</label></td>
								</tr>
								<tr>
									<th>스마일페이 결제</th>
									<td><label class="label_radio"> <input
											type="radio" name="settlekind" value="s"
											onclick="input_escrow(this,'N')"> <img
											src="//res.kurly.com/pc/service/order/1712/ico_smilepay_v2.png"
											alt="스마일페이" height="18">
									</label></td>
								</tr>
								<tr>
									<th>휴대폰 결제</th>
									<td><label class="label_radio"> <input
											type="radio" name="settlekind" value="h"
											onclick="input_escrow(this,'N')"> 휴대폰
									</label></td>
								</tr>









								<tr>
									<td class="txt_notice" colspan="2">
										<ul>
											<li>※ 페이코, 네이버페이, 토스, 차이 결제는 결제 시 결제하신 수단으로만 환불되는 점
												양해부탁드립니다.</li>
											<li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 LG데이콤의
												구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>
											<li>※ 보안강화로 Internet Explorer 8 미만 사용 시 결제창이 뜨지 않을 수
												있습니다. <a href="/shop/board/view.php?id=notice&amp;no=207"
												target="_blank"> 공지 보러가기 &gt;</a>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="txt_notice" colspan="2"><div
											id="coupon_typinfo" style="display: none">무통장입금에서만
											사용가능한 쿠폰을 선택하였습니다. 다른 결제 수단을 선택하시려면 쿠폰을 제거 하여 주십시오.</div></td>
								</tr>
							</tbody>
						</table>
						<table class="goodsinfo_table tbl_nogoods">
							<tbody>
								<tr>
									<th>미출고 시 조치방법 *</th>
									<td><label for="undeliver_way-2"
										class="label_radio checked"> <input
											id="undeliver_way-2" name="undeliver_way" fw-msg="" value="2"
											type="radio" checked="checked"> 결제수단으로 환불
									</label> <label for="undeliver_way-1" class="label_radio"> <input
											id="undeliver_way-1" name="undeliver_way" value="0"
											type="radio"> 상품 입고 시 배송
									</label></td>
								</tr>
							</tbody>
						</table>
						<div id="cash" style="display: none;">
							<h2 class="tit_section">현금영수증발급</h2>
							<table class="goodsinfo_table">
								<tbody>
									<tr>
										<th>현금영수증</th>
										<td><label class="label_radio"> <input
												type="radio" name="cashreceipt" value="Y"
												onclick="cash_required()"> 신청
										</label> <label class="label_radio checked"> <input
												type="radio" name="cashreceipt" value="N"
												onclick="cash_required()" checked=""> 신청안함
										</label></td>
									</tr>
									<tr>
										<th>발행용도</th>
										<td><label class="label_radio checked"> <input
												type="radio" name="cashuseopt" value="0"
												onclick="setUseopt()" checked=""> 소득공제용
										</label> <label class="label_radio"> <input type="radio"
												name="cashuseopt" value="1" onclick="setUseopt()">
												지출증빙용
										</label></td>
									</tr>
									<tr>
										<th><span id="cert_0" style="display: block;">휴대폰번호</span>
											<span id="cert_1" style="display: none;">사업자번호</span></th>
										<td style="padding-top: 14px;"><input type="text"
											name="cashcertno" value="" option="regNum" class="line"
											placeholder="- 생략"></td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<h2 class="tit_section" id="titFocusAgree">개인정보 수집/제공*</h2>
					<table class="goodsinfo_table heights">
						<tbody>
							<tr>
								<td class="reg_agree">
									<div class="bg_dim"></div>
									<div class="check">
										<label class="inp_check label_check"> <input
											type="checkbox" name="ordAgree" value="y" required=""
											fld_esssential="" label="결제 진행 필수 동의"
											msgr="결제 진행 필수 동의 내용에 동의하셔야 결제가 가능합니다."> <span
											class="txt_checkbox">결제 진행 필수 동의</span>
										</label>
										<ul class="list_agree">
											<li><span class="subject">개인정보 수집 · 이용 동의 <span
													class="emph">(필수)</span></span> <a href="#terms"
												class="link_terms">약관확인</a></li>
											<li id="pgTerms" style="display: list-item;"><span
												class="subject">결제대행 서비스 약관 동의 <span class="emph">(필수)</span></span>
												<a href="#pgTerms" class="link_terms">약관확인</a></li>
										</ul>
										<div class="layer layer_agree">
											<div class="choice_agree view_terms">
												<div class="inner_layer">
													<div class="in_layer" id="viewTerms"></div>
													<button type="button" class="btn_ok">확인</button>
													<button type="button" class="btn_close">
														<span class="screen_out">레이어 닫기</span>
													</button>
												</div>
											</div>
											<div class="choice_agree view_pg">
												<div class="inner_layer">
													<div class="in_layer" id="viewPg"></div>
													<button type="button" class="btn_ok">확인</button>
													<button type="button" class="btn_close">
														<span class="screen_out">레이어 닫기</span>
													</button>
												</div>
											</div>

											<div class="choice_agree view_layer">
												<div class="inner_layer">
													<div class="in_layer in_allpaper">
														<img
															src="https://res.kurly.com/pc/service/order/2004/img_order_allpaper.png"
															alt="샛별배송 포장재가 종이로 바뀝니다.">
														<div class="screen_out">
															<p>식품의 신선함은 그대로, 사람에게도 환경에도 이로운 배송을 위해 모든 배송 포장재를 종이로
																바꿔 갑니다.</p>
															<dl>
																<dt>변경 전</dt>
																<dd>스티로폼 박스, 비닐 파우치, 지퍼백, 박스 테이프, 비닐 완충 포장재, 젤 아이스팩</dd>
																<dt>변경 후</dt>
																<dd>종이 박스, 종이 파우치, 종이 테이프, 종이 완충 포장재, 100% 워터팩</dd>
															</dl>
															<p>
																<strong>100% 워터팩 폐기 방법</strong> 버려도 환경에 무해한 물이 담겨 있습니다.
																내용물은 하수구에 버려주시고, 포장재는 분리배출 해주세요.
															</p>
														</div>
													</div>
													<button type="button" class="btn_ok">확인</button>
												</div>
											</div>
										</div>

									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="padding: 30px 0 14px; position: relative;"
						align="center" class="noline">
						<input type="submit" style="float: none" value="결제하기"
							class="bhs_button btn_payment action">
					</div>
				</form>
				<ul class="ord_notice">
					<li>* 직접 주문취소는 <strong class="emph">‘입금확인’</strong> 상태일 경우에만
						가능합니다.
					</li>
					<li>* 미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>