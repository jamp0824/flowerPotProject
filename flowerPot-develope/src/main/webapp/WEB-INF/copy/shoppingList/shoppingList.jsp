<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div class="layout-wrapper">
<p class="goods-list-position"></p>
</div>

<div class="layout-page-header">
	<h2 class="layout-page-title">장바구니</h2>
	<div class="pg_sub_desc">
		<p>주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
	</div>
</div>

<div class="user_form section_cart">
	<form id="viewCart" name="frmCart" method="post"
		action="/shop/order/order.php">
		<input type="hidden" name="mode" value="setOrder">
		<div class="tbl_comm cart_goods">
			<table class="tbl_comm tbl_header">
				<caption>장바구니 목록 제목</caption>
				<colgroup>
					<col style="width: 375px">
					<col style="width: 432px">
					<col style="width: 115px">
					<col style="width: 110px">
					<col style="width: auto">
				</colgroup>
				<thead>
					<tr>
						<th id="thSelect">
							<div class="all_select">
								<label class="label_check" :class="{checked : allChecked}">
									<input type="checkbox" name="allCheck" class="ico_check"
									v-model="allChecked" @change="onClickAllChecked">
								</label> <span class="tit"> 전체선택 (<span class="num_count"
									v-text="checkedCount"></span>/<span class="num_total"
									v-text="totalCount"></span>)
								</span>
							</div>
						</th>
						<th id="thInfo">상품 정보</th>
						<th id="thCount">수량</th>
						<th id="thCost">상품금액</th>
						<th id="thDelete"><span class="screen_out">삭제선택</span></th>
					</tr>
				</thead>
			</table>
			<div id="viewGoods">
				<div>
					<div class="view_goods">
						<table class="tbl_goods goods">
							<caption>장바구니 목록 내용</caption>
							<colgroup>
								<col style="width: 76px;">
								<col style="width: 100px;">
								<col style="width: 488px;">
								<col style="width: 112px;">
								<col style="width: 86px;">
								<col style="width: 110px;">
								<col style="width: auto;">
							</colgroup>
							<tbody>
								<tr>
									<td header="thSelect" class="goods_check"><label
										class="label_check checked"><input type="checkbox"
											name="" class="ico_check" value="31441"></label> <!----></td>
									<td header="thInfo" class="goods_thumb"><a
										href="/shop/goods/goods_view.php?&amp;goodsno=31441"
										class="thumb"><img
											src="https://img-cf.kurly.com/shop/data/goods/1542967126271i0.jpg"
											alt="상품이미지"
											onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'"></a></td>
									<td header="thInfo" class="goods_info">
										<!----> <a
										href="/shop/goods/goods_view.php?&amp;goodsno=31441"
										class="name"> <!---->[KF365] DOLE 실속 바나나 1.1kg
									</a>
										<dl class="goods_cost">
											<dt class="screen_out">판매가격</dt>
											<dd class="selling_price">
												<span class="num">2,850</span> <span class="txt">원</span>
											</dd>
											<!---->
											<!---->
										</dl> <!---->
										<p class="txt txt_limit">
											<!---->
										</p> <!----> <!---->
									</td>
									<td header="thInfo" class="goods_condition"><div
											class="condition">
											<!---->
										</div></td>
									<td header="thCount"><div class="goods_quantity">
											<div class="quantity">
												<strong class="screen_out">수량</strong>
												<button type="button" class="btn btn_reduce">
													<img
														src="https://res.kurly.com/pc/ico/1801/ico_minus_24x4_777.png"
														alt="감소">
												</button>
												<input type="text" readonly="readonly" class="inp_quantity">
												<button type="button" class="btn btn_rise">
													<img
														src="https://res.kurly.com/pc/ico/1801/ico_plus_24x24_777.png"
														alt="추가">
												</button>
											</div>
										</div></td>
									<td header="thCost"><dl class="goods_total">
											<dt class="screen_out">합계</dt>
											<dd class="result">
												<span class="num">5,700</span> <span class="txt">원</span>
											</dd>
										</dl></td>
									<td header="thDelete" class="goods_delete"><button
											type="button" class="btn btn_delete">
											<img
												src="https://res.kurly.com/pc/ico/1801/btn_close_24x24_514859.png"
												alt="삭제">
										</button></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<div v-if="noData" class="no_data">장바구니에 담긴 상품이 없습니다.</div>
			</div>
		</div>
		<div class="all_select select_option">
			<label class="label_check" :class="{checked : allChecked}"> <input
				type="checkbox" name="allCheck" class="ico_check"
				v-model="allChecked" @change="onClickAllChecked">
			</label> <span class="tit"> 전체선택 (<span class="num_count"
				v-text="checkedCount"></span>/<span class="num_total"
				v-text="totalCount"></span>)
			</span>
			<button type="button" class="btn_delete"
				@click="onCheckItem('selection')">선택 삭제</button>
			<button type="button" class="btn_delete"
				@click="onCheckItem('soldout')">품절 상품 삭제</button>
		</div>
		<div class="cart_result">
			<div class="cart_amount cell_except">
				<div class="amount_detail">
					<dl class="list amount_total">
						<dt class="tit">상품금액</dt>
						<dd class="result">
							<span class="inner_result"><span class="num">316,700</span>
								<span class="txt">원</span></span>
						</dd>
					</dl>
					<div class="deco deco_minus">
						<span class="ico fst"></span> <span class="ico"></span>
					</div>
					<dl class="list amount_dc">
						<dt class="tit">상품할인금액</dt>
						<dd class="result">
							<span class="inner_result"><span class="num">
									<!---->0
							</span> <span class="txt">원</span> <!----></span>
						</dd>
					</dl>
					<!---->
					<!---->
					<dl class="list amout_order" style="display: none;">
						<dt class="tit">주문금액</dt>
						<dd class="result">
							<span class="num"><span class="desc">= </span>316,700</span> <span
								class="txt">원</span>
						</dd>
					</dl>
				</div>
				<div class="deco deco_plus">
					<span class="ico fst"></span> <span class="ico"></span>
				</div>
				<dl class="list amount_delivery">
					<dt class="tit">배송비</dt>
					<dd class="result">
						<span class="inner_result"><span class="num">
								<!---->0
						</span> <span class="txt">원</span> <!----></span>
					</dd>
				</dl>
				<div class="deco deco_equal">
					<span class="ico fst"></span> <span class="ico"></span>
				</div>
				<dl class="list amout_result">
					<dt class="tit">결제예정금액</dt>
					<dd class="result">
						<span class="inner_result add"><span class="num">316,700</span>
							<span class="txt">원</span> <span class="txt_point">구매시
								15,835 원 <strong class="emph">적립예정</strong>
						</span> <!----></span>
					</dd>
				</dl>
			</div>
			<div class="notice_cart">*쿠폰, 적립금은 다음화면인 ‘주문서’에서 확인가능합니다.</div>
			<button type="button" id="btnOrder" class="btn_submit">
				주문하기 <span class="price">(316,700 원)</span>
			</button>
			<!---->
		</div>
		<p class="info_notice">‘입금확인’ 상태일 때는 주문내역 상세 페이지에서 직접 주문취소가 가능합니다.<br>‘입금확인’ 이후 상태에는 고객행복센터로 문의해주세요.</p>
	</form>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>