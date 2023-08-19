package vehicleOnlineShop;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Wishlist {
	
	@Id 
	private int id ;
	private int uid ;
	private int pid ;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	

}
