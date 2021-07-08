/**
 * coupon.js
 */

function check(){
	if($.trim($('#coupName').val())==''){
		alert('쿠폰 이름을 입력하세요!');
		$('#coupName').val('').focus();
		return false;
	}
	if(($.trim($('#discMoney').val())=='') && ($.trim($('#discPercent').val())=='')){
		alert('할인액과 할인률중 하나 이상 입력하세요!');
		$('#discMoney').val('').focus();
		return false;
	}'#discPercent'
	/*if($.trim($('#discPercent').val())==''){
		alert('할인 율을 입력하세요!');
		$('#discPercent').val('').focus();
		return false;
	}*/
	if($.trim($('#startD').val())==''){
		alert('쿠폰 시작기간을 입력하세요!');
		$('#startD').val('').focus();
		return false;
	}
	if($.trim($('#endD').val())==''){
		alert('쿠폰 마감기간을 입력하세요!');
		$('#endD').val('').focus();
		return false;
	}
}