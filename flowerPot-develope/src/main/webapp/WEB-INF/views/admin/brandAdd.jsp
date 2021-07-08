<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<jsp:include page="info/resources.jsp" />
<%--css,img,script등 정적자원 --%>
<script>
$(function() {
	let chk1 = false, chk2 = false, chk3 = true, chk4 = false; chk5 = false; //제대로된 입력정보 기준 true / false는 문제가있는 상태
	//회사 체크
	$('#company').on('keyup', function() {
		const company = $(this).val();
		console.log(company);
		
		$.ajax({
			type:"post",
			url: "${pageContext.request.contextPath}/admin/cmpnyCheck",
			headers:{
				"Content-Type": "application/json"
			},
	 		data: company, 
			dataType:"text",
			success:function(result){
				if(result === "OK") {
					$("#company").css("border", "3px solid green");
					$("#comCheck").html("<b style='font-size:14px; color:green;'>　사용 가능!</b>");	
					$('#company').focus();
					chk1 = true;
				} else {
					$("#company").css("border", "3px solid red");
					$("#comCheck").html("<b style='font-size:14px; color:red;'>　중복!</b>");		
					$("#company").focus();
					chk1 = false
				}
			}
			,error: function() {//DB에 데이터가 없을때 이곳에서 검증
			}
			
		});
	
	});
	
	//브랜드명 체크
	$('#bName').on('keyup', function() {
		const bName = $(this).val();
		console.log(bName);
		
		$.ajax({
			type:"post",
			url: "${pageContext.request.contextPath}/admin/bNameCheck",
			headers:{
				"Content-Type": "application/json"
			},
	 		data: bName, 
			dataType:"text",
			success:function(result){
				if(result === "OK") {
					$("#bName").css("border", "3px solid green");
					$("#bnmCheck").html("<b style='font-size:14px; color:green;'>　사용 가능!</b>");
					chk2 = true;

				} else {
					$("#bName").css("border", "3px solid red");
					$("#bnmCheck").html("<b style='font-size:14px; color:red;'>　중복!</b>");	
					$("#bName").focus();
					chk2 = false;
				}
			}
			,error: function() {//DB에 데이터가 없을때 이곳에서 검증
			}
			
		});
	
	});
	//사업자번호 체크
	$('#busNo').on('keyup', function() {
		const busNo = $(this).val();
		console.log(busNo);

		$.ajax({
			type:"post",
			url: "${pageContext.request.contextPath}/admin/busNoCheck",
			headers:{
				"Content-Type": "application/json"
			},
	 		data: busNo, 
			dataType:"text",
			success:function(result){
				if(result === "OK") {
					$("#busNo").css("border", "3px solid green");
					$("#bnoCheck").html("<b style='font-size:14px; color:green;'>　사용 가능!</b>");
					chk3 = true;

				} else {
					$("#busNo").css("border", "3px solid red");
					$("#bnoCheck").html("<b style='font-size:14px; color:red;'>　중복!</b>");						
					$("#busNo").focus();
					chk3 = false;
				}
			}
			,error: function() {//DB에 데이터가 없을때 이곳에서 검증
			}
			
		});		
	
	});
	//전화번호 체크
	$('#tel').on('keyup', function() {
		const tel = $(this).val();
		console.log(tel);
		
		$.ajax({
			type:"post",
			url: "${pageContext.request.contextPath}/admin/telCheck",
			headers:{
				"Content-Type": "application/json"
			},
	 		data: tel, 
			dataType:"text",
			success:function(result){
				if(result === "OK") {
					$("#tel").css("border", "3px solid green");
					$("#tCheck").html("<b style='font-size:14px; color:green;'>　사용 가능!</b>");
					chk4 = true;

				} else {
					$("#tel").css("border", "3px solid red");
					$("#tCheck").html("<b style='font-size:14px; color:red;'>　중복!</b>");						
					$("#tel").focus();
					chk4 = false;
				}
			}
			,error: function() {//DB에 데이터가 없을때 이곳에서 검증
			}
			
		});
	
	});
	//이메일 체크
	$('#email').on('keyup', function() {
		const email = $(this).val();
		console.log(email);
		
		$.ajax({
			type:"post",
			url: "${pageContext.request.contextPath}/admin/emailCheck",
			headers:{
				"Content-Type": "application/json"
			},
	 		data: email, 
			dataType:"text",
			success:function(result){
				if(result === "OK") {
					$("#email").css("border", "3px solid green");
					$("#eCheck").html("<b style='font-size:14px; color:green;'>　사용 가능!</b>");
					chk5 = true;

				} else {
					$("#email").css("border", "3px solid red");
					$("#eCheck").html("<b style='font-size:14px; color:red;'>　중복!</b>");
					$("#email").focus();
					chk5 = false;
				}
			}
			,error: function() {//DB에 데이터가 없을때 이곳에서 검증
			}
			
		});
	
	});
	$('#submit').click(function(e) {
		if($.trim($('#company').val())==''){
			alert('회사 이름을 입력하세요!');
			$('#company').val('').focus();
			return false;
		}

		if($.trim($('#bName').val())==''){
			alert('브랜드명을 입력하세요!');
			$('#bName').val('').focus();
			return false;
		}
		if($.trim($('#bnoCheck').val())==''){ //사업자번호 미입력시에도 가입시키기
			chk3=true;
		}
		if($.trim($('#tel').val())==''){
			alert('전화번호를 입력하세요!');
			$('#tel').val('').focus();
			return false;
		}
		if($.trim($('#email').val())==''){
			alert('이메일을 입력하세요!');
			$('#email').val('').focus();
			return false;
		}
		if($.trim($('#sample4_roadAddress').val())==''){
			alert('기본 주소가 비었습니다. 우편번호를 검색하세요!');
			$('#sample4_roadAddress').val('').focus();
			return false;
		}
		if(chk1 && chk2 && chk3 && chk4 && chk5) {
			//아이디 정보
			const company = $("#company").val();
			const brandName = $("#bName").val();
			const busNo = $("#busNo").val();
			const ceoName = $("#ceoName").val();
			const tel = $("#tel").val();
			const email = $("#email").val();
			const postcode = $("#sample4_postcode").val();
			const roadAddr = $("#sample4_roadAddress").val();
			const jibunAddr = $("#sample4_jibunAddress").val();
			const extraAddr = $("#sample4_extraAddress").val();
			const detailAddr = $("#sample4_detailAddress").val();
			const introduce = $("#introduce").val();
			
			const brand = {
				company: company,
				brandName: brandName,
				busNo: busNo,
				ceoName: ceoName,
				tel: tel,
				email: email,
				postcode: postcode,
				roadAddr: roadAddr,
				jibunAddr: jibunAddr,
				extraAddr: extraAddr,
				detailAddr: detailAddr,
				introduce: introduce
			};
			$.ajax({
				type: "POST", //서버에 전송하는 HTTP요청 방식
				url: "${pageContext.request.contextPath}/admin/brandAdd_ok", //서버 요청 URI
				headers: {
					"Content-Type": "application/json"
				}, //요청 헤더 정보
				dataType: "text", //응답받을 데이터의 형태
				data: JSON.stringify(brand), //서버로 전송할 데이터
				success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
					console.log("통신 성공!: " + result);
					if(result === "addSuccess") {
						alert("브랜드 등록 성공!");
						location.href="${pageContext.request.contextPath}/admin/brand";
						
					} else {
						alert("브랜드 등록 실패!");
					}
				}, //통신 성공시 처리할 내용들을 함수 내부에 작성.
				error: function() {
					console.log("통신 실패!");
				} //통신 실패 시 처리할 내용들을 함수 내부에 작성.
			});
		
		} else {
			alert('중복된 정보를 확인해주세요');
		}
	});
});


/* 미입력 유효성 방지 */
 
function check(){

}

</script>
</head>
<body>
	<div class="wrapper">
		<!-- 사이드바 -->
		<jsp:include page="info/sidebar.jsp" />
		<%--사이드바 --%>

		<div class="main-panel">
			<!-- header(nav) -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<a class="navbar-brand" href="#pablo"> 입점 관리 </a>
					<jsp:include page="info/header.jsp" />
					<%--헤더(네비) --%>

					<!-- 본문 시작 -->
					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-8">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">브랜드 등록</h4>
											<label>중복되는 타 회사와 타 브랜드 이름으로 등록할 수 없습니다.</label>
											
										</div>
										<div class="card-body">
											<form method="post" >
												<!-- url등록하기 -->
												<div class="row">
													<div class="col-md-4">
														<div class="form-group">
															<label>Company</label><b id="comCheck"></b>
															<input type="text" class="form-control" name="company" id="company" placeholder="Company">
														</div> 
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label>브랜드명</label><b id="bnmCheck"></b>
															<input type="text" class="form-control" name="brandName" id="bName" placeholder="브랜드명">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label>사업자 번호</label><b id="bnoCheck"></b>
															<input type="text" class="form-control" name="busNo" id="busNo" placeholder="대표">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-4">
														<div class="form-group">
															<label>대표</label>
															<input type="text" class="form-control" id="ceoName" placeholder="대표">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label>전화번호</label><b id="tCheck"></b>
															<input type="text" class="form-control"  id="tel"placeholder="전화번호">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label for="exampleInputEmail1">이메일</label><b id="eCheck"></b>
															<input type="email" class="form-control" id="email"placeholder="example@xxxxx.xxx">
														</div>
													</div>
												</div>



												<div class="row">
													<div class="col-md-3">
														<div class="form-group">
															<label>우편 번호</label>
															<input type="text" name="postcode" id="sample4_postcode" class="form-control" placeholder="우편 번호" />
														</div>
													</div>
													<div class="col-md-3" style="margin-top: 30px;">
														<div class="form-group">
															<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
															<br>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>도로명 주소</label>
															<input type="text" name="roadAddr" id="sample4_roadAddress" class="form-control" placeholder="도로명 주소">
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group">
															<label>지번 주소</label>
															<input type="text" name="jibunAddr" id="sample4_jibunAddress" class="form-control" placeholder="지번 주소">
														</div>
													</div>
												</div>
												<!-- span태그가 없으면 팝업창이 종료되지 않습니다. -->
												<span id="guide" style="color: #999; display: none"></span>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label>참고 주소</label>
															<input type="text" name="extraAddr" id="sample4_extraAddress" class="form-control" placeholder="참고 주소" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label>상세 주소</label>
															<input type="text" name="detailAddr" id="sample4_detailAddress" class="form-control" placeholder="상세 주소" />
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label>브랜드 소개</label>
															<textarea name="introduce" id="introduce" rows="5" cols="80" class="form-control" placeholder="Here can be your description"></textarea>
														</div>
													</div>
												</div>

												<button type="button" id="submit" class="btn btn-flat pull-right" onclick="return check();" style="background-color: #212b52; color: white; border: 1px solid #212b52;">등록</button>
												<div class="clearfix"></div>
											</form>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- 본문 끝 -->

					<!-- footer -->
					<jsp:include page="info/footer.jsp" />
					<%--푸터 --%>

				</div>
		</div>
</body>

<script type="text/javascript">
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

        demo.showNotification();

    });
</script>
<%--주소 --%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</html>

