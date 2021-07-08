<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>404 page Not Found</title>
<style>
button{
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;}
    
.text-center {
	text-align: center;
}

</style>
</head>

<body>
	<div class="btn-primary">
		<div id="error" style=>
			<div class="container text-center pt-32"   >
				<h1 class='error-title text-center'>  </h1>
				
				<img src="${pageContext.request.contextPath }/resources/img/404.JPG" style="margin:100px;"/><br/>
				<button class="button" style=" width: 200px; height:40px; background: #00CDFF; color:#fff;"
				 onClick="location.href='${pageContext.request.contextPath}/index3'"> 
				 Go Home
				</button>
			</div>

			<div class="footer pt-32">
				<p class="text-center">Copyright &copy; flowerPot 2020</p>
			</div>
		</div>
	</div>
</body>
</html>
