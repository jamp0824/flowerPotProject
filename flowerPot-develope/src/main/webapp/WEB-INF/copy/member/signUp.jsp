<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div class="page_aticle">
	<div class="type_form member_join ">
		<form id=form name=frmMember method=post action="#">
			<input type=hidden name=mode value="joinMember"> <input type="hidden" name="check_mobile" value=""> <input type="hidden" name="auth_finish_code" value=""> <input type=hidden name=rncheck value=""> <input type=hidden name=dupeinfo value=""> <input type=hidden name=pakey value=""> <input type=hidden name=foreigner value=""> <input type=hidden name=passwordSkin value="Y"> <input type=hidden name=private2 value=""> <input type=hidden name=private3 value=""> <input type=hidden name='return_url' value="">
			<div class="field_head">
				<h3 class="tit">회원가입</h3>
				<p class="sub">
					<span class="ico">*</span>필수입력사항
				</p>
			</div>
			<table class="tbl_comm">
				<tr class="fst">
					<th>아이디<span class="ico">*<span class="screen_out">필수항목</span></span></th>
					<td><input type="text" name="m_id" value="" maxlength="16" required fld_esssential option=regId label="아이디" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"> <input type="hidden" name="chk_id" required fld_esssential label="아이디중복체크" value=""> <a class="btn default" href="javascript:chkId()">중복확인</a>
						<p class="txt_guide square">
							<span class="txt txt_case1">6자 이상의 영문 혹은 영문과 숫자를 조합</span> <span class="txt txt_case2">아이디 중복확인</span>
						</p></td>
				</tr>
				<tr>
					<th>비밀번호<span class="ico">*<span class="screen_out">필수항목</span></span></th>
					<td><input type=password name=password required fld_esssential option=regPass label="비밀번호" maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요">
						<p class="txt_guide square">
							<span class="txt txt_case1">10자 이상 입력</span> <span class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span> <span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
						</p></td>
				</tr>
				<tr class="member_pwd">
					<th>비밀번호확인<span class="ico">*<span class="screen_out">필수항목</span></span></th>
					<td><input type=password name=password2 required fld_esssential option=regPass label="비밀번호" maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요">
						<p class="txt_guide square">
							<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
						</p></td>
				</tr>
				<tr>
					<th>이름<span class="ico">*<span class="screen_out">필수항목</span></span></th>
					<td><input type="text" name=name value="" required fld_esssential label="이름" placeholder="이름을 입력해주세요"></td>
				</tr>
				<tr>
					<th>이메일<span class="ico">*<span class="screen_out">필수항목</span></span></th>
					<td><input type="text" name="email" value="" data-email="" size=30 required fld_esssential option=regEmail label="이메일" placeholder="예: marketkurly@kurly.com"> <input type="hidden" name="chk_email" required fld_esssential label="이메일중복체크"> <a href="javascript:void(0)" onClick="chkEmail()" class="btn default">중복확인</a></td>
				</tr>
				<tr class="field_phone">
					<th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
					<td>
						<div class="phone_num">
							<input type="text" value="" pattern="[0-9]*" name="mobileInp" placeholder="숫자만 입력해주세요" class="inp"> <input type="hidden" name="mobile[]" id="mobile0" value="" required fld_esssential option=regNum label="휴대폰"> <input type="hidden" name="mobile[]" id="mobile1" value="" required fld_esssential option=regNum label="휴대폰"> <input type="hidden" name="mobile[]" id="mobile2" value="" required fld_esssential option=regNum label="휴대폰">
							<button id="btn_cert" class="btn default disabled" type="button">인증번호 받기</button>
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
				<tr>
					<th>주소<span class="ico">*<span class="screen_out">필수항목</span></span></th>
					<td class="field_address"><input type="hidden" name="zonecode" id="zonecode" size="5" value=""> <input type="hidden" name="zipcode[]" id="zipcode0" size="3" value=""> <input type="hidden" name="zipcode[]" id="zipcode1" size="3" value=""> <input type="hidden" name="deliPoli" id="deliPoli" size="1" value="">
						<div id="selectAddress">
							<input type="text" name="address" id="address" value="" required readonly="readonly" label="주소">
						</div> <a href="#none" id="addressSearch" class="search" onclick="popup('../proc/popup_address.php',530,500)"> <span id="addressNo" class="address_no" data-text="재검색">주소 검색</span>
					</a>
						<div id="selectAddressSub">
							<input type="text" name="address_sub" id="address_sub" value="" class="byteTotext" placeholder="나머지 주소를 입력해주세요"> <input type="hidden" name="road_address" id="road_address" value="">
							<p id="delivery"></p>
							<div class="count chk_bytes">
								<span class="bytes">0</span>자 / <span class="limit">50</span>자
							</div>
						</div>
						<p class="txt_guide">
							<span class="txt txt_case1">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
						</p></td>
				</tr>
				<tr class="select_sex">
					<th>성별</th>
					<td><label class=""> <input type="radio" name="sex" value="m"> <span class="ico"></span>남자
					</label> <label class=""> <input type="radio" name="sex" value="w"> <span class="ico"></span>여자
					</label> <label class="checked"> <input type="radio" name="sex" value="n" checked="checked"> <span class="ico"></span>선택안함
					</label></td>
				</tr>
				<tr class="birth field_birth">
					<th>생년월일</th>
					<td>
						<div class="birth_day">
							<input type="text" name=birth_year id="birth_year" pattern="[0-9]*" value="" label="생년월일" size=4 maxlength=4 placeholder="YYYY"> <span class="bar"></span> <input type="text" name=birth[] id="birth_month" pattern="[0-9]*" value="" label="생년월일" size=2 maxlength=2 placeholder="MM"> <span class="bar"></span> <input type="text" name=birth[] id="birth_day" pattern="[0-9]*" value="" label="생년월일" size=2 maxlength=2 placeholder="DD">
						</div>
						<p class="txt_guide">
							<span class="txt bad"></span>
						</p>
					</td>
				</tr>
				<tr class="route" id="selectRecommend">
					<th>추가입력 사항</th>
					<td>
						<div class="group_radio">
							<span class="radio_wrapper"> <label> <input type="radio" name="recommend" id="recommendId" label="추천인아이디"> <span class="ico"></span>추천인 아이디
							</label>
							</span> <span class="radio_wrapper"> <label> <input type="radio" name="recommend" id="eventName" label="참여이벤트명"> <span class="ico"></span>참여 이벤트명
							</label>
							</span>
						</div>
						<div class="input_wrapper">
							<input type="text" name="recommid" value="" class="inp" placeholder="추천인 아이디를 입력해주세요.">
							<p class="txt_guide">
								추천인 아이디와 참여 이벤트명 중 하나만 선택 가능합니다. <br> 가입 이후, 수정이 불가합니다. <br> 대소문자 및 띄어쓰기에 유의해주세요.
							</p>
						</div>
					</td>
				</tr>
				<tr class="reg_agree">
					<th>이용약관동의 <span class="ico">*<span class="screen_out">필수항목</span></span></th>
					<td>
						<div class="bg_dim"></div>
						<div class="check">
							<label class="check_agree label_all_check label_block"> <input type=checkbox name="agree_allcheck"> <span class="ico"></span>전체 동의합니다.
							</label>
							<p class="sub">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</p>
						</div>
						<div class="check_view">
							<label class="check_agree label_block"> <input type="checkbox" value="" name="agree" required label="이용약관"> <span class="ico"></span>이용약관 동의 <span class="sub">(필수)</span>
							</label> <a href="#none" class="link btn_link btn_agreement">약관보기 </a>
						</div>


						<div class="layer layer_agreement">
							<div class="inner_layer">
								<h4 class="tit_layer">
									이용약관 <span class="sub">(필수)</span>
								</h4>
								<div class="box_tbl" id="serviceView"></div>

								<button type="button" class="btn_ok">확인</button>
								<button type="button" class="btn_close">
									<span class="screen_out">레이어 닫기</span>
								</button>
							</div>
						</div>

						<div class="check_view">
							<label class="check_agree label_block"> <input type="checkbox" id="private1" name="private1" value="" required label="개인정보처리방침"> <span class="ico"></span>개인정보처리방침 동의 <span class="sub">(필수)</span>
							</label> <a href="#none" class="link btn_link btn_essential">약관보기 </a>
						</div>

						<div class="layer layer_essential">
							<div class="inner_layer">
								<div class="in_layer">
									<h4 class="tit_layer">
										개인정보 수집·이용 동의 <span class="sub">(필수)</span>
									</h4>
									<div class="box_tbl">
										<table cellpadding="0" cellspacing="0" width="100%">
											<caption class="screen_out">개인정보 수집·이용 동의 (필수)</caption>
											<thead>
												<tr>
													<th scope="row" class="tit1">수집 목적</th>
													<th scope="row" class="tit2">수집 항목</th>
													<th scope="row" class="tit3">보유 기간</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>이용자 식별 및 본인여부</td>
													<td rowspan="4">이름, 아이디, 비밀번호, 휴대폰번호, 이메일, 주소</td>
													<td rowspan="4">회원 탈퇴 즉시 파기 <br> <br>부정이용 방지를 위하여 30일 동안 보관 (아이디, 휴대폰 번호) 후 파기
													</td>
												</tr>
												<tr>
													<td>거점 기반 서비스 제공</td>
												</tr>
												<tr>
													<td>계약 이행 및 약관변경 등의 고지를 위한 연락, 본인의사 확인 및 민원 등의 고객 고충 처리</td>
												</tr>
												<tr>
													<td>부정 이용 방지, 비인가 사용방지 및 서비스 제공 및 계약의 이행</td>
												</tr>
											</tbody>
										</table>
									</div>
									<p class="txt_service">서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스를 이용하실 수 있습니다.</p>
								</div>
								<button type="button" class="btn_ok">
									<span class="txt_type">확인</span>
								</button>
								<button type="button" class="btn_close">
									<span class="screen_out">레이어 닫기</span>
								</button>
							</div>
							<button type="button" class="btn_close">
								<span class="screen_out">레이어 닫기</span>
							</button>
						</div>

						<div class="check_view">
							<input type="hidden" id="consentHidden" name="consent[1]" value=""> <label class=" check_agree label_block"> <input type="checkbox" name="hiddenCheck"> <span class="ico"></span>개인정보처리방침 동의 <span class="sub">(선택)</span>
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

						<div class="check_view">
							<label class="label_block check_agree "> <input type="checkbox" name="marketing"> <span class="ico"></span>무료배송, 할인쿠폰 등 혜택/정보 수신 동의 <span class="sub">(선택)</span>
							</label>
							<div class="check_event email_sms">
								<label class="label_block check_agree "> <input type="checkbox" name="sms" value="n"> <span class="ico"></span>SMS
								</label> <label class="label_block check_agree "> <input type="checkbox" name="mailling" value="n"> <span class="ico"></span>이메일
								</label>
							</div>
							<p class="sms_info">
								SMS 수신 동의 시 한달간 [5% 적립]과 [무료배송] 혜택 제공 <span class="sub">(첫 구매 1주일 내 적용)</span>
							</p>
						</div>
						<div class="check_view">
							<label class=" check_agree label_block"> <input type="checkbox" value="n" name="fourteen_chk" required label="만 14세 이상"> <span class="ico"></span>본인은 만 14세 이상입니다. <span class="sub">(필수)</span>
							</label>
						</div>
					</td>
				</tr>
			</table>
			<div id="formSubmit" class="form_footer">
				<button type="button" class="btn active btn_join" onclick="formJoinSubmit()">가입하기</button>
			</div>
		</form>
	</div>
	<!-- 
	<iframe id="ifrmRnCheck" name="ifrmRnCheck" style="display: none;"></iframe>
	<iframe id="ifrmHpauth" name="ifrmHpauth" style="display: none;"></iframe> -->

</div>

<jsp:include page="../info/footer.jsp"></jsp:include>



