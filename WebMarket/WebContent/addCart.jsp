<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="vo.Product"%>
<%@ page import="dao.ProductRepository"%>
<%
	// 넘겨받은 상품 id를 꺼낸다
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}

	ProductRepository dao = ProductRepository.getInstance();

	// id에 해당하는 상품을 조회한다.
	Product product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	// 
	ArrayList<Product> goodsList = dao.getAllProduct();
	Product goods = new Product();	// id에 해당하는 상품을 담을 공간
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProductId().equals(id)) { 			
			break;
		}
	}
	
	// 먼저 담은 카트 상품 목록을 꺼낸다.
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Product goodsQnt = new Product();
	// 주문한 상품 목록의 수량 계산
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("product.jsp?id=" + id);
%>