<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!--ajax로 정보를 보낼땐 form태그가 꼭 필요하진 않음-->
    <h1>Hi</h1>
    <div id="disp">
        <a href="/upload/고양이.jpg" download="cat.jpg">download</a>
        <input type="file" id="myFile" value=""> <br>
        <button onclick="ffile()">File Test</button>
        <button onclick="fpost()">post Test</button>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script>
        const myFile = document.querySelector("#myFile");
        const disp = document.querySelector("#disp");

    /* function ffile() {
        let formData = new FormData();
        console.log(myFile.files);
        formData.append("myFile", myFile.files[0]);

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/mFile", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                console.log(xhr.responseText);
                let aTag = document.createElement("a");
                aTag.href = xhr.responseText;
                aTag.innerHTML = "다운로드";
                aTag.download = xhr.responseText.split("/")[2];
                disp.appendChild(aTag);
            }
        }
        xhr.send(formData);
    } */

        // ajax 파일 업로드 jQuery사용

    function ffile() {
        let formData = new FormData();
        formData.append("myFile", myFile.files[0]);

        $.ajax({
            type: "POST",
            url: "/mFile",
            contentType: false,
            processData: false,
            cache: false,
            data: formData,
            dataType: "text",
            success: function(response) {
                let aTag = document.createElement("a");
                aTag.href = response;
                aTag.innerHTML = "다운로드";
                aTag.download = response.split("/")[2];
                disp.appendChild(aTag);
            },
            error: function(xhr, textStatus, error) {
                console.log(error); // 에러가 발생한 경우에 대한 처리
            }
        });
    }

    function fpost(){
        let data = [
            {
                name: "로제",
                age: ["1", "2", "3"]
            },
            {
                name: "제니",
                age: ["4", "5", "6"]
            },
            {
                name: "리사",
                age: ["7", "7", "7"]
            },
            {
                name: "지수",
                age: ["9", "9", "6"]
            }
        ];

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/sun/", true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4 && xhr.status == 200){
                console.log(xhr.responseText);
                console.log(JSON.parse(xhr.responseText));
                let aTag = document.createElement("a");
                aTag.href = xhr.responseText;
                aTag.innerHTML = "다운로드";
                aTag.download = xhr.responseText.split("/")[2];
                disp.appendChild(aTag);
            }
        }
        xhr.send(JSON.stringify(data));
    }
    </script>
</body>
</html>
