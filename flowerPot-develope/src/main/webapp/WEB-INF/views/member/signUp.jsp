<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../info/header2.jsp"></jsp:include>

<style>
.double {
	border: dotted 0.5px #c5d2cf;
}
.
enroll {
	padding: 20%;
}
</style>


<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${pageContext.request.contextPath }/resources/images/logo_SIGN.png');">
	<h2 class="ltext-105 cl0 txt-center"></h2>
</section>
<section class="bg0 p-t-104 p-b-116">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-7">
				<!-- <h2 class="text-center">회원가입</h2> -->
				<form action="${pageContext.request.contextPath }/member/signUp_ok" name="signup" id="signUpForm" method="post">

					<div class="form-group">
						<label for="user_id" style="text-align: left">
							<p>
								<strong>아이디</strong>&nbsp;&nbsp;&nbsp;<span id="idChk"></span>
							</p>
						</label>
						<input type="text" class="form-control form-control-lg" name="id" id="user_id" aria-describedby="emailHelp" placeholder="숫자 + 영어: 4자~10자 입력해주세요 ^^">
						<small id="emailHelp" class="form-text text-muted"> </small>
					</div>
					<div class="form-group ">
						<label for="password" style="text-align: left"><p>
								<strong>비밀번호</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span>
							</p></label>
						<input type="password" class="form-control form-control-lg" name="password" id="password" placeholder="영문과 특수문자를 포함한 최소 8자를 입력해주세요 ^^ ">
					</div>
					<div class="form-group">
						<label for="password_check" style="text-align: left"><p>
								<strong>비밀번호확인</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span>
							</p></label>
						<input type="password" class="form-control form-control-lg" name="password2" id="password_check" placeholder="비밀번호가 일치해야합니다.ㅜㅜ">
					</div>

					<hr class="double">

					<br />

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="user_name"><p>
									<strong>이름</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span>
								</p></label>
							<input type="text" class="form-control form-control-lg " name="name" id="user_name" placeholder="한글로 최대 6자 입력해주세요 !!">
						</div>
						<div class="form-group col-md-6">
							<label for="user_nick"><p>
									<strong>닉네임</strong>&nbsp;&nbsp;&nbsp;<span id="nickChk"></span>
								</p></label>
							<input type="text" class="form-control form-control-lg" name="nickname" id="user_nick" placeholder="닉네임을 입력해주세요!!">
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="user_phone" style="text-align: left"><p>
									<strong>전화번호</strong><span id="phoneChk"></span>
								</p></label>
							<input type="tel" class="form-control form-control-lg" name="tel" id="user_phone" placeholder="(예시:- 하이픈 없이 입력해주세요)">
						</div>


						<div class="form-group col-md-4">
							<label for="user_name"><p>
									<strong>성별</strong>&nbsp;&nbsp;&nbsp;<span id="nickChk"></span>
								</p></label>
							<div style="text-align: center; padding-left: 70px;">
								<input type="radio" name="gender" id="exampleRadios1" value="M" style="display: inline-block;">
								<label for="exampleRadios1" style="display: inline-block"> 남자 </label>

								<input type="radio" name="gender" id="exampleRadios2" value="F" style="display: inline-block; margin-left: 30px;">
								<label for="exampleRadios2" style="display: inline-block;"> 여자 </label>
							</div>
						</div>

					</div>



					<div class="form-group email">
						<label for="user_email" style="text-align: left"><p>
								<strong>이메일</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span>
							</p></label>
						<input type="email" class="form-control form-control-lg test" name="email" id="user_email" placeholder="ex)aaa@naver.com">
						<br />
						<!-- <input type="button" class=" test2 btn btn-outline-secondary btn-block btn-lg" onclick="send_email();" value="인증번호 전송"> -->
						<br />

						<!-- <input type="text" class="form-control form-control-lg enternum" name="code_number" id="code_number" placeholder="인증번호 입력">
						<br />
						<input type="button" class="btn btn-outline-secondary btn-block btn-lg entercheck" onclick="code_check();" value="인증 번호 확인"> -->
					</div>

					<hr class="double">

					<div class="clear"></div>

					<br />


					<div class="form-group">

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="user_nick" style="text-align: left"><p>
										<strong>주소)우편번호</strong>&nbsp;&nbsp;&nbsp;<span id="nickChk"></span>
									</p></label>
								<input type="text" class="form-control form-control-lg" id="sample4_postcode" name="postcode" placeholder="우편번호">
							</div>

							<div class="form-group col-md-6">
								<label for="inputPassword4" > .</label>
								<input type="button" class="btn btn-outline-secondary btn-block btn-lg" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
							</div>
						</div>

						<input type="text" class="form-control form-control-lg" id="sample4_jibunAddress" name="parcel_address" placeholder="지번주소"><br/>

						<input type="text" class="form-control form-control-lg" id="sample4_roadAddress" name="street_address" placeholder="도로명주소"><br/>

						<input type="text" class="form-control form-control-lg" id="sample4_detailAddress" name="detail_address" placeholder="상세주소">

						<label for="user_codeNumber" style="text-align: left"></label><br/>

						<input type="text" class="form-control form-control-lg" id="sample4_extraAddress" name="more_information" placeholder="참고항목">
						
					</div>
					<button class="btn btn-outline-secondary btn-block btn-lg " id="signup-btn">등록</button>
					<br />
			</div>
		</div>
	</div>

	<!-- footer  -->
	<jsp:include page="../info/footer.jsp"></jsp:include>
</section>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	//start JQuery
	$(function() {
		const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
		const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
		const getName = RegExp(/^[가-힣]+$/);
		const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		const getPhone = RegExp(/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/);
		let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;
		chk6 = false;
		//회원가입 검증~~
		//ID 입력값 검증.
		$('#user_id').on('keyup',function() {
			if ($("#user_id").val() === "") {
				$('#user_id').css("background-color", "pink");
				$('#idChk').html('<b style="font-size:14px;color:red;">[아이디는 필수 정보에요!]</b>');
					chk1 = false;
				}
				//아이디 유효성검사
				else if (!getIdCheck.test($("#user_id").val())) {
					$('#user_id').css("background-color", "pink");
					$('#idChk').html('<b style="font-size:14px;color:red;">[영문자,숫자 4-14자]</b>');
						chk1 = false;
					}
				//ID 중복확인 비동기 처리
					else {
					//ID 중복확인 비동기 통신
					const id = $(this).val();
					console.log(id);
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/member/checkId",
						headers : {
						"Content-Type" : "application/json"
						},
						dataType : "text",
						data : id,
						success : function(result) {
							console.log(result);
							if (result === "OK") {
								$("#user_id").css("background-color","aqua");
								$("#idChk").html("<b style='font-size:14px; color:green;'>[아이디는 사용 가능!]</b>");
									chk1 = true;
								} else {
								$("#user_id").css("background-color","pink");
								$("#idChk")
								.html("<b style='font-size:14px; color:red;'>[아이디가 중복됨!]</b>");
									chk1 = false;
									}
								},error : function() {
									console.log("통신 실패!");
								}
						});
					}
			});
		
		$('#user_email')
				.on(
						'keyup',
						function() {
							if ($("#user_email").val() === "") {
								$('#user_email')
										.css("background-color", "pink");
								$('#emailChk')
										.html(
												'<b style="font-size:14px;color:red;">[이메일는 필수 정보에요!]</b>');
								chk5 = false;
							}
							//이메일 유효성검사
							else if (!getMail.test($("#user_email").val())) {
								$('#user_email')
										.css("background-color", "pink");
								$('#emailChk')
										.html(
												'<b style="font-size:14px;color:red;">[영문자,숫자 4-14자]</b>');
								chk5 = false;
							}
							//EMAIL 중복확인 비동기 처리
							else {
								//ID 중복확인 비동기 통신
								const email = $(this).val();
								console.log(email);
								$
										.ajax({
											type : "POST",
											url : "${pageContext.request.contextPath}/member/checkEmail",
											headers : {
												"Content-Type" : "application/json"
											},
											dataType : "text",
											data : email,
											success : function(result) {
												if (result === "OK") {
													$("#user_email").css(
															"background-color",
															"aqua");
													$("#emailChk")
															.html(
																	"<b style='font-size:14px; color:green;'>[이메일는 사용 가능!]</b>");
													chk5 = true;
												} else {
													$("#user_email").css(
															"background-color",
															"pink");
													$("#emailChk")
															.html(
																	"<b style='font-size:14px; color:red;'>[이메일이 중복됨!]</b>");
													chk5 = false;
												}
											},
											error : function() {
												console.log("통신 실패!");
											}
										});
							}
						});
		//전화번호 입력값 검증.
		$('#user_phone')
				.on(
						'keyup',
						function() {
							if ($("#user_phone").val() === "") {
								$('#user_phone')
										.css("background-color", "pink");
								$('#phoneChk')
										.html(
												'<b style="font-size:14px;color:red;">[전화번호는 필수 정보에요!]</b>');
								chk6 = false;
							}
							//전화번호 유효성검사
							else if (!getPhone.test($("#user_phone").val())) {
								$('#user_phone')
										.css("background-color", "pink");
								$('#phoneChk')
										.html(
												'<b style="font-size:14px;color:red;">[하이픈 없이 입력해주세요!]</b>');
								chk6 = false;
							}
							//전화번호 중복확인 비동기 처리
							else {
								//전화번호 중복확인 비동기 통신
								const phone = $(this).val();
								console.log(phone);
								$
										.ajax({
											type : "POST",
											url : "${pageContext.request.contextPath}/member/checkPhone",
											headers : {
												"Content-Type" : "application/json"
											},
											dataType : "text",
											data : phone,
											success : function(result) {
												if (result === "OK") {
													$("#user_phone").css(
															"background-color",
															"aqua");
													$("#phoneChk")
															.html(
																	"<b style='font-size:14px; color:green;'>[전화번호는 사용 가능!]</b>");
													chk6 = true;
												} else {
													$("#user_phone").css(
															"background-color",
															"pink");
													$("#phoneChk")
															.html(
																	"<b style='font-size:14px; color:red;'>[전화번호가 중복됨!]</b>");
													chk6 = false;
												}
											},
											error : function() {
												console.log("통신 실패!");
											}
										});
							}
						});
		//패스워드 입력값 검증.
		$('#password')
				.on(
						'keydown',
						function() {
							//비밀번호 공백 확인
							if ($("#password").val() === "") {
								$('#password').css("background-color", "pink");
								$('#pwChk')
										.html(
												'<b style="font-size:14px;color:red;">[패스워드는 필수정보!]</b>');
								chk2 = false;
							}
							//비밀번호 유효성검사
							else if (!getPwCheck.test($("#password").val())
									|| $("#password").val().length < 8) {
								$('#password').css("background-color", "pink");
								$('#pwChk')
										.html(
												'<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
								chk2 = false;
							} else {
								$('#password').css("background-color", "aqua");
								$('#pwChk')
										.html(
												'<b style="font-size:14px;color:green;">[√]</b>');
								chk2 = true;
							}
						});
		//패스워드 확인란 입력값 검증.
		$('#password_check')
				.on(
						'keyup',
						function() {
							//비밀번호 확인란 공백 확인
							if ($("#password_check").val() === "") {
								$('#password_check').css("background-color",
										"pink");
								$('#pwChk2')
										.html(
												'<b style="font-size:14px;color:red;">[패스워드확인은 필수정보!]</b>');
								chk3 = false;
							}
							//비밀번호 확인란 유효성검사
							else if ($("#password").val() != $(
									"#password_check").val()) {
								$('#password_check').css("background-color",
										"pink");
								$('#pwChk2')
										.html(
												'<b style="font-size:14px;color:red;">[위에랑 똑같이!!]</b>');
								chk3 = false;
							} else {
								$('#password_check').css("background-color",
										"aqua");
								$('#pwChk2')
										.html(
												'<b style="font-size:14px;color:green;">[√]</b>');
								chk3 = true;
							}
						});
		//이름 입력값 검증.
		$('#user_name')
				.on(
						'keyup',
						function() {
							//이름값 공백 확인
							if ($("#user_name").val() === "") {
								$('#user_name').css("background-color", "pink");
								$('#nameChk')
										.html(
												'<b style="font-size:14px;color:red;">[이름은 필수정보!]</b>');
								chk4 = false;
							}
							//이름값 유효성검사
							else if (!getName.test($("#user_name").val())) {
								$('#user_name').css("background-color", "pink");
								$('#nameChk')
										.html(
												'<b style="font-size:14px;color:red;">[이름은 한글로 ~]</b>');
								chk4 = false;
							} else {
								$('#user_name').css("background-color", "aqua");
								$('#nameChk')
										.html(
												'<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
								chk4 = true;
							}
						});
		/* $('#signup-btn').click(function(e) {
			if(chk1 && chk2 && chk3 && chk4) {
				//아이디 정보
				const id = $("#user_id").val();
				console.log("id: " + id);
				//패스워드 정보
				const pw = $("#password").val();
				console.log("pw: " + pw);
				//이름 정보
				const name = $("#user_name").val();
				console.log("name: " + name);
				
				const user = {
					account: id,
					password: pw,
					name: name
				};
				
				//클라이언트에서 서버와 통신하는 ajax함수(비동기 통신) 
				$.ajax({
					type: "POST", //서버에 전송하는 HTTP요청 방식
					url: "/controller/member/signUp_ok", //서버 요청 URI
					headers: {
						"Content-Type": "application/json"
					}, //요청 헤더 정보
					dataType: "text", //응답받을 데이터의 형태
					data: JSON.stringify(user), //서버로 전송할 데이터
					success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
						console.log("통신 성공!: " + result);
						if(result === "joinSuccess") {
							alert("회원가입에 성공했습니다!");
							location.href="/";
						} else {
							alert("회원가입에 실패했습니다!");
						}
					}, //통신 성공시 처리할 내용들을 함수 내부에 작성.
					error: function() {
						console.log("통신 실패!");
					} //통신 실패 시 처리할 내용들을 함수 내부에 작성.
				});
			
			} else {
				alert('입력정보를 다시 확인하세요.');			
			}
		}); */
		///////////////////////////////////////////////////////////////////////////////////////////
		//로그인 검증~~
		//ID 입력값 검증.
		$('#signInId')
				.on(
						'keyup',
						function() {
							if ($("#signInId").val() == "") {
								$('#signInId').css("background-color", "pink");
								$('#idCheck')
										.html(
												'<b style="font-size:14px;color:red;">[아이디는 필수!]</b>');
								chk1 = false;
							}
							//아이디 유효성검사
							else if (!getIdCheck.test($("#signInId").val())) {
								$('#signInId').css("background-color", "pink");
								$('#idCheck')
										.html(
												'<b style="font-size:14px;color:red;">[영문자,숫자 4-14자~]</b>');
								chk1 = false;
							} else {
								$('#signInId').css("background-color", "aqua");
								$('#idCheck')
										.html(
												'<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
								chk1 = true;
							}
						});
		//패스워드 입력값 검증.
		$('#signInPw')
				.on(
						'keyup',
						function() {
							//비밀번호 공백 확인
							if ($("#signInPw").val() === "") {
								$('#signInPw').css("background-color", "pink");
								$('#pwCheck')
										.html(
												'<b style="font-size:14px;color:red;">[패스워드는 필수!]</b>');
								chk2 = false;
							}
							//비밀번호 유효성검사
							else if (!getPwCheck.test($("#signInPw").val())
									|| $("#signInPw").val().length < 8) {
								$('#signInPw').css("background-color", "pink");
								$('#pwCheck')
										.html(
												'<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
								chk2 = false;
							} else {
								$('#signInPw').css("background-color", "aqua");
								$('#pwCheck')
										.html(
												'<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
								chk2 = true;
							}
						});
		//로그인 버튼 클릭 이벤트
		$("#signIn-btn").click(function() {
			if (chk1 && ch2) {
				//ajax통신으로 서버에서 값 받아오기 
				const id = $('#signInId').val();
				const pw = $('#signInPw').val();
				console.log("id: " + id);
				console.log("pw: " + pw);
				const userInfo = {
					account : id,
					password : pw
				};
				$.ajax({
					type : "POST",
					url : "/controller/member/signUp_ok",
					headers : {
						"Content-Type" : "application/json"
					},
					data : JSON.stringify(userInfo),
					dataType : "text",
					success : function(data) {
						console.log("result:" + data);
					}
				});
			} else {
				alert("입력정보를 다시 확인하세요!");
			}
		})
	});//end JQuery
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}
						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';
						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
	$(function send_email() {
		const boardInfo = {
			email : $("#user_email").val()
		}
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/membership/email_send",
			//headers:{"Content-Type":"application/json"},
			data : {
				'email' : email
			},
			success : function(result) {
				console.log(result);
				if (result == "OK") {
					alert("인증번호가 전송되었습니다");
				} else {
					alert("이메일 중복으로 사용불가");
				}
			}
		});
	});
	$(function code_check() {
	});
</script>