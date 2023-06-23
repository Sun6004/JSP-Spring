const myModal = document.querySelector("#myModal");
    
function openModal(){
    myModal.style.display = "block";
}
function modalClose(){
    myModal.style.animation = "slideUp 0.6s ease-in-out forwards"; // 슬라이드 업 애니메이션 효과 추가
    setTimeout(function(){
        myModal.style.display = "none";
        myModal.style.animation = ""; // 애니메이션 초기화
    }, 600); // 0.6초 후에 모달 창을 숨기고 애니메이션 초기화
}