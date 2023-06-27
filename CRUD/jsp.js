 /* let title = location.href.split("?")[1].split("&")[0].split("=")[1]; */
    
    /* 인코딩함수 escape encodeURI encodeURIComponent
    디코딩 함수 unescape decodeURI decodeURIComponent */
    //alert(decodeURIComponent(title));
    // 위의 방식으로는 제대로 적용할 수 없음(case by case를 사람이 대처?)
    // 위의 상황을 일반화시킴(자동화)
    const request = {}; // 네임스페이스용 빈 객체(안비어도 노상관)
    request.getParam = function(pName){
        if(location.href.indexOf("?")== -1) return;

        let queryString = location.href.split("?")[1]; // ? 오른쪽 문자열을 쿼리 스트링이라 부른다.
        let items = queryString.split("&");
        for(let i=0; i<items.length; i++){
            let name = items[i].split("=")[0];
            let val = items[i].split("=")[1];
            if(name == pName){
                val = decodeURIComponent(val);
                val = val.replaceAll("+"," "); "공백이 +로 넘어오기 떄문에 재가공"
                return decodeURIComponent(val);
                
            }
        }
        return "잘못된 name"; // 개발중 debug
    }
     /*    alert(request.getParameterValues("skill")); //요게 제대로 나오도록

    alert(request.getParam("title"));
    alert(request.getParam("writer"));
    alert(request.getParam("cont"));
 */

    /* let writer = location.href.split("?")[1].split("&")[0].split("=")[2];
    let cont = 
    let skills =  */

    // 같은 name이 여러개인 경우에 사용하는 메서드, 배열을 리턴
    request.getParameterValues = function(pName){   
        if(!location.href.includes("?")) return;
        let sk = [];
        // 배열에 name으로 찾을 값을 담기만 하면됨
        let queryString = location.href.split("?")[1]; // ? 오른쪽 문자열을 쿼리 스트링이라 부른다.
        let items = queryString.split("&");
        for(let i=0; i<items.length; i++){
            let name = items[i].split("=")[0];
            let val = items[i].split("=")[1];
            if(name == pName){
                val = decodeURIComponent(val);
                val = val.replaceAll("+"," "); "공백이 +로 넘어오기 떄문에 재가공"
                sk.push(decodeURIComponent(val)); // return 으로 멈추지 말고 끝까지 찾아서 담자
                return val;
            }
        }
        if(!sk.length) return null; // 아무것도 못찾으면 null
        return sk; // 배열을 리턴
        
    }