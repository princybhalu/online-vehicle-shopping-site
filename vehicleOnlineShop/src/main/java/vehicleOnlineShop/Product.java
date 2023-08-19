package vehicleOnlineShop;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.hibernate.mapping.List;

@Entity
public class Product {
	
	@Id 
	private int id ;
	private String name;
	private String company;
	private String price ;
	private String feature;
	private int stock ;
	private String imageurl ;
//	@ManyToMany(mappedBy="Product")
//	private List Customers;
//	
//	public List getCustomers() {
//		return Customers;
//	}
//	public void setCustomers(List Customers) {
//		this.Customers = Customers;
//	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	

}