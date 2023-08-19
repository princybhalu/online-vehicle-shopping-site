package vehicleOnlineShop;

import java.sql.Date;


import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class addProductController {
	
	@RequestMapping("addProduct")
	public ModelAndView adduser(@RequestParam("n") String name, @RequestParam("c") String company, 
			@RequestParam("p") String price, @RequestParam("f") String feature, 
			@RequestParam("ts") int stock, @RequestParam("iurl") String imageurl ) {
		
		ModelAndView mv = new ModelAndView();
		
		Product p = new Product();
		p.setName(name);
		p.setCompany(company);
		p.setPrice(price);
		p.setFeature(feature);
		p.setStock(stock);
		p.setImageurl(imageurl);
		
		
		Configuration con = new Configuration().configure().addAnnotatedClass(Product.class);
		SessionFactory sf = con.buildSessionFactory();
		org.hibernate.Session session = sf.openSession();
		Transaction tx = (Transaction) session.beginTransaction();
		session.save(p);
		tx.commit();
		
		String Msg=  "Product Added Successfully";
		mv.setViewName("addProduct.jsp");
		mv.addObject("Msg", Msg);
		
		return mv ;
		
	}
	
	@RequestMapping(value="addstock", method = RequestMethod.GET)
	public ModelAndView idForaddstock(HttpServletRequest request) {
		
		ModelAndView mv =  new ModelAndView() ;
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		mv.addObject("pid", pid);
		mv.setViewName("addStock.jsp");
		
		return mv;
		
	}
	
	@RequestMapping("addStockDB")
	public ModelAndView addStockDB(@RequestParam("n") int sn, @RequestParam("id") int pid ) {
		
		ModelAndView mv = new ModelAndView();
		
		Configuration cfg = new Configuration().configure().addAnnotatedClass(Product.class);			
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory = cfg.buildSessionFactory();
		Session Session = factory.openSession();
		Transaction t = Session.beginTransaction();
		
		Product temp = (Product) Session.get(Product.class, pid);
		
		int x=temp.getStock();
		System.out.print(x);
		int nx = x + sn;
		System.out.print(nx);
		
		temp.setStock(nx);
		Session.update(temp);
		
		String Msg=  "Stock Added Successfully.";
		mv.setViewName("addStock.jsp");
		mv.addObject("id",4);
		mv.addObject("pid",pid);
		mv.addObject("Msg", Msg);
		
		t.commit();
		Session.close();
		factory.close();
		
		return mv;
		
		
	}
		
	
	@RequestMapping("cnfPlaceOrder")
	public ModelAndView cnfPlaceOrder(@RequestParam("id") int id, @RequestParam("pid") int pid )  {
	
		ModelAndView mv = new ModelAndView();
		
		Configuration cfg = new Configuration().configure().addAnnotatedClass(Product.class);			
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory = cfg.buildSessionFactory();
		Session Session = factory.openSession();
		Transaction t = Session.beginTransaction();
		
		Product temp = (Product) Session.get(Product.class, pid);
		
		int x=temp.getStock();
		System.out.print(x);
		x--;
		System.out.print(x);
		
		temp.setStock(x);
		Session.update(temp);
		
		t.commit();
		Session.close();
		factory.close();
		
		java.util.Date date=new java.util.Date();
		java.sql.Date sqlDate=new java.sql.Date(date.getTime());
		System.out.println(sqlDate);
		Order o = new Order();
		
		o.setDate(sqlDate);
		o.setPid(pid);
		o.setUid(id);
		
		
		
		
		
		Configuration con1 = new Configuration().configure().addAnnotatedClass(Order.class);
		SessionFactory sf1 = con1.buildSessionFactory();
		org.hibernate.Session session1 = sf1.openSession();
		Transaction tx1 = (Transaction) session1.beginTransaction();
		session1.save(o);
		tx1.commit();
		
		
		mv.addObject("id",id);
		mv.addObject("pid", pid);
		mv.setViewName("showOrder.jsp");
		
		return mv;
	}

}
