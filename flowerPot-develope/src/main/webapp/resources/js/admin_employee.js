/**
 * coupon.js
 */

function check(){
		if($.trim($('#empName').val())==''){
		alert('사원 이름을 입력하세요!');
		$('#empName').val('').focus();
		return false;
	}
}