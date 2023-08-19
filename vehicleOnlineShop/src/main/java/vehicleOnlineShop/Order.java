package vehicleOnlineShop;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orderitem")
public class Order {

	@Id 
	private int id ;
	private int uid ;
	private int pid ;
	private Date Date;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public Date getDate() {
		return Date;
	}
	public void setDate(Date date2) {
		this.Date = date2;
	}
	
}
