<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
   request.setCharacterEncoding("UTF-8");

   // 1. 넘겨받은 폼 데이터 전부를 받아서 변수에 초기화해주세요.
   //  - 초기화 하기 위한 변수는 아래 Book 클래스 newBook변수에 setter를 통해 담긴 변수를 참고해주세요.
   String bookId = request.getParameter("bookId");
   String name = request.getParameter("name");
   String unitPrice = request.getParameter("unitPrice");
   String author = request.getParameter("author");
   String publisher = request.getParameter("publisher");
   String releaseDate = request.getParameter("releaseDate");
   String totalPages = request.getParameter("totalPages");
   String description = request.getParameter("description");
   String category = request.getParameter("category");
   String unitsInStock = request.getParameter("unitsInStock");
   String condition = request.getParameter("condition");
   String fileName = request.getParameter("bookImage");
   
   Integer price;

   if (unitPrice.isEmpty())
      price = 0;
   else
      price = Integer.valueOf(unitPrice);

   long stock;

   if (unitsInStock.isEmpty())
      stock = 0;
   else
      stock = Long.valueOf(unitsInStock);

   BookRepository dao = BookRepository.getInstance();

   Book newBook = new Book();
   newBook.setBookId(bookId);
   newBook.setName(name);
   newBook.setUnitPrice(price);
   newBook.setAuthor(author);
   newBook.setPublisher(publisher);
   newBook.setPublisher(releaseDate);
   newBook.setPublisher(totalPages);
   newBook.setDescription(description);
   newBook.setCategory(category);
   newBook.setUnitsInStock(stock);
   newBook.setCondition(condition);
   newBook.setFilename(fileName);

   // 2. 책 1권의 정보가 담긴 자바빈즈 객체를 리스트에 저장해주세요.

   response.sendRedirect("books.jsp");
%>