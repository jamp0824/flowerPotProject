<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apexchart - Voler Admin Dashboard</title>
    
    <link rel="stylesheet" href="../resources/semiadmin_css/assets/css/bootstrap.css">
    
<link rel="stylesheet" href="../resources/semiadmin_css/assets/vendors/apexcharts/apexcharts.css">

    <link rel="stylesheet" href="../resources/semiadmin_css/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="../resources/semiadmin_css/assets/css/app.css">
    <link rel="shortcut icon" href="../resources/semiadmin_css/assets/images/favicon.svg" type="image/x-icon">
</head>
<body>
    <div id="app">
        <div id="sidebar" class='active'>
            <div class="sidebar-wrapper active">
    <div class="sidebar-header">
        <img src="../resources/semiadmin_css/assets/images/logo2.JPG" alt="" srcset="">
    </div>
    <div class="sidebar-menu">
        <ul class="menu">
            
             <li class='sidebar-title'>Main Menu</li>
            
                <li class="sidebar-item">
                    <a href="index" class='sidebar-link'>
                        <i data-feather="home" width="20"></i> 
                        <span>Dashboard</span>
                    </a>
                    
                </li>
            
                 <li class="sidebar-item">
                    <a href="semi_notice" class='sidebar-link'>
                         <i data-feather="file-text" width="20"></i> 
                        <span>공지사항</span>
                    </a>
                </li>
                
                
             <li class='sidebar-title'>오늘의  &amp; 할 일 </li>
                        
                 <li class="sidebar-item  ">
                    <a href="form_editor" class='sidebar-link'>
                        <i data-feather="briefcase" width="20"></i> 
                        <span>배송관리</span>
                    </a>
                </li>
                
                 <li class="sidebar-item active ">
                    <a href="semi_notice" class='sidebar-link'>
                         <i data-feather="layers" width="20"></i> 
                        <span>재고관리</span>
                    </a>
                </li>
                    
                <li class="sidebar-item  ">
                    <a href="review" class='sidebar-link'>
                        <i data-feather="file-plus" width="20"></i> 
                        <span>Review후기</span>
                    </a>
                    
                            
                <li class="sidebar-item  has-sub active">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="trending-up" width="20"></i> 
                        <span>현황 Charts</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="ui_chart_chartjs">재고수량</a>
                        </li>
                        
                        <li>
                            <a href="ui_chart_apexchart">품목별 판매량</a>
                        </li>
                        
                    </ul>
                    
                </li>
                    
             <li class='sidebar-title'>개인 스케줄 </li>
 
                <li class="sidebar-item  ">
                    <a href="form_layout" class='sidebar-link'>
                        <i data-feather="layout" width="20"></i> 
                        <span>Calendar</span>
                    </a>
                </li>
            
                <li class="sidebar-item  ">
                    <a href="ui_todolist" class='sidebar-link'>
                        <i data-feather="layers" width="20"></i> 
                        <span>To-do List</</span>
                    </a>
                    
             <li class='sidebar-title'>필요없는 UI </li>
       
                 <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="triangle" width="20"></i> 
                        <span>Components</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="component_alert">Alert</a>
                        </li>
                        
                        <li>
                            <a href="component_badge">Badge</a>
                        </li>
                        
                        <li>
                            <a href="component_breadcrumb">Breadcrumb</a>
                        </li>
                        
                        <li>
                            <a href="component_buttons">Buttons</a>
                        </li>
                        
                        <li>
                            <a href="component_card">Card</a>
                        </li>
                        
                        <li>
                            <a href="component_carousel">Carousel</a>
                        </li>
                        
                        <li>
                            <a href="component_dropdowns">Dropdowns</a>
                        </li>
                        
                        <li>
                            <a href="component_list_group">List Group</a>
                        </li>
                        
                        <li>
                            <a href="component_modal">Modal</a>
                        </li>
                        
                        <li>
                            <a href="component_navs">Navs</a>
                        </li>
                        
                        <li>
                            <a href="component_pagination">Pagination</a>
                        </li>
                        
                        <li>
                            <a href="component_progress">Progress</a>
                        </li>
                        
                        <li>
                            <a href="component_spinners">Spinners</a>
                        </li>
                        
                        <li>
                            <a href="component_tooltips">Tooltips</a>
                        </li>
                    </ul>
                </li>
            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="briefcase" width="20"></i> 
                        <span>Extra Components</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="componen_extra_avatar">Avatar</a>
                        </li>
                        
                        <li>
                            <a href="component_extra_divider">Divider</a>
                        </li>
                    </ul>
                </li>
       
                 <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="file-text" width="20"></i> 
                        <span>Form Elements</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="form-element-input.html">Input</a>
                        </li>
                        
                        <li>
                            <a href="form-element-input-group.html">Input Group</a>
                        </li>
                        
                        <li>
                            <a href="form-element-select.html">Select</a>
                        </li>
                        
                        <li>
                            <a href="form-element-radio.html">Radio</a>
                        </li>
                        
                        <li>
                            <a href="form-element-checkbox.html">Checkbox</a>
                        </li>
                        
                        <li>
                            <a href="form-element-textarea.html">Textarea</a>
                        </li>
                        
                    </ul>
                    
                </li>

            
                <li class="sidebar-item  ">
                    <a href="form-layout.html" class='sidebar-link'>
                        <i data-feather="layout" width="20"></i> 
                        <span>Form Layout</span>
                    </a>
                    
                </li>

                <li class="sidebar-item  ">
                    <a href="table" class='sidebar-link'>
                        <i data-feather="grid" width="20"></i> 
                        <span>Table</span>
                    </a>
                    
                </li>
            

                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="user" width="20"></i> 
                        <span>Widgets</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="ui_chatbox">Chatbox</a>
                        </li>
                        
                        <li>
                            <a href="ui_pricing">Pricing</a>
                        </li>
                        
                        <li>
                            <a href="ui_todolist">To-do List</a>
                        </li>
                        
                    </ul>
                    
                </li>

                <li class='sidebar-title'>Pages</li>

                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="user" width="20"></i> 
                        <span>Authentication</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="auth_login">Login</a>
                        </li>
                        
                        <li>
                            <a href="auth_register">Register</a>
                        </li>
                        
                        <li>
                            <a href="auth_forgot_password">Forgot Password</a>
                        </li>
                        
                    </ul>
                    
                </li>

                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="alert-circle" width="20"></i> 
                        <span>Errors</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="error_403">403</a>
                        </li>
                        
                        <li>
                            <a href="error_404">404</a>
                        </li>
                        
                        <li>
                            <a href="error_500">500</a>
                        </li>
                    </ul>
                </li>
        </ul>
    </div>
    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
</div>
        </div>
        <div id="main">
            <nav class="navbar navbar-header navbar-expand navbar-light">
                <a class="sidebar-toggler" href="#"><span class="navbar-toggler-icon"></span></a>
                <button class="btn navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav d-flex align-items-center navbar-light ml-auto">
                        <li class="dropdown nav-icon">
                            <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
                                <div class="d-lg-inline-block">
                                    <i data-feather="bell"></i>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-large">
                                <h6 class='py-2 px-4'>Notifications</h6>
                                <ul class="list-group rounded-none">
                                    <li class="list-group-item border-0 align-items-start">
                                        <div class="avatar bg-success mr-3">
                                            <span class="avatar-content"><i data-feather="shopping-cart"></i></span>
                                        </div>
                                        <div>
                                            <h6 class='text-bold'>New Order</h6>
                                            <p class='text-xs'>
                                                An order made by Ahmad Saugi for product Samsung Galaxy S69
                                            </p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="dropdown nav-icon mr-2">
                            <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
                                <div class="d-lg-inline-block">
                                    <i data-feather="mail"></i>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#"><i data-feather="user"></i> Account</a>
                                <a class="dropdown-item active" href="#"><i data-feather="mail"></i> Messages</a>
                                <a class="dropdown-item" href="#"><i data-feather="settings"></i> Settings</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i data-feather="log-out"></i> Logout</a>
                            </div>
                        </li>
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                                <div class="avatar mr-1">
                                    <img src="../resources/semiadmin_css/assets/images/avatar/avatar-s-1.png" alt="" srcset="">
                                </div>
                                <div class="d-none d-md-block d-lg-inline-block">Hi, Saugi</div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#"><i data-feather="user"></i> Account</a>
                                <a class="dropdown-item active" href="#"><i data-feather="mail"></i> Messages</a>
                                <a class="dropdown-item" href="#"><i data-feather="settings"></i> Settings</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i data-feather="log-out"></i> Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            
<div class="main-content container-fluid">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Apexchart</h3>
                <p class="text-subtitle text-muted">Lot of variations and customizable chart made with ApexChart. Full documentation click <a href="https://apexcharts.com/docs/installation/">here</a>.</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Apexchart</li>
                    </ol>
                </nav>
            </div>
        </div>

    </div>
    <section class="section">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Line Area Chart</h4>
                    </div>
                    <div class="card-body">
                        <div id="area"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header">
                        <h4>Radial Gradient Chart</h4>
                    </div>
                    <div class="card-body">
                        <div id="radialGradient"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4>Line Chart</h4>
                    </div>
                    <div class="card-body">
                        <div id="line"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4>Bar Chart</h4>
                    </div>
                    <div class="card-body">
                        <div id="bar"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Radial Gradient Chart</h4>
                    </div>
                    <div class="card-body">
                        <div id="candle"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-left">
                        <p>2020 &copy; Voler</p>
                    </div>
                    <div class="float-right">
                        <p>Crafted with <span class='text-danger'><i data-feather="heart"></i></span> by <a href="http://ahmadsaugi.com">Ahmad Saugi</a></p>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="../resources/semiadmin_css/assets/js/feather-icons/feather.min.js"></script>
    <script src="../resources/semiadmin_css/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../resources/semiadmin_css/assets/js/app.js"></script>
    
<script src="../resources/semiadmin_css/assets/vendors/dayjs/dayjs.min.js"></script>
<script src="../resources/semiadmin_css/assets/vendors/apexcharts/apexcharts.min.js"></script>
<script src="../resources/semiadmin_css/assets/js/pages/ui-apexchart.js"></script>

    <script src="../resources/semiadmin_css/assets/js/main.js"></script>
</body>
</html>
