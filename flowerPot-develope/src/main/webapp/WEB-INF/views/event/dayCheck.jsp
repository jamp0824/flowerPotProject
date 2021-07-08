<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>


<jsp:include page="../info/header2.jsp"></jsp:include>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${pageContext.request.contextPath }/resources/images/logo_event.png');">
	<h2 class="ltext-105 cl0 txt-center"></h2>
</section>

<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> 홈 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> 
		<a href="product.html" class="stext-109 cl8 hov-cl1 trans-04"> 이벤트 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>

	</div>
</div>


<!-- Content page -->
<section class="bg0 p-t-62 p-b-100">
	<div class="container">
		<div class="row ">
			<div class="col-12 p-b-80">
				<img alt="" src="${pageContext.request.contextPath }/resources/images/event.jpg" style="width: 100%">
			</div>
			<div class="col-12">
				<a href="${pageContext.request.contextPath }/event/dayCheck_ok" class="btn btn-outline-danger btn-lg btn-block">출석체크</a>
			</div>
		</div>
	</div>
</section>

<%-- <c:if test="${today == 'False' }">
	<script>
	
		alert('이미 출첵');
		swal("이미 출석체크 하셨습니다","이미완료","warning");
	</script>
</c:if>
<c:if test="${today eq 'True' }">
	<script>
		alert('출첵 성공');
		swal("오늘의 출석 성공!!","출석성공","success");
	</script>
</c:if> --%>




<jsp:include page="../info/footer.jsp"></jsp:include>

<script type="text/javascript">
var today = '${today}';

var alert1 = function(msg, type) {
	swal({
		title : '',
		text : msg,
		type : type,
		timer : 1500,
		customClass : 'sweet-size',
		showConfirmButton : false
	});
}

if (today=='True') {
	swal("오늘의 출석 성공!!","출석성공","success");
}else if (today=='False') {
	//alert1('이미 출석체크 하셨습니다','false');
	swal("이미 출석체크 하셨습니다","이미완료","warning");
}
</script>

</head>
</html>