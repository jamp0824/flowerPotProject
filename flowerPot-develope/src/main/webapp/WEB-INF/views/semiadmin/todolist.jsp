<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo List - DASHBOARD</title>
    
    <link rel="stylesheet" href="../resources/semiadmin_css/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="../resources/semiadmin_css/assets/vendors/dragula/dragula.min.css">

    <link rel="stylesheet" href="../resources/semiadmin_css/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="../resources/semiadmin_css/assets/css/app.css">
    <link rel="shortcut icon" href="../resources/semiadmin_css/assets/images/favicon.svg" type="image/x-icon">
</head>
<body>
    <div id="app">
    
       <jsp:include page="sidebar.jsp"></jsp:include>
       
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
                <h3>Widget Todo List</h3>
                <p class="text-subtitle text-muted">A list with checkbox which is helpful for listing what you wanna do.</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Todolist</li>
                    </ol>
                </nav>
            </div>
        </div>

    </div>
    <!-- Task App Widget Starts -->
    <section class="tasks">
        <div class="row">
            <div class="col-lg-7">
                <div class="card widget-todo">
                    <div class="card-header border-bottom d-flex justify-content-between align-items-center">
                        <h4 class="card-title d-flex">
                            <i class='bx bx-check font-medium-5 pl-25 pr-75'></i>Tasks
                        </h4>
                        <ul class="list-inline d-flex mb-0">
                            <li class="d-flex align-items-center">
                                <i class='bx bx-check-circle font-medium-3 mr-50'></i>
                                <div class="dropdown">
                                    <div class="dropdown-toggle mr-1" role="button" id="dropdownMenuButton"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">All Task
                                    </div>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="#">Option 1</a>
                                        <a class="dropdown-item" href="#">Option 2</a>
                                        <a class="dropdown-item" href="#">Option 3</a>
                                    </div>
                                </div>
                            </li>
                            <li class="d-flex align-items-center">
                                <i class='bx bx-sort mr-50 font-medium-3'></i>
                                <div class="dropdown">
                                    <div class="dropdown-toggle" role="button" id="dropdownMenuButton2"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">All Task
                                    </div>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                                        <a class="dropdown-item" href="#">Option 1</a>
                                        <a class="dropdown-item" href="#">Option 2</a>
                                        <a class="dropdown-item" href="#">Option 3</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body px-0 py-1">
                        <ul class="widget-todo-list-wrapper" id="widget-todo-list">
                            <li class="widget-todo-item">
                                <div
                                    class="widget-todo-title-wrapper d-flex justify-content-between align-items-center mb-50">
                                    <div class="widget-todo-title-area d-flex align-items-center">
                                        <i data-feather="list" class='cursor-move'></i>
                                        <div class="checkbox checkbox-shadow">
                                            <input type="checkbox" class="form-check-input" id="checkbox1">
                                            <label for="checkbox1"></label>
                                        </div>
                                        <span class="widget-todo-title ml-50">Add SCSS and JS files if
                                            required</span>
                                    </div>
                                    <div class="widget-todo-item-action d-flex align-items-center">
                                        <div class="badge badge-pill badge-light-success mr-1">frontend</div>
                                        <div class="avatar bg-warning ">
                                            <img src="../resources/semiadmin_css/assets/images/avatar/avatar-s-1.png" alt="" srcset="">
                                        </div>
                                        <i class="bx bx-dots-vertical-rounded font-medium-3 cursor-pointer"></i>
                                    </div>
                                </div>
                            </li>
                            <li class="widget-todo-item">
                                <div
                                    class="widget-todo-title-wrapper d-flex justify-content-between align-items-center mb-50">
                                    <div class="widget-todo-title-area d-flex align-items-center">
                                        <i data-feather="list" class='cursor-move'></i>
                                        <div class="checkbox checkbox-shadow">
                                            <input type="checkbox" class="form-check-input" id="checkbox2">
                                            <label for="checkbox2"></label>
                                        </div>
                                        <span class="widget-todo-title ml-50">Check all the changes that you did,
                                            before you commit</span>
                                    </div>
                                    <div class="widget-todo-item-action d-flex align-items-center">
                                        <div class="badge badge-pill badge-light-danger mr-1">backend</div>
                                        <div class="avatar bg-warning ">
                                            <img src="../resources/semiadmin_css/assets/images/avatar/avatar-s-2.png" alt="" srcset="">
                                        </div>
                                        <i class="bx bx-dots-vertical-rounded font-medium-3 cursor-pointer"></i>
                                    </div>
                                </div>
                            </li>
                            <li class="widget-todo-item completed">
                                <div
                                    class="widget-todo-title-wrapper d-flex justify-content-between align-items-center mb-50">
                                    <div class="widget-todo-title-area d-flex align-items-center">
                                        <i data-feather="list" class='cursor-move'></i>
                                        <div class="checkbox checkbox-shadow">
                                            <input type="checkbox" class="form-check-input" id="checkbox3" checked>
                                            <label for="checkbox3"></label>
                                        </div>
                                        <span class="widget-todo-title ml-50">Dribble, Behance, UpLabs & Pinterest
                                            Post</span>
                                    </div>
                                    <div class="widget-todo-item-action d-flex align-items-center">
                                        <div class="badge badge-pill badge-light-primary mr-1">UI/UX</div>
                                        <div class="avatar bg-rgba-primary m-0 mr-50">
                                            <img src="../resources/semiadmin_css/assets/images/avatar/avatar-s-3.png" alt="" srcset="">
                                        </div>
                                        <i class="bx bx-dots-vertical-rounded font-medium-3 cursor-pointer"></i>
                                    </div>
                                </div>
                            </li>
                            <li class="widget-todo-item">
                                <div
                                    class="widget-todo-title-wrapper d-flex justify-content-between align-items-center mb-50">
                                    <div class="widget-todo-title-area d-flex align-items-center">
                                        <i data-feather="list" class='cursor-move'></i>
                                        <div class="checkbox checkbox-shadow">
                                            <input type="checkbox" class="form-check-input" id="checkbox4">
                                            <label for="checkbox4"></label>
                                        </div>
                                        <span class="widget-todo-title ml-50">Fresh Design Web & Responsive
                                            Miracle</span>
                                    </div>
                                    <div class="widget-todo-item-action d-flex align-items-center">
                                        <div class="badge badge-pill badge-light-info mr-1">Design</div>
                                        <div class="avatar bg-warning ">
                                            <img src="../resources/semiadmin_css/assets/images/avatar/avatar-s-4.png" alt="" srcset="">
                                        </div>
                                        <i class="bx bx-dots-vertical-rounded font-medium-3 cursor-pointer"></i>
                                    </div>
                                </div>
                            </li>
                            <li class="widget-todo-item">
                                <div
                                    class="widget-todo-title-wrapper d-flex justify-content-between align-items-center mb-50">
                                    <div class="widget-todo-title-area d-flex align-items-center">
                                        <i data-feather="list" class='cursor-move'></i>
                                        <div class="checkbox checkbox-shadow">
                                            <input type="checkbox" class="form-check-input" id="checkbox5">
                                            <label for="checkbox5"></label>
                                        </div>
                                        <span class="widget-todo-title ml-50">Add Calendar page and source and
                                            credit page in
                                            documentation</span>
                                    </div>
                                    <div class="widget-todo-item-action d-flex align-items-center">
                                        <div class="badge badge-pill badge-light-warning mr-1">Javascript</div>
                                        <div class="avatar bg-warning ">
                                            <img src="../resources/semiadmin_css/assets/images/avatar/avatar-s-5.png" alt="" srcset="">
                                        </div>
                                        <i class="bx bx-dots-vertical-rounded font-medium-3 cursor-pointer"></i>
                                    </div>
                                </div>
                            </li>
                            <li class="widget-todo-item">
                                <div
                                    class="widget-todo-title-wrapper d-flex justify-content-between align-items-center mb-50">
                                    <div class="widget-todo-title-area d-flex align-items-center">
                                        <i data-feather="list" class='cursor-move'></i>
                                        <div class="checkbox checkbox-shadow">
                                            <input type="checkbox" class="form-check-input" id="checkbox6">
                                            <label for="checkbox6"></label>
                                        </div>
                                        <span class="widget-todo-title ml-50">Add Angular Starter-kit</span>
                                    </div>
                                    <div class="widget-todo-item-action d-flex align-items-center">
                                        <div class="badge badge-pill badge-light-primary mr-1">UI/UX</div>
                                        <div class="avatar bg-warning ">
                                            <img src="../resources/semiadmin_css/assets/images/avatar/avatar-s-1.png" alt="" srcset="">
                                        </div>
                                        <i class="bx bx-dots-vertical-rounded font-medium-3 cursor-pointer"></i>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="card widget-todo">
                    <div class="card-header border-bottom d-flex justify-content-between align-items-center">
                        <h4 class="card-title d-flex">
                            <i class='bx bx-check font-medium-5 pl-25 pr-75'></i>Progress
                        </h4>
                        
                    </div>
                    <div class="card-body px-0 py-1">
                        <table class='table table-borderless'>
                            <tr>
                                <td class='col-3'>UI Design</td>
                                <td class='col-6'>
                                    <div class="progress progress-info">
                                        <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="0" aria-valuemin="0"
                                            aria-valuemax="100"></div>
                                    </div>
                                </td>
                                <td class='col-3 text-center'>60%</td>
                            </tr>
                            <tr>
                                <td class='col-3'>VueJS</td>
                                <td class='col-6'>
                                    <div class="progress progress-success">
                                        <div class="progress-bar" role="progressbar" style="width: 35%" aria-valuenow="0" aria-valuemin="0"
                                            aria-valuemax="100"></div>
                                    </div>
                                </td>
                                <td class='col-3 text-center'>30%</td>
                            </tr>
                            <tr>
                                <td class='col-3'>Laravel</td>
                                <td class='col-6'>
                                    <div class="progress progress-danger">
                                        <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="0" aria-valuemin="0"
                                            aria-valuemax="100"></div>
                                    </div>
                                </td>
                                <td class='col-3 text-center'>50%</td>
                            </tr>
                            <tr>
                                <td class='col-3'>ReactJS</td>
                                <td class='col-6'>
                                    <div class="progress progress-primary">
                                        <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="0" aria-valuemin="0"
                                            aria-valuemax="100"></div>
                                    </div>
                                </td>
                                <td class='col-3 text-center'>80%</td>
                            </tr>
                            <tr>
                                <td class='col-3'>Go</td>
                                <td class='col-6'>
                                    <div class="progress progress-secondary">
                                        <div class="progress-bar" role="progressbar" style="width: 65%" aria-valuenow="0" aria-valuemin="0"
                                            aria-valuemax="100"></div>
                                    </div>
                                </td>
                                <td class='col-3 text-center'>65%</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Task App Widget Ends -->
   
    <!-- Progress App Widget Starts -->
    
    <!-- Progress App Widget Ends -->
</div>
 

           <jsp:include page="footerbar.jsp"></jsp:include>
        </div>
    </div>
  
</body>
</html>
