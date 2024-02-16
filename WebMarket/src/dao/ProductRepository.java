package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<>();
	//ProductRepository인스턴스를 하나만 공유하게끔 싱글톤 패턴을 이용함.
	private static ProductRepository instance = new ProductRepository();
	
	//ProductRepository인스턴스를 리턴하는 getter메서드
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234", "Galaxy S20", 1200000);
		phone.setDescription("제품 상세 요약");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("삼성");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("daniel-romero-s20.jpg");
		
		Product notebook = new Product("P1235", "LG Gram", 2000000);
		notebook.setDescription("제품 상세 요약");
		notebook.setCategory("노트북");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("refurbished");
		notebook.setFilename("andras-vas- Laptop.jpg");
		
		Product tablet = new Product("P1236", "Galaxy Tab", 600000);
		tablet.setDescription("212.8*125.6*6.6mm, 제품 상세 요약");
		tablet.setCategory("태블릿");
		tablet.setManufacturer("삼성");
		tablet.setUnitsInStock(100);
		tablet.setCondition("Old");
		tablet.setFilename("francois-hoang-tab.jpg");
		
		Product catTower = new Product("P0001", "풀옵션 캣타워", 300000);
		catTower.setDescription("대형 3단 이상,<br> 가로 90cm 세로 60cm 높이 180cm");
		catTower.setCategory("가구");
		catTower.setManufacturer("MMM");
		catTower.setUnitsInStock(10);
		catTower.setCondition("New");
		catTower.setFilename("petrebels-catTree.jpg");
		
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		listOfProducts.add(catTower);
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	// listOfProducts에 저장된 모든 상품 목록을 조회 해서 상품 아이디하고 일치하는 상품을 리턴 해주는 메서드
	public Product getProductById(String productId) {
		Product productById = null;
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null &&
					product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	//상품을 추가하는 역할을 하는 메서드
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
}
