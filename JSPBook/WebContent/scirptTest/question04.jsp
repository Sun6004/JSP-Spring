<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
#myProgress {
  width: 100%;
  background-color: #ddd;
}
#myBar {
  width: 10%;
  height: 30px;
  background-color: #04AA6D;
  text-align: center; /* To center it horizontally (if you want) */
  line-height: 30px; /* To center it vertically */
  color: white;
}
</style>
<body>
	<caption>앞(SEM PC 자리)</caption>
	<table width="100%" border="1" style="text-align:center; font-size:24px;">
		<tr width="100%" height="80px">
			<td width="10%"></td>
			<td width="10%">전지혜</td>
			<td width="10%">신현근</td>
			<td width="10%">이지영</td>
			<td width="20%"></td>
			<td width="10%">김지완</td>
			<td width="10%">신국현</td>
			<td width="10%">이성일</td>
			<td width="10%"></td>
		</tr>
		<tr height="80px">
			<td>고영우</td>
			<td>정재균</td>
			<td>황지현</td>
			<td>박윤수</td>
			<td></td>
			<td>변정민</td>
			<td>정은지</td>
			<td>박정수</td>
			<td>조성희</td>
		</tr>
		<tr height="80px">
			<td>김민정</td>
			<td>박승우</td>
			<td>김동혁</td>
			<td>이수진</td>
			<td></td>
			<td>홍기태</td>
			<td>김민욱</td>
			<td>진현성</td>
			<td>오미나</td>
		</tr>
		<tr height="80px">
			<td></td>
			<td>구기현</td>
			<td>오대환</td>
			<td>전다미</td>
			<td></td>
			<td>배문기</td>
			<td>유이현</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<hr/>
	<div class="progress" style="height: 40px;">
		<div class="progress-bar progress-bar-striped" id="myBar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
			aria-valuemax="100" style="width: 1px; height: 40px;">
			<span class="sr-only">60% Complete</span>
		</div>
	</div>
	<br/>
	<h4 id="txt"></h4>
	<button type="button" onclick="move()" style="padding:12px;border:none;cursor:pointer;">출력</button>
</body>
<script type="text/javascript">
var i = 0;
var myArray = [ "유이현", "배문기", "전다미", "오대환", "구기현", "오미나", "진현성", "김민욱",
		"홍기태", "이수진", "김동혁", "박승우", "김민정", "박정수", "정은지", "변정민", "조성희",
		"황지현", "정재균", "고영우", "박윤수", "이성일", "신국현", "김지완", "이지영", "신현근", "전지혜" ];

var cnt = 0;		// myArray에서 이름을 꺼낼때 사용하는 index
var seat = 0;		// show를 위한 index(td에 index를 배정할 때)

function move() {
	if (i == 0) {
		var elem = document.getElementById("myBar");
		var width = 0;
		var id = setInterval(frame, 100);
		function frame() {
			$("td:eq("+seat+")").css("background-color", "white");
			if (width >= 100) {	// 결과를 내기 위한 공간
				
				$("#txt").html(myArray[cnt]);
				
				var tds = document.getElementsByTagName("td");
				console.log(tds);
				for(var j = 0; j < tds.length; j++){
					console.log(tds[j].innerText + " : " + myArray[cnt]);
					if(tds[j].innerText == myArray[cnt]){
						tds[j].style.backgroundColor = "yellow";
					}
				}		
				clearInterval(id);
			} else {	// show를 위한 공간
				cnt = Math.floor(Math.random() * 27);	// 0~26
				seat = Math.floor(Math.random() * 36);	// 0~35
				
				console.log(cnt + " : " + seat);
				$("td:eq("+seat+")").css("background-color", "yellow");
				
				width++;
				elem.style.width = width + "%";
				elem.innerHTML = width + "%";
				
				if(width == 2)
					$("#txt").html("[SYSTEM] System is initializing...!");
				if(width == 4)
					$("#txt").html("[SYSTEM] The system is being checked...!");
				if(width == 6)
					$("#txt").html("[SYSTEM] system is starting...!");
				if(width == 8)
					$("#txt").html("[SYSTEM] Check system security...!");
				if(width == 10)
					$("#txt").html("[SYSTEM] Check that there is no problem with system security...!");
				if(width == 11)
					$("#txt").html("[SYSTEM] ■■□□□□□□□□□□□□□□□□□□□□□□");
				if(width == 11)
					$("#txt").html("[SYSTEM] ■■■■□□□□□□□□□□□□□□□□□□□□");
				if(width == 12)
					$("#txt").html("[SYSTEM] ■■■■■■□□□□□□□□□□□□□□□□□□");
				if(width == 13)
					$("#txt").html("[SYSTEM] ■■■■■■■■□□□□□□□□□□□□□□□□");
				if(width == 14)
					$("#txt").html("[SYSTEM] ■■■■■■■■■□□□□□□□□□□□□□□□");
				if(width == 15)
					$("#txt").html("[SYSTEM] ■■■■■■■■■■■□□□□□□□□□□□□□");
				if(width == 16)
					$("#txt").html("[SYSTEM] ■■■■■■■■■■■■■□□□□□□□□□□□");
				if(width == 17)
					$("#txt").html("[SYSTEM] ■■■■■■■■■■■■■■■□□□□□□□□□");
				if(width == 18)
					$("#txt").html("[SYSTEM] ■■■■■■■■■■■■■■■■■■□□□□□□");
				if(width == 19)
					$("#txt").html("[SYSTEM] ■■■■■■■■■■■■■■■■■■■■■■■□");
				if(width == 20)
					$("#txt").html("[SYSTEM] System log is being written...!");
				if(width == 30)
					$("#txt").html("[SYSTEM] 406호 학생 데이터를 취합중입니다....!");
				if(width == 40)
					$("#txt").html("[SYSTEM] 406호 학생 데이터를 정렬중입니다....!");
				if(width == 50)
					$("#txt").html("[SYSTEM] 406호 학생 데이터를 기반으로 자리 배치중입니다....!");
				if(width == 60)
					$("#txt").html("[SYSTEM] 406호 학생 순번 및 자리 순번을 생성중입니다....!");
				if(width == 70)
					$("#txt").html("[SYSTEM] 시스템 가동 전, 자체 테스트진행중입니다....!");
				if(width == 80)
					$("#txt").html("[SYSTEM] 이제 곧 시스템이 가동됩니다....!");
				if(width == 90)
					$("#txt").html("[SYSTEM] Let's solve the 406 practice problem, and the random system processing will start soon....!");
				if(width == 92)
					$("#txt").html("[SYSTEM] Comming Soon...!");
				if(width == 94)
					$("#txt").html("[SYSTEM] 406호 반장은 박정수");
				if(width == 96)
					$("#txt").html("[SYSTEM] 406호 반장은 노션 정리 끝판왕");
				if(width == 98)
					$("#txt").html("[SYSTEM] 406호 시작!");
			}
		}
	}
}
</script>
</html>











