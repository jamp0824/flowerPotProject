<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="info/header2.jsp"></jsp:include>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${pageContext.request.contextPath }/resources/images/bg-02.jpg');">
	<h2 class="ltext-105 cl0 txt-center">결제완료</h2>
</section>

<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<h2 class="text-center my-3">카카오페이 결제가 정상적으로 완료되었습니다.</h2>
		<table class="table" style="width: 1000px;">
			<tbody>
				<tr>
					<td class="text-center">결제일시</td>
					<td class="text-center">${info.approved_at}</td>
				</tr>
				<tr>
					<td class="text-center">주문번호</td>
					<td class="text-center">${info.partner_order_id}</td>
				</tr>
				<tr>
					<td class="text-center">상품명</td>
					<td class="text-center">${info.item_name}</td>
				</tr>
				<tr>
					<td class="text-center">결제금액</td>
					<td class="text-center">${info.amount.total}</td>
				</tr>
				<tr>
					<td class="text-center">결제방법</td>
					<td class="text-center">${info.payment_method_type}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2"><a href="${pageContext.request.contextPath }" class="btn btn-outline-secondary btn-lg btn-block"> 홈으로 </a></th>
				</tr>
			</tfoot>
		</table>
		
	</div>
</section>

<jsp:include page="info/footer.jsp"></jsp:include>
