package kr.or.ddit;

// ServiceResult인 enum은 처리를 담당하는 컨트롤러안에서 
// 서비스로 요청한 기능명의 결과로 넘어오는 결과들인데,
// 처리 성공 여부 또는 처리 여부에 따라서 OK, FAILED, EXIST, NOTEXIST 등의 결과가 넘어온다.
public enum ServiceResult {
	OK, FAILED, EXIST, NOTEXIST
}
