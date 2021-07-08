<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<jsp:include page="myPageTop.jsp"></jsp:include>

<div class="page_aticle aticle_type2">
	<div id="snb" class="snb_my">
		<h2 class="tit_snb">마이컬리</h2>
		<div class="inner_snb">
			<ul class="list_menu">
				<li class="on"><a href="${pageContext.request.contextPath }/myPage/orderList">주문 내역</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/wishList">늘 사는 것</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/review">상품후기</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/emoney">적립금</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/coupon">쿠폰</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/myInfo_update">개인 정보 수정</a></li>
			</ul>
		</div>
		<a href="/shop/mypage/mypage_qna_register.php?mode=add_qna" class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1 문의하기</a>
	</div>
	<div class="page_section section_myinfo">
		<div class="head_aticle">
			<h2 class="tit">개인 정보 수정</h2>
		</div>
		<script src="/shop/data/skin/designgj/godo.password_strength.js" type="text/javascript"></script>
		<script src="/common_js/join_v1.js?ver=1.16.9"></script>
		<div class="type_form member_join member_mod">
			<form id=form name=frmMember method=post action="/shop/member/indb.php" onsubmit="return chkForm2(this)" novalidate>
				<input type=hidden name=mode value="modMember"> <input type="hidden" name="check_mobile" value="1"> <input type="hidden" name="auth_finish_code" value=""> <input type=hidden name=rncheck value=""> <input type=hidden name=dupeinfo value=""> <input type=hidden name=pakey value=""> <input type=hidden name=foreigner value="1"> <input type=hidden name=passwordSkin value="Y"> <input type=hidden name=m_id value="phantom1994">
				<table class="tbl_comm">
					<tr class="fst">
						<th>아이디<span class="ico">*<span class="screen_out">필수항목</span></span></th>
						<td><input type="text" value="phantom1994" readonly class="inp_read"></td>
					</tr>
					<tr>
						<th>현재 비밀번호</th>
						<td><input type="password" name="originalPassword" id="originalPassword" onblur="checkCurrentPassword(this);return;" /> <input type="hidden" name="originalPasswordCheck" value="1">
							<p class="txt_guide square">
								<span class="txt txt_case4 bad">현재 비밀번호를 확인해주세요</span>
							</p></td>
					</tr>
					<tr class="member_pwd">
						<th>새 비밀번호</th>
						<td><input type="password" name="newPassword" id="newPassword" label="새 비밀번호" option=regPass maxlength="16" class="reg_pw"> <input type="hidden" name="newPasswordCheck" value="0">
							<p class="txt_guide square">
								<span class="txt txt_case4">현재 비밀번호와 다르게 입력</span> <span class="txt txt_case1">10자 이상 입력</span> <span class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span> <span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
							</p></td>
					</tr>
					<tr class="member_pwd">
						<th>새 비밀번호 확인</th>
						<td><input type="password" name="confirmPassword" id="confirmPassword" label="새 비밀번호" option=regPass maxlength="16" class="confirm_pw">
							<p class="txt_guide square">
								<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
							</p></td>
					</tr>
					<tr>
						<th>이름<span class="ico">*<span class="screen_out">필수항목</span></span></th>
						<td><input type="text" name=name value="윤신영" required fld_esssential label="이름" placeholder="이름을 입력해주세요"></td>
					</tr>
					<tr>
						<th>이메일<span class="ico">*<span class="screen_out">필수항목</span></span></th>
						<td><input type="text" name="email" value="phantom_ysy@naver.com" data-email="phantom_ysy@naver.com" size=30 required option=regEmail label="이메일" placeholder="예: marketkurly@kurly.com" onblur="chkEmailChange($(this))"> <input type="hidden" name="chk_email" required label="이메일중복체크" value="1"> <a href="javascript:void(0)" onClick="chkEmail()" class="btn default">중복확인</a></td>
					</tr>
					<tr class="field_phone">
						<th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
						<td>
							<div class="phone_num">
								<input type="text" value="01021245690" pattern="[0-9]*" name="mobileInp" placeholder="숫자만 입력해주세요" class="inp" readonly="readonly"> <input type="hidden" name="mobile[]" id="mobile0" value="010" required option=regNum label="휴대폰"> <input type="hidden" name="mobile[]" id="mobile1" value="2124" required option=regNum label="휴대폰"> <input type="hidden" name="mobile[]" id="mobile2" value="5690" required option=regNum label="휴대폰">
								<button id="btn_cert" class="btn default" type="button">다른번호 인증</button>
							</div>
							<div id="codeNum" class="code_num">
								<input type="text" name="auth_code" id="auth_code" value="" size="6" maxlength="6" pattern="[0-9]*" label="인증번호 확인" disabled class="inp_confirm" oninput="if(value.length>6)value=value.slice(0,6);$(this).val($(this).val().replace(/[^0-9]/g,''));">
								<button id="btn_cert_confirm" class="btn default disabled" type="button">인증번호 확인</button>
								<p id="countdown" class="count_down"></p>
							</div>
							<p class="txt_guide">
								<span class="txt txt_case1"></span>
							</p>
						</td>
					</tr>
					<tr class="select_sex">
						<th>성별</th>
						<td><label class=" checked"> <input type="radio" name="sex" value="m" checked="checked"> <span class="ico"></span>남자
						</label> <label class=""> <input type="radio" name="sex" value="w"> <span class="ico"></span>여자
						</label> <label class=""> <input type="radio" name="sex" value="n"> <span class="ico"></span>선택안함
						</label></td>
					</tr>
					<tr class="birth field_birth">
						<th>생년월일</th>
						<td>
							<div class="birth_day">
								<input type="text" name=birth_year id="birth_year" pattern="[0-9]*" value="1994" label="생년월일" size=4 maxlength=4 placeholder="YYYY"> <span class="bar"></span> <input type="text" name=birth[] id="birth_month" pattern="[0-9]*" value="11" label="생년월일" size=2 maxlength=2 placeholder="MM"> <span class="bar"></span> <input type="text" name=birth[] id="birth_day" pattern="[0-9]*" value="29" label="생년월일" size=2 maxlength=2 placeholder="DD">
							</div>
							<p class="txt_guide">
								<span class="txt bad"></span>
							</p>
						</td>
					</tr>
					<tr>
						<th>선택약관 동의</th>
						<td class="reg_agree">
							<div class="check_view">
								<input type="hidden" id="consentHidden" name="consent[1]" value="y"> <label class="label_block check_agree checked"> <input type="checkbox" name="hiddenCheck" value="y" checked="checked"> <span class="ico"></span>개인정보처리방침 동의 <span class="sub">(선택)</span>
								</label> <a href="#none" class="link btn_link btn_choice">약관보기 </a>
							</div>

							<div class="layer layer_choice">
								<div class="inner_layer">
									<div class="in_layer">
										<h4 class="tit_layer">
											개인정보 수집·이용 동의 <span class="sub">(선택)</span>
										</h4>
										<div class="box_tbl">
											<table cellpadding="0" cellspacing="0" width="100%">
												<caption class="screen_out">개인정보의 수집 및 이용목적</caption>
												<thead>
													<tr>
														<th scope="row" class="tit1">수집 목적</th>
														<th scope="row" class="tit2">수집 항목</th>
														<th scope="row" class="tit3">보유 기간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>맞춤형 회원 서비스 제공</td>
														<td>성별, 생년월일</td>
														<td>회원 탈퇴 즉시 파기</td>
													</tr>
												</tbody>
											</table>
										</div>
										<p class="txt_service">동의를 거부하시는 경우에도 서비스는 이용하실 수 있습니다.</p>
									</div>
									<button type="button" class="btn_ok">
										<span class="txt_type">확인</span>
									</button>
									<button type="button" class="btn_close">
										<span class="screen_out">레이어 닫기</span>
									</button>
								</div>
							</div>

						</td>
					</tr>
					<tr style="display: none">
						<td cospan="2"><input id="nosendf" name="messge_time" fw-filter="isFill" fw-label="배송 시 받기" fw-msg="" value="0" type="hidden"> <input id="sendf" name="messge_time" fw-filter="isFill" fw-label="오전 7시에 받기" fw-msg="" checked value="1" type="hidden"> <input id="passwords" name="means_type" fw-filter="isFill" fw-label="공동현관 출입 특이사항" fw-msg="" value="비밀번호" type="hidden"> <input id="calls" name="means_type" fw-filter="isFill" fw-label="공동현관 출입 특이사항" fw-msg="" value="경비실호출" type="hidden"> <input id="send" name="means_type" fw-filter="isFill" fw-label="공동현관 출입 특이사항" fw-msg="" value="경비실로배송" type="hidden"> <input id="callm" name="means_type" fw-filter="isFill" fw-label="공동현관 출입 특이사항" fw-msg="" value="세대호출" type="hidden"> <input id="phonem" name="means_type" fw-filter="isFill" fw-label="공동현관 출입 특이사항" fw-msg="" value="연락처로전화" type="hidden"> <input id="free" name="means_type" fw-filter="isFill" fw-label="공동현관 출입 특이사항" fw-msg=""
							value="자유출입가능" type="hidden"
						> <input id="anys" name="means_type" fw-filter="isFill" fw-label="공동현관 출입 특이사항" fw-msg="" value="기타사항" type="hidden"> <input id="means_inp" name="means" fw-filter="" fw-label="비밀번호 및 호출방법" fw-msg="" class="inputTypeText" maxlength="50" value="1379 " type="hidden" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="true"> <input id="no_means_inp" type="hidden"> <input id="pass" name="pass_type" fw-filter="isFill" fw-label="동의" fw-msg="" value="y" type="hidden"> <input id="nopass" name="pass_type" fw-filter="isFill" checked fw-label="동의안함" fw-msg="" value="n" type="hidden"></td>
					</tr>
					<tr class="reg_agree">
						<th>이용약관동의 <span class="ico">*<span class="screen_out">필수항목</span></span>
						</th>
						<td>
							<div class="bg_dim"></div>
							<div class="check_view">
								<label class="label_block check_agree checked"> <input type="checkbox" name="marketing" value="y" checked="checked"> <span class="ico"></span>무료배송, 할인쿠폰 등 혜택/정보 수신 동의 <span class="sub">(선택)</span>
								</label>
								<div class="check_event email_sms">
									<label class="label_block check_agree checked"> <input type="checkbox" name="sms" value="y" checked="checked"> <span class="ico"></span>SMS
									</label> <label class="label_block check_agree checked"> <input type="checkbox" name="mailling" value="y" checked="checked"> <span class="ico"></span>이메일
									</label>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div id="formSubmit" class="form_footer">
					<a href="/shop/member/hack.php?&" class="btn default">탈퇴하기</a>
					<button type="submit" class="btn active">회원정보수정</button>
				</div>
			</form>
		</div>
		<iframe id="ifrmRnCheck" name="ifrmRnCheck" style="display: none;"></iframe>
		<iframe id="ifrmHpauth" name="ifrmHpauth" style="display: none;"></iframe>

	</div>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>