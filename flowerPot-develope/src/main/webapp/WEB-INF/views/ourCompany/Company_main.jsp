<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>화분 &mdash; 화장품을 분석하다</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- css & href -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ourCompany/css/video.css">
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<div id="overlayer"></div>
	  <div class="loader">
		<div class="spinner-border text-primary" role="status">
		  <span class="sr-only">Loading...</span>
		</div>
	</div>
	
<!-- Nav -->	
	<div class="site-wrap">
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-6 col-xl-2">
						<h1 class="mb-0 site-logo">
							<a href="${pageContext.request.contextPath}/index3" class="h2 mb-0">화분<span class="text-primary"></span>
							</a>
						</h1>
					</div>
					<div class="col-12 col-md-10 d-none d-xl-block">
						<nav class="site-navigation position-relative text-right" role="navigation">
							<ul	class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
								<li><a href="#home-section" class="nav-link">Home</a></li>
								<li class="has-children">
								<a href="#about-section" class="nav-link">About Us</a>
									<ul class="dropdown">
										<li><a href="#team-section" class="nav-link">Team : Light & Salt</a></li>
										<li><a href="#pricing-section" class="nav-link">History</a></li>
										<li><a href="#faq-section" class="nav-link">FAQ</a></li>
									</ul></li>
								<li><a href="#portfolio-section" class="nav-link">How can make it?</a></li>
								<li><a href="#services-section" class="nav-link">Our Services</a></li>
								<li><a href="#testimonials-section" class="nav-link">Interviews</a></li>
								<li><a href="#blog-section" class="nav-link">Media</a></li>
								<li><a href="#contact-section" class="nav-link">Contact Us</a></li>
							</ul>
						</nav>
					</div>
					
					<div class="col-6 d-inline-block d-xl-none ml-md-0 py-3"
						style="position: relative; top: 3px;">
						<a href="#" class="site-menu-toggle js-menu-toggle float-right">
							<span class="icon-menu h3"></span>
						</a>
					</div>
				</div>
			</div>
		</header>
		
<!-- 메인 & 비디오 -->	
		<div class="site-blocks-cover overlay" " data-aos="fade" id="home-section">
		 <div class="video-section">
            <video autoplay loop playsinline muted class="video">
            <source src="${pageContext.request.contextPath }/resources/ourCompany/video/wadiz_video.mp4" type="video/mp4">
            </video>
            </div>
            
 <!-- 메인 & letter -->
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-8 mt-lg-5 text-center">
						<h1 class="text-uppercase" data-aos="fade-up">우리는 옳은 일을 합니다.</h1>
						<p class="mb-5 desc" data-aos="fade-up" data-aos-delay="100">
							<br/>기업이 올바름을 우선으로 하면 빠르게 성장할 수 없다는 말을 바꿨습니다.
							 많은 분들의 노력으로 우리는 수많은 가치를 소중히 지킬 수 있었습니다.
                                                              우리들은 오늘도 세상을 한 뼘 더 건강하게 성장시키고 있습니다.
						</p>
						<div data-aos="fade-up" data-aos-delay="100">
							<a href="#contact-section" class="btn smoothscroll btn-primary mr-2 mb-2">Contact 화분</a>
						</div>
					</div>
				</div>
			</div>
			
<!-- 스크롤 -->
			<a href="#about-section" class="mouse smoothscroll"> 
			  <span class="mouse-icon"> 
			  <span class="mouse-wheel"></span>
			</span>
			</a>
		  </div>
		  
<!-- About us -->
		<div class="site-section cta-big-image" id="about-section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-12 text-center" data-aos="fade">
						<h2 class="section-title mb-3">About Us</h2>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-6 mb-5" data-aos="fade-up" data-aos-delay="">
						<figure class="circle-bg">
							<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/logo_02.png" alt="Image" class="img-fluid">
						</figure>
					</div>

					<div class="col-lg-5 ml-auto" data-aos="fade-up"
						data-aos-delay="100">
						<div class="mb-4">
							<h3 class="h3 mb-4 text-black">What is the '화분'?</h3>
							<p>화분은 화장품 리뷰, 매거진, 성분 등 다양한 정보를 제공하며 쇼핑까지 한번에 할 수
								있는 NO1. 화장품 정보 플랫폼입니다.</p>
						</div>

						<div class="mb-4">
							<ul class="list-unstyled ul-check success">
								<li>신뢰를 기반으로 화분만의 가치를 지켜나가는 일입니다.</li>
								<li>바른 생각과 신뢰를 바탕으로 성장하는 세상을 만듭니다.</li>
								<li>'모두'가 아닌 '누군가'에게 최고의 회사이길 꿈꿉니다.</li>
								<li>신뢰를 기반으로 소통하며 협력하는  Light & Salt 입니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
			
<!-- our Mission -->
		<section class="site-section">
			<div class="container">
				<div class="row mb-5 justify-content-center">
					<div class="col-md-7 text-center">
						<h2 class="section-title mb-3" data-aos="fade-up"
							data-aos-delay="">Our Mission</h2>
						<p class="lead" data-aos="fade-up" data-aos-delay="100">
						어플로 본 정보를 이제는 홈페이지에서!<br/>Everywhere, Whenever, For Everyone (E.W.F.E)</p>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6 mb-5" data-aos="fade-up" data-aos-delay="">

						<div class="owl-carousel slide-one-item-alt">
							<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/per.jpg" alt="Image" class="img-fluid">
							<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/good.jpg" alt="Image" class="img-fluid">
							<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/goal.jpg" alt="Image" class="img-fluid">
							<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/think.jpg" alt="Image" class="img-fluid">
						</div>
						<div class="custom-direction">
							<a href="#" class="custom-prev" style="background-color:  #66cdaa">
							<span><span	class="icon-keyboard_backspace"></span></span></a>
							<a href="#"	class="custom-next" style="background-color: #66cdaa">
							<span><span class="icon-keyboard_backspace"></span></span></a>
						</div>
					</div>
					
					<div class="col-lg-5 ml-auto" data-aos="fade-up"
						data-aos-delay="100">

						<div class="owl-carousel slide-one-item-alt-text">
							<div>
								<h2 class="section-title mb-3">끈기</h2>
								<p class="lead">쉽게 포기하지 않고 한계를 극복합니다.</p>
								<p>We don't give up easily and overcome limitations.</p>
								<p><a href="#" class="btn btn-primary mr-2 mb-2" >Learn More</a></p>
							</div>
							
							<div>
								<h2 class="section-title mb-3">최고지향</h2>
								<p class="lead">적당한 수준에 타협하지 않고, 늘 더 나은 것을  <br/>추구합니다.</p>
								<p>We don't compromise at the right level, we always seek for something better.</p>
								<p><a href="#" class="btn btn-primary mr-2 mb-2" >Learn More</a></p>
							</div>
							
							<div>
								<h2 class="section-title mb-3">목표달성</h2>
								<p class="lead">자율적으로 설정한 목표를 책임감 있게  <br/> 달성합니다.</p>
								<p>We achieve autonomously set goals responsibly .</p>
								<p><a href="#" class="btn btn-primary mr-2 mb-2" >Learn More</a></p>
							</div>
							
							<div>
								<h2 class="section-title mb-3">자기인식</h2>
								<p class="lead">자신에 대해 고민하고 점검하여 스스로를  <br/>개선합니다.</p>
								<p>We think about ourselves, check on ourselves, and improve ourselves. </p>
								<p><a href="#" class="btn btn-primary mr-2 mb-2" >Learn More</a></p>
							</div>
							
							<div>
								<h2 class="section-title mb-3">도전정신</h2>
								<p class="lead">끊임없이 도전하고 이를 통해 배웁니다.</p>
								<p>We constantly challenge and learn from it.</p>
								<p><a href="#" class="btn btn-primary mr-2 mb-2" >Learn More</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section><!-- our Mission -->

<!-- Our Team introduce -->	
		<section class="site-section border-bottom" id="team-section">
			<div class="container">
				<div class="row mb-5 justify-content-center">
					<div class="col-md-8 text-center">
						<h2 class="section-title mb-3" data-aos="fade-up"
							data-aos-delay="">Our Team: Light & Salt</h2>
						<p class="lead" data-aos="fade-up" data-aos-delay="100">
						빛은 어둠속에서도 찬란하게 빛을 바랍니다. <br/> 소금은 사람 뿐만 아니라 음식에도 중요한 요소입니다. 
					    <br/> 우리는 세상의  <strong>&ldquo;Light & Salt&rdquo;</strong> 으로서 이 세상에서 가장
					    <br/>영향력있는 사람이 될 것입니다.</p>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up"
						data-aos-delay="">
						<div class="team-member">
							<figure>
								<ul class="social">
									<li><a href="https://github.com/yenow"><span class="icon-facebook"></span></a></li>
									<li><a href="https://github.com/yenow"><span class="icon-twitter"></span></a></li>
									<li><a href="https://github.com/yenow"><span class="icon-linkedin"></span></a></li>
									<li><a href="https://github.com/yenow"><span class="icon-instagram"></span></a></li>
								</ul>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/YS.jpg" alt="Image" class="img-fluid">
							</figure>
							<div class="p-3">
								<h3>윤신영</h3>
								<span class="position">Yun Sin young</span>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up"
						data-aos-delay="100">
						<div class="team-member">
							<figure>
								<ul class="social">
									<li><a href="https://github.com/jamp0824"><span class="icon-facebook"></span></a></li>
									<li><a href="https://github.com/jamp0824"><span class="icon-twitter"></span></a></li>
									<li><a href="https://github.com/jamp0824"><span class="icon-linkedin"></span></a></li>
									<li><a href="https://github.com/jamp0824"><span class="icon-instagram"></span></a></li>
								</ul>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/AJ.jpg" alt="Image" class="img-fluid">
							</figure>
							<div class="p-3">
								<h3>안준언</h3>
								<span class="position">Ahn Jun on</span>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up"
						data-aos-delay="200">
						<div class="team-member">
							<figure>
								<ul class="social">
									<li><a href="https://github.com/krinu318995"><span class="icon-facebook"></span></a></li>
									<li><a href="https://github.com/krinu318995"><span class="icon-twitter"></span></a></li>
									<li><a href="https://github.com/krinu318995"><span class="icon-linkedin"></span></a></li>
									<li><a href="https://github.com/krinu318995"><span class="icon-instagram"></span></a></li>
								</ul>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/KW.jpg" alt="Image" class="img-fluid">
							</figure>
							<div class="p-3">
								<h3>권누리</h3>
								<span class="position">Kwon Nu ri</span>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up"
						data-aos-delay="">
						<div class="team-member">
							<figure>
								<ul class="social">
									<li><a href="https://github.com/aseongen"><span class="icon-facebook"></span></a></li>
									<li><a href="https://github.com/aseongen"><span class="icon-twitter"></span></a></li>
									<li><a href="https://github.com/aseongen"><span class="icon-linkedin"></span></a></li>
									<li><a href="https://github.com/aseongen"><span class="icon-instagram"></span></a></li>
								</ul>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/se.jpg" alt="Image" class="img-fluid">
							</figure>
							<div class="p-3">
								<h3>박성은</h3>
								<span class="position">Park Seong eun</span>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up"
						data-aos-delay="100">
						<div class="team-member">
							<figure>
								<ul class="social">
									<li><a href="https://github.com/YooHyeok"><span class="icon-facebook"></span></a></li>
									<li><a href="https://github.com/YooHyeok"><span class="icon-twitter"></span></a></li>
									<li><a href="https://github.com/YooHyeok"><span class="icon-linkedin"></span></a></li>
									<li><a href="https://github.com/YooHyeok"><span class="icon-instagram"></span></a></li>
								</ul>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/UJ.jpg" alt="Image" class="img-fluid">
							</figure>
							<div class="p-3">
								<h3>유재혁</h3>
								<span class="position">Yoo Jae hyeok</span>
							</div>
						</div>
					</div>
	
					<div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up"
						data-aos-delay="200">
						<div class="team-member">
							<figure>
								<ul class="social">
									<li><a href="#"><span class="icon-facebook"></span></a></li>
									<li><a href="#"><span class="icon-twitter"></span></a></li>
									<li><a href="#"><span class="icon-linkedin"></span></a></li>
									<li><a href="#"><span class="icon-instagram"></span></a></li>
								</ul>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/pooh.jpg" alt="Image" class="img-fluid">
							</figure>
							<div class="p-3">
								<h3>이정규</h3>
								<span class="position">Lee Jeong Kyu</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
<!-- Course_Our Pictures -->
		<section class="site-section" id="portfolio-section">
			<div class="container">
				<div class="row mb-3">
					<div class="col-12 text-center" data-aos="fade">
						<h2 class="section-title mb-3">How can make it?</h2>
					</div>
				</div>

				<div class="row justify-content-center mb-5" data-aos="fade-up">
					<div id="filters" class="filters text-center button-group col-md-7">
						<button class="btn btn-primary active" data-filter="*">All</button>
						<button class="btn btn-primary" data-filter=".web">Present</button>
						<button class="btn btn-primary" data-filter=".design">Mid-Term</button>
						<button class="btn btn-primary" data-filter=".brand">First</button>
					</div>
				</div>
<!-- 01 -->	
				<div id="posts" class="row no-gutter">
					<div class="item web col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/ppt_main.JPG" class="item-wrap fancybox" data-fancybox="gallery2"> 
						<span class="icon-search2"></span>
						<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/ppt_main.JPG">
						</a>
					</div>
<!-- 02 -->						
					<div class="item web col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/All02.JPG" class="item-wrap fancybox" data-fancybox="gallery2"> 
						<span class="icon-search2"></span>
						<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/All02.JPG">
						</a>
					</div>
<!-- 03 -->	
					<div class="item brand col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/study.png" class="item-wrap fancybox" data-fancybox="gallery2"> 
						<span class="icon-search2"></span>
						<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/study.png">
						</a>
					</div>
<!-- 04 -->	
					<div class="item design col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/All01.jpg" class="item-wrap fancybox" data-fancybox="gallery2"> 
						<span class="icon-search2"></span>
						<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/All01.jpg">
						</a>
					</div>
<!-- 05 -->	
					<div class="item brand col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/ysy.jpg" class="item-wrap fancybox"
							data-fancybox="gallery2"> <span class="icon-search2"></span>
							<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/ysy.jpg">
						</a>
					</div>
<!-- 06 -->	
					<div class="item web col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/insta_pre.jpg" class="item-wrap fancybox"
							data-fancybox="gallery2"> <span class="icon-search2"></span>
							<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/insta_pre.jpg">
						</a>
					</div>
<!-- 07 -->	
					<div class="item design col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/muffin2.jpg" class="item-wrap fancybox"
							data-fancybox="gallery2"> <span class="icon-search2"></span>
							<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/muffin.jpg">
						</a>
					</div>
<!-- 08 -->	
					<div class="item design col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/all.jpg" class="item-wrap fancybox"
							data-fancybox="gallery2"> <span class="icon-search2"></span>
							<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/UI_Pre.jpg">
						</a>
					</div>
<!-- 09 -->				
					<div class="item web col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/color_test.JPG" class="item-wrap fancybox"
							data-fancybox="gallery2"> <span class="icon-search2"></span>
							<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/color_test.JPG">
						</a>
					</div>
<!-- 10 -->
					<div class="item brand col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/css_pra.png" class="item-wrap fancybox"
							data-fancybox="gallery2"> <span class="icon-search2"></span>
							<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/css_pra.png">
						</a>
					</div>
<!-- 11 -->
					<div class="item design col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/login_practice.JPG" class="item-wrap fancybox" data-fancybox="gallery2">
						 <span class="icon-search2"></span>
							<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/login_practice.JPG">
						</a>
					</div>
<!-- 12 -->
					<div class="item web col-sm-6 col-md-4 col-lg-4 col-xl-3 mb-4">
						<a href="${pageContext.request.contextPath }/resources/ourCompany/images2/yjh.jpg" class="item-wrap fancybox" data-fancybox="gallery2"> 
						<span class="icon-search2"></span>
						<img class="img-fluid" src="${pageContext.request.contextPath }/resources/ourCompany/images2/yjh.jpg">
						</a>
					</div>
					
					
				</div>
			</div>
		</section>
		
<!-- Our Services -->
		<section class="site-section border-bottom bg-light" id="services-section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-12 text-center" data-aos="fade">
						<h2 class="section-title mb-3">Our Services</h2>
					</div>
				</div>
				
				<div class="row align-items-stretch">
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up">
						<div class="unit-4">
							<div class="unit-4-icon mr-4">
							 <span class="text-primary flaticon-startup"></span>
							</div>
							<div>
								<h3>가장 믿을 만한 화장품 랭킹</h3>
								<p>사용자들의 데이터로 만들어지는 화분 랭킹, 카테고리, 브랜드별 원하는 랭킹을 바로 확인하세요</p>
								<p><a href="#" style="color: #66cdaa">Learn More</a></p>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up"
						data-aos-delay="100">
						<div class="unit-4">
							<div class="unit-4-icon mr-4">
								<span class="text-primary flaticon-graphic-design"></span>
							</div>
							<div>
								<h3>구매하고 싶은 품목만 결정하면 끝!</h3>
								<p>많은 브랜드에 고민은 그만! <br/> 화분은 여러 셀럽, MD, 화분인과 함께합니다. 
								<br/>함께 생각을 나누고, 다양한 정보를 양손 두둑히 가져가세요</p>
								<p><a href="#" style="color: #66cdaa">Learn More</a></p>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up" data-aos-delay="200">
						<div class="unit-4">
							<div class="unit-4-icon mr-4">
								<span class="text-primary flaticon-settings"></span>
							</div>
							
							<div>
								<h3>전문 에디터가 만드는 뷰티 콘텐츠</h3>
								<p>초보에겐 기초팁을, 고수에겐 고급정보를! <br/> 매일 발행되는 화분's PICK를 만나보세요.</p>
								<p><a href="#" style="color: #66cdaa">Learn More</a></p>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up"
						data-aos-delay="">
						<div class="unit-4">
							<div class="unit-4-icon mr-4">
								<span class="text-primary flaticon-idea"></span>
							</div>
							<div>
								<h3>제품별로 쉽게 보는 화장품 전 성분</h3>
								<p>화분은 제품 정보 및 전 성분 정보를 제공합니다.<br/> 사용중인 화장품의 모든 것을 알 수 있습니다.</p>
								<p><a href="#" style="color: #66cdaa">Learn More</a></p>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up" data-aos-delay="100">
						<div class="unit-4">
							<div class="unit-4-icon mr-4">
								<span class="text-primary flaticon-smartphone"></span>
							</div>
							<div>
								<h3>보고 ● 듣고 ● 대화하고 오감이 즐겁다</h3>
								<p>
									직접 선택하고, 평가하는 다양한 이벤트! <br /> 화분인들의 오감을 짜릿 하게, 선물들은 팡팡! <br />
									안해본 사람은 있어도 한번만 해본사람은 없습니다.
								</p>
								<p><a href="#" style="color: #66cdaa">Learn More</a></p>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up"
						data-aos-delay="200">
						<div class="unit-4">
							<div class="unit-4-icon mr-4">
								<span class="text-primary flaticon-head"></span>
							</div>
							<div>
								<h3>지구를 위한 즐거운 실천, 그린 라이프</h3>
								<p>
									지구를 생각하는 생활속 실천! <br/> 화분의 그린 라이프는 배송시 일회용품을 줄이고, 구매와 동시에 쌓이는
									기부금들이 전세계 아이들에게 꿈과 희망을 줍니다.
								</p>
								<p><a href="#" style="color: #66cdaa">Learn More</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
<!-- Interviews -->
		<section class="site-section testimonial-wrap" id="testimonials-section" data-aos="fade">
			<div class="container">
				<div class="row mb-5">
					<div class="col-12 text-center">
						<h2 class="section-title mb-3">Interviews</h2>
					</div>
				</div>
			</div>
			
			<div class="slide-one-item home-slider owl-carousel">
				<div>
					<div class="testimonial">
						<blockquote class="mb-5">
							<p>&ldquo;어떤 난제를 받아도 끝까지 고민하고, 서로 의기투합해서 일합니다.
							<br/>더 많은 사람에게 알리고 싶고, 서로가 서로에게 빛이 되는 곳입니다.
							<br/>화분은 모두의 시간이 모여 만들어진 소중한 회사이자 작품입니다.&rdquo;</p>
						</blockquote>
						<figure	class="mb-4 d-flex align-items-center justify-content-center">
							<div>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/YS_small.jpg" alt="Image"	class="w-50 img-fluid mb-3">
							</div>
							<p>윤신영</p>
						</figure>
					</div>
				</div>
				
					<div>
					<div class="testimonial">
						<blockquote class="mb-5">
							<p>&ldquo;서로의 부족한 면을 채우면서 일하며 모두가 열정적입니다.
							 <br/>동시에 항상 세상 문제에 통찰력을 갖고 있어 
							 <br/>현재에 안주하지 않고 계속적으로 발전합니다.
							<br/>또한 서로가 다름을 인정하고, 동시에 개성을 존중하는 회사입니다.&rdquo;</p>
						</blockquote>
						<figure	class="mb-4 d-flex align-items-center justify-content-center">
							<div>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/AJ_small.jpg" alt="Image" class="w-50 img-fluid mb-3">
							</div>
							<p>안준언</p>
						</figure>
					</div>
				</div>
				
					<div>
					<div class="testimonial">
						<blockquote class="mb-5">
							<p>&ldquo; '워.라.벨' 이 세 단어가 바로 화분입니다.
							<br/>수평적이며 즉각적인 피드백으로 업무 효율성이 매일매일 향상됩니다.
							<br/>회식도 업무 시간 안에 이뤄져 내 개인시간을 충분히 확보 할 수 있습니다.&rdquo;</p>
						</blockquote>
						<figure	class="mb-4 d-flex align-items-center justify-content-center">
							<div>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/KW_small.jpg" alt="Image" class="w-50 img-fluid mb-3">
							</div>
							<p>권누리</p>
						</figure>
					</div>
				</div>
				
				<div>
					<div class="testimonial">
						<blockquote class="mb-5">
							<p>&ldquo;서로가 매일 질문하며 공부하고 더 나은 것을 위해 끊임없이 생각합니다.
							<br/>각 멤버 한사람 한사람이 화분 그 자체입니다. 
							<br/>화분과 함께 우리는 매일 성장하고 있습니다.
							<br/>오늘보다 내일이 더 기대되는 화분 :) &rdquo;</p>
						</blockquote>
						<figure class="mb-4 d-flex align-items-center justify-content-center">
							<div>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/se_small.jpg" alt="Image"	class="w-50 img-fluid mb-3">
							</div>
							<p>박성은</p>
						</figure>
					</div>
				</div>

				<div>
					<div class="testimonial">
						<blockquote class="mb-5">
							<p>&ldquo;작은 의견이라도 들어주고 생각하고 고민합니다.
							<br/>이곳에서 생각은 자유롭고 즐거운 것입니다.
							<br/>또한 각자의 부족한 부분을 서로 보완해주며 같이 성장하고 있습니다.&rdquo;</p>
						</blockquote>
						<figure	class="mb-4 d-flex align-items-center justify-content-center">
							<div>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/UJ_small.jpg" alt="Image"	class="w-50 img-fluid mb-3">
							</div>
							<p>유재혁</p>
						</figure>
					</div>
				</div>

				<div>
					<div class="testimonial">
						<blockquote class="mb-5">
							<p>&ldquo;자유롭고 존중받는 곳.
							<br/>서로가 선의의 경쟁을 하며 배움을 망설이지 않는 곳.
							<br/>출근하고 싶고, 월급날이 기다려지는 곳
							&rdquo;</p>
						</blockquote>
						<figure	class="mb-4 d-flex align-items-center justify-content-center">
							<div>
								<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/pooh.jpg" alt="Image"	class="w-50 img-fluid mb-3">
							</div>
							<p>이정규</p>
						</figure>
					</div>
				</div>
			</div>
		</section>
		
<!-- Histotry -->
		<section class="site-section bg-light" id="pricing-section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-12 text-center" data-aos="fade-up">
						<h2 class="section-title mb-3">History</h2>
					</div>
				</div>
				<div class="row mb-5">
					<div class="col-md-6 mb-4 mb-lg-0 col-lg-4" data-aos="fade-up"	data-aos-delay="">
						<div class="pricing">
							<h3 class="text-center text-black">Present</h3>
							<div class="price text-center mb-4 ">
								<span><span>2020.08~09</span> / month</span>
							</div>
							<ul class="list-unstyled ul-check success mb-5">
							    <li>일 회원 700명 돌파</li>
								<li>"Best Member" 상 수상</li>
								<li>전체 서비스 점검</li>
							</ul>
							<p class="text-center">
								<a href="#" class="btn btn-primary">More</a>
							</p>
						</div>
					</div>

					<div class="col-md-6 mb-4 mb-lg-0 col-lg-4" data-aos="fade-up"
						data-aos-delay="100">
						<div class="pricing">
							<h3 class="text-center text-black">Mid-Term</h3>
							<div class="price text-center mb-4 ">
								<span><span>2020.07~06</span> / month</span>
							</div>
							<ul class="list-unstyled ul-check success mb-5">
								<li>베타서비스 오픈</li>
								<li>전체적인 UI 구성 & 구현</li>
								<li>화분 스쿨 시작</li>
							</ul>
							<p class="text-center">
								<a href="#" class="btn btn-primary">More</a>
							</p>
						</div>
					</div>

					<div class="col-md-6 mb-4 mb-lg-0 col-lg-4" data-aos="fade-up"
						data-aos-delay="200">
						<div class="pricing">
							<h3 class="text-center text-black">First</h3>
							<div class="price text-center mb-4 ">
								<span><span>2020.05~04</span> / month</span>
							</div>
							<ul class="list-unstyled ul-check success mb-5">
								<li>화분(주) 법인 설립</li>
								<li>Light & Salt 멤버 영입 </li>
								<li>화분 연구소 설립</li>
							</ul>
							<p class="text-center">
								<a href="#" class="btn btn-primary">More</a>
							</p>
						</div>
					</div>
				</div><!-- Histotry -->
<!-- FAQ -->
				<div class="row site-section" id="faq-section">
					<div class="col-12 text-center" data-aos="fade">
						<h2 class="section-title">FAQ</h2>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-6">
						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">[결제] 주문 후 언제까지 입금해야 하나요?</h3>
							<p>주문 후 24시간 이내로 무통장 및 카드 결제 진행해 주셔야 합니다. 
							<br/>입금확인이 어려울시 자동으로 주문이 취소됩니다.^^</p>
						</div>
						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">[배송] 배송은 얼마나 걸리나요?</h3>
							<p>구매하신 시간이 오전 12시 이전이면 당일 배송입니다. <br/> 그 이후 시간은 다음날 순차적으로 출고됩니다.
							<br/>조금만 기다려주시면 꼼꼼하게 검수 후 예쁘게 발송해드리겠습니다.^^ </p>
						</div>
						
                          <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">[상품] 상품이 매진되었습니다. 언제 입고 될까요?</h3>
							<p>상품이 품절될 경우 가능한 한 빨리 입고할 예정입니다. 다만 업체에 따라 시간이 소요될 수 있습니다.
							최선을 다해서 물량 조절 하겠습니다. 항상 애용해 주셔서 감사합니다.^^</p>
						</div>
						
						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">[환불] 환불 정책은 어떻게 되나요?</h3>
							<p>제품의 하자가 발생할 시 사진 첨부 후 이메일 발송해주시면 2일 이내 바로 연락드리겠습니다.
							 제품 파손의 경우 100% 환불 그 외의 상황은 연락으로 개별 안내 도와드리겠습니다.^^ </p>
						</div>
					</div>
					
					<div class="col-lg-6">
					 <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">[적립금] 적립금이 확인 되지 않습니다. </h3>
							<p>적립금은 고객님께서 제품을 받으신 후 3일 이내로 일괄 처리됩니다. 
							<br/>너그러운 마음으로 잠시만 기다려주세요 ^^</p>
						</div>
						
						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">[기타] 고객센터 운영시간을 알고 싶습니다.</h3>
							<p>고객센터 운영시간은 평일: 월 ~ 금, 시간: 오전 9시 30분 ~ 17시 30분 까지 운영하고 있습니다.
							이메일로 문의 주셔도 성심성의껏 답변 드리겠습니다! </p>
						</div>
	                   
						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">[기타] 화분 회사에 지원하고 싶습니다!</h3>
							<p>화분은  수시 채용을 하고 있습니다. 
							자유 이력서 양식을 Light & Salt 멤버에게 직접 보내주시면 검토 후 순차적으로 연락드리겠습니다.^^</p>
						</div>
						
						<div class="mb-5" data-aos="fade-up" data-aos-delay="100">
							<h3 class="text-black h4 mb-4">[기타] 광고 및 투자는 어떻게 하나요?</h3>
							<p> 관련 문의는 Light & Salt 멤버에게 문의 이메일을 보내주세요. <br/>
							이메일 보내주시면 관련 양식 보내드립니다. 해당 양식 회신해주시면 5일 이내 연락드리겠습니다.<br/>
						         화분은 한 분 한 분의 인연을 소중하게 생각합니다. 감사합니다.^^</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		
<!-- Welfare -->
		<section class="site-section" id="about-section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-lg-5 ml-auto mb-5 order-1 order-lg-2" data-aos="fade" data-aos="fade-up" data-aos-delay="">
						<img src="${pageContext.request.contextPath }/resources/ourCompany/images2/welfare.jpg" alt="Image" class="img-fluid rounded">
					</div>
					<div class="col-lg-6 order-2 order-lg-1" data-aos="fade">
                     <h2 class="section-title mb-3">화분의 복지</h2>
						<div class="row">
							
							<div class="col-md-12 mb-md-5 mb-0 col-lg-6" data-aos="fade-up"	data-aos-delay="100">
								<div class="unit-4">
									<div class="unit-4-icon mr-4 mb-3">
											<span class="text-primary flaticon-idea"></span>
									</div>
									<div>
										<h3>식대,야근,교통비 모두 지원</h3>
										<p>출퇴근 교통비 및 삼시세끼, 간식 모두 지원합니다.<br/>
										1분이라도 넘으면 모두 야근 수당으로 받으실 수 있습니다. </p>
										<p class="mb-0">
											<a href="#" style="color: #66cdaa">Learn More</a>
										</p>
									</div>
								</div>
							</div>
							
							<div class="col-md-12 mb-md-5 mb-0 col-lg-6" data-aos="fade-up"	data-aos-delay="100">
								<div class="unit-4">
									<div class="unit-4-icon mr-4 mb-3">
										<span class="text-primary flaticon-graphic-design"></span>
									</div>
									<div>
										<h3>자율 출퇴근</h3>
										<p>오전 8시 30분부터 11시까지 자유롭게 출근 할 수 있습니다. <br/> 
										내가 원하는 시간에 와서 즐겁게 일하고 퇴근하면 됩니다.</p>
										<p class="mb-0">
											<a href="#" style="color: #66cdaa">Learn More</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
<!-- Media -->
		<section class="site-section" id="blog-section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-12 text-center" data-aos="fade">
						<h2 class="section-title mb-3">Media</h2>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up"
						data-aos-delay="">
						<div class="h-entry">
							<a href="single.html"> <img src="${pageContext.request.contextPath }/resources/ourCompany/images2/cos01.jpg"	alt="Image" class="img-fluid">
							</a>
							<h2 class="font-size-regular">
								<a href="#">[Today's]<br/>화분에서 선정한 올 여름 핫 아이템</a>
							</h2>
							<div class="meta mb-4">
								Ham Brook <span class="mx-2">&bullet;</span> Jun 20, 2020<span
									class="mx-2">&bullet;</span> <a href="#" style="color: #66cdaa">News</a>
							</div>
							<p>올 여름 지속력을 위한 필수 아이템! <br/>
							화분에서 선정한 올 여름 핫 아이템 !</p>
							<p>
								<a href="#" style="color: #66cdaa">Continue Reading...</a>
							</p>
						</div>
					</div>
					
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up"	data-aos-delay="100">
						<div class="h-entry">
							<a href="single.html"> <img src="${pageContext.request.contextPath }/resources/ourCompany/images2/cos02.jpg"	alt="Image" class="img-fluid">
							</a>
							<h2 class="font-size-regular">
								<a href="#">[셀럽's pick]<br/>이니스**가 추천한 올해 판매율 1위 !</a>
							</h2>
							<div class="meta mb-4">
								James Phelps <span class="mx-2">&bullet;</span> Jul 15, 2020<span
									class="mx-2">&bullet;</span> <a href="#" style="color: #66cdaa">News</a>
							</div>
							<p>이니스**가 내세운 HOT ITEM : 그린티 라인! <br/>
							세럼부터 크림까지 모든 라인을 만나보세요!.</p>
							<p>
								<a href="#" style="color: #66cdaa">Continue Reading...</a>
							</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up"
						data-aos-delay="200">
						<div class="h-entry">
							<a href="single.html"> <img src="${pageContext.request.contextPath }/resources/ourCompany/images2/cos03.jpg"	alt="Image" class="img-fluid">
							</a>
							<h2 class="font-size-regular">
								<a href="#">[화분's pick]<br/>이번달 화분인들의 선택을 받은<br/> BEST of BEST?</a>
							</h2>
							<div class="meta mb-4">
								James Phelps <span class="mx-2">&bullet;</span> Aug 35, 2020<span
									class="mx-2">&bullet;</span> <a href="#" style="color: #66cdaa">News</a>
							</div>
							<p>8월 많은 화분인들이 선정한 여름BEST of BEST !!<br/>
							미스트부터 각종 색조화장까지 !<br/> 궁금하면 어서 들어와 ^^</p>
							<p>
								<a href="#" style="color: #66cdaa">Continue Reading...</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>

<!-- contact us -->
		<section class="site-section bg-light" id="contact-section" data-aos="fade">
			<div class="container">
				<div class="row mb-5">
					<div class="col-12 text-center">
						<h2 class="section-title mb-3">Contact Us</h2>
					</div>
				</div>
				
				<div class="row mb-5">
					<div class="col-md-4 text-center">
						<p class="mb-4">
							<span class="icon-room d-block h4 text-primary"></span> 
							<span>서울특별시 동작구 노량진동 <br/> 장승배기로  171, 3층 아이비 빌딩</span>
						</p>
					</div>
					
					<div class="col-md-4 text-center">
						<p class="mb-4">
							<span class="icon-phone d-block h4 text-primary"></span> 
							<a href="#" style="color: #808080">+82 02 - 1666 - 9210 </a>
						</p>
					</div>
					
					<div class="col-md-4 text-center">
						<p class="mb-0">
							<span class="icon-mail_outline d-block h4 text-primary"></span>
							 <a href="http://www.google.com" style="color: #808080">aseongen12@gmail.com</a>
						</p>
					</div>
				</div>
				
			</div>
		</section>
		
<!-- Footer -->
		<footer class="site-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="row">
							<div class="col-md-5">
								<h2 class="footer-heading mb-4">About Us</h2>
								<p>화분은 화장품 리뷰, 매거진, 성분 등 다양한 정보를 제공하며 쇼핑까지 한번에 할 수
								있는 NO1. 화장품 정보 플랫폼입니다.</p>
							</div>
							
							<div class="col-md-3 ml-auto">
								<h2 class="footer-heading mb-4">Quick Links</h2>
								<ul class="list-unstyled">
									<li><a href="#about-section" class="smoothscroll">About	Us</a></li>
									<li><a href="#services-section" class="smoothscroll">Our Services</a></li>
									<li><a href="#testimonials-section" class="smoothscroll">Interviews</a></li>
									<li><a href="#contact-section" class="smoothscroll">Contact	Us</a></li>
								</ul>
							</div>
							
							<div class="col-md-3">
								<h2 class="footer-heading mb-4">Follow Us</h2>
								<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
							</div>
						</div>
					</div>
					
					<div class="col-md-3">
					 <h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
					  <form action="#" method="post" class="footer-subscribe">
						<div class="input-group mb-3">
						 <input type="text" class="form-control border-secondary text-white bg-transparent"
								placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
						  <div class="input-group-append">
							<button class="btn btn-primary text-black" type="button" id="button-addon2">Send</button>
							</div>
						</div>
						</form>
					</div>
				</div>
				
				<div class="row pt-5 mt-5 text-center">
					<div class="col-md-12">
						<div class="border-top pt-5">
							<p>	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>document.write(new Date().getFullYear());</script>
								    All rights reserved | We made with 
								 <i class="icon-heart text-danger" aria-hidden="true"></i>
								 by <a href="https://colorlib.com" target="_blank">FlowerPot</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	
<!-- .site-wrap -->
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/jquery.countdown.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/aos.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/jquery.sticky.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/isotope.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ourCompany/js/main.js"></script>
</body>
</html>