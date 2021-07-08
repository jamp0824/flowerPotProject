<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비동기식 아작스로 파일첨부 기능 만들기 </title>
<script src="./resources/js/jquery.js"></script>
<script>
 $(document).ready(function(){
	//문서가 준비되었어면
	 $('#uploadBtn').on("click",function(e){
	  //버튼 클릭시 실행
	  var formData = new FormData();
/* 1. 첨부파일을 업로드 하는 또 다른 방식은 jQuery 아작스를 이용해서 파일 데이터만을
 * 전송한다.
   2. 아작스를 이용하는 첨부파일 처리는 FormData라는 객체를 이용하는데 IE의 웹브라우저
   인 경우는 10이후 버전부터 지원되므로 브라우저의 제약이 있을 수 있다.
 */
       var inputFile = $("input[name='uploadFile']");
       //input 태그 네임피라미터 이름이 uploadFile인 경우에 접근
       var files=inputFile[0].files;//첫번째 input type="file"
       console.log(files);//콘솔모드 출력
       
       //첨부파일을 formData객체에 추가
       for(var i=0;i<files.length;i++){
    	   formData.append("uploadFile",files[i]);
       }//for
       
       $.ajax({
    	   url : "/controller/uploadAjaxAction",//서버 매핑주소
    	   processData:false,//데이터를 컨텐트타입에 맞게 변환=>false로 지정
    	   //해야 전송
    	   contentType:false,//컨텐트 타입 지정
    	   data:formData,//formData 객체를 전송=>formData에 첨부한 파일이
    	   //있다.
    	   type:'POST',//보내는 방식
    	   success:function(result){
    		   //받아오는 것이 성공시 호출되는 콜백함수
    		   alert('Uploaded OK!');
    	   }
       });//비동기식 아작스
	 });
 });
</script>
</head>
<body>
 <h1>Upload with Ajax</h1>
 <input type="file" name="uploadFile" multiple />
 <hr/>
 <button id="uploadBtn">Upload</button> 
</body>
</html>





