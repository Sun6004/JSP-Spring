package dao;

import java.util.ArrayList;

import vo.Product;

public class ProductRepository {
	
	private ArrayList<Product> listProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234", "iphone10", 890000);
		phone.setDescription("5.0-inch, 1234x760 hd, 8mp camera ");
		phone.setCategory("smart phone");
		phone.setManufacturer("apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("new");
		
		Product laptop = new Product("P1255", "lg gram", 1500000);
		laptop.setDescription("17-inch, ips fhd, intel i7 ");
		laptop.setCategory("Notebook");
		laptop.setManufacturer("LG");
		laptop.setUnitsInStock(500);
		laptop.setCondition("Refurbished");
		
		Product tablet = new Product("P1665", "갤럭시탭 11", 1200000);
		tablet.setDescription("12-inch, Qhd, 8mp camera ");
		tablet.setCategory("tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1200);
		tablet.setCondition("old"); 
		
		listProducts.add(phone);
		listProducts.add(laptop);
		listProducts.add(tablet);
	}
	
	// 전체 상품 조회
	public ArrayList<Product> getAllProduct(){
		return listProducts;
	}
	
	// productId에 해당하는 상품 1개 조회
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0; i < listProducts.size(); i++) {
			Product product = listProducts.get(i);
			if(product !=null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(Product product) {
		listProducts.add(product);
	}
}
