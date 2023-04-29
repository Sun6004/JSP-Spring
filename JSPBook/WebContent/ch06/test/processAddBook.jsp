<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	String realFolder = request.getServletContext().getRealPath("/resources/images");
	String encType = "utf-8";
	
	int maxSize = 5 * 512 * 512;

	File file = new File(realFolder);
	if (!file.exists()) {
		file.mkdirs();
	}

	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	String bookId = "";
	String name = "";
	String unitPrice = "";
	String author = "";
	String publisher = "";
	String releaseDate = "";
	int totalPages = 0;
	String description = "";
	String category = "";
	String unitsInStock = "";
	String condition = "";
	String fileName = "";

while (params.hasNext()) {
	FileItem item = (FileItem) params.next();

	if (item.isFormField()) { // 폼페이지에서 전송된 요청 파라미터가 일반 데이터라면
			String fieldName = item.getFieldName();
			if (fieldName.equals("bookId")) {
		bookId = item.getString(encType);
			} else if (fieldName.equals("name")) {
		name = item.getString(encType);
			} else if (fieldName.equals("unitPrice")) {
		unitPrice = item.getString(encType);
			} else if (fieldName.equals("author")) {
		author = item.getString(encType);
			} else if (fieldName.equals("publisher")) {
		publisher = item.getString(encType);
			} else if (fieldName.equals("releaseDate")) {
		releaseDate = item.getString(encType);
			} else if (fieldName.equals("totalPages")) {
		totalPages = Integer.parseInt(item.getString(encType));
			} else if (fieldName.equals("description")) {
		description = item.getString(encType);
			} else if (fieldName.equals("category")) {
		category = item.getString(encType);
			} else if (fieldName.equals("unitsInStock")) {
		unitsInStock = item.getString(encType);
			} else if (fieldName.equals("condition")) {
		condition = item.getString(encType);
			}
		} else {
			String fileFieldName = item.getFieldName();
			fileName = item.getName();
			String contentType = item.getContentType();
			String originnalFileName = fileName;
			long fileSize = item.getSize();
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile);
		}
	}

Integer price;

	if (unitPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}
	long stock;
	
	if (unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	BookRepository dao = BookRepository.getInstance();

	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setTotalPages(totalPages);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);

	dao.addBook(newBook);

// 2. 책 1권의 정보가 담긴 자바빈즈 객체를 리스트에 저장해주세요.

	response.sendRedirect("books.jsp");
%>