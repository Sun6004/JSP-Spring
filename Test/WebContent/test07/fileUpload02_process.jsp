<%@ page  contentType="text/html; charset=UTF-8"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    String Path="C:\\upload";
    
    DiskFileUpload upload=new DiskFileUpload();
    upload.setSizeMax(1000000);
    upload.setSizeThreshold(4096);
    upload.setRepositoryPath(Path);
    
    List items=upload.parseRequest(request);
    Iterator params=items.iterator();
    while(params.hasNext())
    {
        FileItem item=(FileItem)params.next();
        if(!item.isFormField())
        {
            String fileFiledName=item.getFieldName();
            String fileName=item.getName();
            String contentType=item.getContentType();
            
            fileName=fileName.substring(fileName.lastIndexOf("\\")+1);
            long fileSize=item.getSize();
            
            File file=new File(Path+"/"+fileName);
            item.write(file);
            
            out.println("요청 파라미터 이름:"+fileFiledName+"<br>");
            out.println("저장 파일 이름:" +fileName+"<br>");
            out.println("파일 콘텐츠 유형:"+contentType+"<br>");
            out.println("파일 크기: "+fileSize);
        }
    }
    %>
</body>
</html>
