<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div class="section_login">
	<h3 class="tit_login">로그인</h3>
	<div class="write_form">
		<div class="write_view login_view">
			<form method="post" name="form" id="form" onsubmit="return checkReCaptcha();" action="#">
				<input type=hidden name=returnUrl value=""> <input type=hidden name=return_url value=""> 
				<input type=hidden name=close value=""> 
				<input type="text" name="m_id" size="20" tabindex="1" value="" placeholder="아이디를 입력해주세요"> 
				<input type="password" name="password" size="20" tabindex="2" placeholder="비밀번호를 입력해주세요">
				<div class="checkbox_save">
					<!--
					<label class="label_checkbox">  
					<input type="checkbox" id="chk_security" name="chk_security" value="y" onChange=""> 
						보안접속
					</label> 
					 -->
					<div class="login_search">
						<a href="#" class="link">아이디 찾기</a> <span class="bar"></span> <a href="#" class="link">비밀번호 찾기</a>
					</div>
				</div>
				<button type="submit" class="btn_type1">
					<span class="txt_type">로그인</span>
				</button>
			</form>
			<a href="#" class="btn_type2 btn_member"><span class="txt_type">회원가입</span></a>
		</div>
	</div>
</div>


<jsp:include page="../info/footer.jsp"></jsp:include>