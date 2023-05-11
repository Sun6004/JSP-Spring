<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dtext{
	border: 1px solid black;
	width: 35%;
	height: 80px;
}
</style>
</head>
<body>
		<!-- 
		총 4가지의 div가 있습니다.
		제일 먼저 선택한(클릭) div에 있는 텍스트를 
		두번째 눌린 div로 옮기는데 이때, 서로 박스에 들어있는 텍스트를 교체한다.
	 -->
	<div class="dtext" id="firstDiv">첫번째 박스</div>
	<div class="dtext" id="secondDiv">두번째 박스</div>
	<div class="dtext" id="thirdDiv">세번째 박스</div>
	<div class="dtext" id="fourDiv">네번째 박스</div>
	
	<br/>
	<hr/>
	<br/>
	
	<div style="overflow-y :scroll; height: 100px; width: 35%;" id="history">
	
	</div>
	<!-- 
		아래 select box에 있는 박스 순서를 선택하고
		출력 할 텍스트를 입력 후에 출력 버튼을 클릭 시,
		내가 입력한 텍스트가 선택한 div 박스안에 
		내가 입력한 텍스트가 추가로 출력되게 해주세요.
	 -->
	<select id="boxSelect">
		<option value="1">첫번째 박스</option>
		<option value="2">두번째 박스</option>
		<option value="3">세번째 박스</option>
		<option value="4">네번째 박스</option>
		<option value="5">모든 박스</option>
	</select>
	<input type="text" id="content"/>
	<input type="button" value="출력" id="pBtn"/>
</body>
<script src="./jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
		var textBox = ""; //텍스트저장공간
		var eleBox = "";
		var flag = false; 
		

		$('.dtext').on('click', function(){
			var divId = $(this).attr("id");
			$('#history').html($('#history').html()+divId+"가 클릭되었습니다.<br>");
			$('#history').scrollTop($('#history')[0].scrollHeight);
			
		  	if(flag == true){ //두번째 요소가 클릭됬을떄
		   		flag = false;
		   		eleBox.html($(this).html());
		   	 	$(this).html(textBox);
		    
		    	textBox = "";
		    	eleBox = null;
		    	$('.dtext').css('background-color','white');
		  	}else{ //첫번째 요소가 클릭됬을떄
		   		flag = true;
		    	textBox = $(this).html();
		    	eleBox = $(this);
		    	$(this).css('background-color','yellow');
		  }
		})
		
		$('#pBtn').on('click', function(){
		    var selectVal = $('#boxSelect').val(); 
		    var cont = $('#content').val();
		    
		    if(selectVal === '1'){
		        $('#firstDiv').html(cont);
		    }
		    if(selectVal === '2'){
		        $('#secondDiv').html(cont);
		    }
		    if(selectVal === '3'){
		        $('#thirdDiv').html(cont);
		    }
		    if(selectVal === '4'){
		        $('#fourDiv').html(cont);
		    }
		    if(selectVal === '5'){
		        $('.dtext').html(cont);
		    }
		    
		    //방법2
// 		    if(parseInt(selectVal) < 5){
// 				$("div:eq("+(parseInt(selectVal) - 1)+")").html(cont);
// 			}else{	// 모든 박스를 선택했을때
// 				for(var i = 0; i < 4; i++){
// 					$("div:eq("+i+")").html("["+(i+1)+"번째 박스]" + cont);
// 				}
// 			}
		});		
	})
</script>
</html>