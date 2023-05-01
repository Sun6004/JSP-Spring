<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 
		1. 회원가입 폼에서 넘겨받은 일반 데이터, 파일 데이터를 전달받아서 일반데이터와 파일명을 저장하여,
			회원 객체 하나를 저장 후, 회원 목록에 해당하는 리스트에 저장하여
			목록 페이지에서 리스트 데이터를 활용할 수 있도록 한다.
			-dao,vo활용
		
		2. 회원가입이 완료되면 total_signup.jsp로 이동하여 로그인을 진행할 수 있도록 한다.
	-->
	<%
		
		// 내가 사용중인 프로젝트의  contextPath경로 (JSPBook//resources/images)
		// 이클립스상에서의 폴더 경로가 아닌 이클립스에서 만들어낸 프로젝트가 배포되서 생성되는 배포 경로가 된다.
		String path = request.getServletContext().getRealPath("/resources/images");
	
		File file = new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
		
		DiskFileUpload upload = new DiskFileUpload();
		upload.setFileSizeMax(5 * 1024 * 1024);
		upload.setSizeThreshold(4096);
		upload.setRepositoryPath(path);
		
		List items = upload.parseRequest(request);
		Iterator params = items.iterator();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		int maxSize = 4 * 1024 * 1024;
		while(params.hasNext()){
			FileItem item = (FileItem) params.next();
			
			if(item.isFormField()){
				String name = item.getFieldName();//파라미터 이름
				String value = item.getString("utf-8");
				dataMap.put(name, value);
			}else{
				String fileFieldName = item.getFieldName();
				String fileName = item.getName();
				
				if(!fileName.equals("")){
					String contentType = item.getContentType();
					long fileSize = item.getSize();
					File file1 = new File(path+"/"+fileName);
					item.write(file1); //파일복사
					
					dataMap.put(fileFieldName, fileName);
				}
			}
		}
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO vo = new MemberVO();
		vo.setMem_id(dataMap.get("mem_id").toString());
		vo.setMem_pw(dataMap.get("mem_pw").toString());
		vo.setMem_name(dataMap.get("mem_name").toString());
		vo.setMem_sex(dataMap.get("mem_sex").toString());
		vo.setFilename(dataMap.get("filename").toString());
		
		dao.insertMember(vo);
		response.sendRedirect("total_signin.jsp");
		
	%>