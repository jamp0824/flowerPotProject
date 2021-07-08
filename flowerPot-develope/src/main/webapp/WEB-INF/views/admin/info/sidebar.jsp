<%@ page contentType="text/html; charset=UTF-8"%>


		<div class="sidebar" data-color="blue" data-image="${pageContext.request.contextPath}/resources2/assets/img/sidebar-5.jpg">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="#" class="simple-text">
                       	 관리자
                    </a>
                </div>
                <ul class="nav">
                    <li id="Dashboard">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>종합 현황</p>
                        </a>
                    </li>
                    <li id="coupon">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/coupon">
                            <i class="nc-icon nc-satisfied"></i>
                            <p>쿠폰 관리</p>
                        </a>
                    </li>
                    <li id="brand">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/brand">
                            <i class="nc-icon nc-tag-content"></i>
                            <p>입점 관리</p>
                        </a>
                    </li>
                    <li id="employee">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/employee">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>직원 관리</p>
                        </a>
                    </li>
                    <li id="member">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/member">
                            <i class="nc-icon nc-badge"></i>
                            <p>회원 관리</p>
                        </a>
                    </li>
                	<%-- <li id="inventory">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/inventory">
                            <i class="nc-icon nc-notes"></i>
                            <p>재고 관리(구상도못함)</p>
                        </a>
                    </li> --%>
                	<li id="delevery">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/delivery">
                            <i class="nc-icon nc-delivery-fast"></i>
                            <p>주문 배송</p>
                        </a>
                    </li>
                	<li id="communication">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/customer/notice">
                            <i class="nc-icon nc-notification-70"></i>
                            <p>고객센터</p>
                        </a>
                    </li>
                <%-- 	<li id="Notifications">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/notifications">
                            <i class="nc-icon nc-bell-55"></i>
                            <p>신규 알림</p>
                        </a>
                    </li> --%>
                    <li><a><i></i><p> </p></a></li>
                	<li><a><i></i><p> </p></a></li>
                	<li><a><i></i><p> </p></a></li>
                	<li><a><i></i><p> </p></a></li>
                	<li><a><i></i><p> </p></a></li>
					<li id="active-pro" class="active-pro">
                        <a class="nav-link active" href="${pageContext.request.contextPath}">
                            <i class="nc-icon nc-alien-33"></i>
                            <p>메인페이지</p>
                        </a>
                    </li>
        
                </ul>
            </div>
        </div>
