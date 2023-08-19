package vehicleOnlineShop;

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
public class addUserController {
    
	@RequestMapping("adduser")
	public ModelAndView adduser(@RequestParam("username") String uname, @RequestParam("phoneno") int phoneno, 
			@RequestParam("password") String password, @RequestParam("cpassword") String cpassword) {
		ModelAndView mv = new ModelAndView();

		if(password.equals(cpassword)) {
			
			Customer c = new Customer();
			c.setName(uname);
			c.setPassword(cpassword);
			c.setPhone_no(phoneno);
//			c.setAddress("abc");
			c.setRoll_id(2);
//			c.setGender("Female");
			
			Configuration con = new Configuration().configure().addAnnotatedClass(Customer.class);
			SessionFactory sf = con.buildSessionFactory();
			org.hibernate.Session session = sf.openSession();
			Transaction tx = (Transaction) session.beginTransaction();
			session.save(c);
			tx.commit();
			
			String Msg=  "You Registered Successfully.";
			mv.setViewName("index.jsp");
			mv.addObject("Msg", Msg);
		}
		else {
			
			String Msg=  "Password and Confirm Password Are Not Same!!";
			mv.setViewName("Registration.jsp");
			mv.addObject("Msg", Msg );
			
		}
		
		
		
		return mv;
	}
	

	@RequestMapping("/verifyUser")
	public ModelAndView verifyUser(@RequestParam("username") String uname,@RequestParam("password") String password ) {
		
		System.out.println("Verify User....");
		ModelAndView mv = new ModelAndView();	
		int flag=0;
		try {
			Configuration cfg = new Configuration().configure().addAnnotatedClass(Customer.class);			
			cfg.configure("hibernate.cfg.xml");
			SessionFactory factory = cfg.buildSessionFactory();
			org.hibernate.Session session = factory.openSession();
			
			
			String name = null;
			Customer c = new Customer();
			int rid = 0 , id = 0;
			@SuppressWarnings("rawtypes")
			java.util.List li = session.createQuery("from Customer where name='" + uname + "' and password='" + password + "'" ).list();
			@SuppressWarnings("rawtypes")
			java.util.Iterator it=li.iterator();
			while(it.hasNext()) {
				Object o = (Object)it.next();
				Customer r = (Customer)o;
			     name = r.getName();
			     rid = r.getRoll_id();
			     id = r.getId();
			     c = r ;
				 System.out.println(r.getId());
				flag++;
			}
			session.close();
			factory.close();
			if(flag==1)
			{
				mv.setViewName("home.jsp");
				mv.addObject("Username",name);
				mv.addObject("rollid",rid);
				mv.addObject("id",id);
			
			}
			else {
				String msg = "Email Or Password Incorrect!";
				mv.setViewName("index.jsp");
				mv.addObject("Msg",msg);
				
			}
							
		}
		catch(Exception ex) {
			System.out.println(ex);	
		}
		return mv;
		
	}
	
	
	@RequestMapping("editData")
	public ModelAndView editData(@RequestParam("id") int id,@RequestParam("un") String un, @RequestParam("pn") int phoneno,
			@RequestParam("g") String g , @RequestParam("address") String address ) {
		
		
		ModelAndView mv = new ModelAndView();
		
		Configuration cfg = new Configuration().configure().addAnnotatedClass(Customer.class);			
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory = cfg.buildSessionFactory();
		Session Session = factory.openSession();
		Transaction t = Session.beginTransaction();
		
		Customer temp = (Customer) Session.get(Customer.class, id);
//		
//		if(temp != null) {
//			
			temp.setName(un);
			temp.setPhone_no(phoneno);
			temp.setGender(g);
			temp.setAddress(address);
			Session.update(temp);
			
			String Msg=  "Record Updated Successfully.";
			mv.setViewName("myProfile.jsp");
			mv.addObject("id",id);
			mv.addObject("Msg", Msg);
			
			
			
//		}else {
//			String Msg = "Record not updated !!";
//			mv.setViewName("editProfile.jsp");
//			mv.addObject("id",id);
//			mv.addObject("Msg" , Msg );
//			
//		}
				
		t.commit();
		Session.close();
		factory.close();
		
		
		return mv ;
	}
	
	
	@RequestMapping("adminhomepage")
	public ModelAndView adminhomepage() {
		
		ModelAndView mv = new ModelAndView();
        mv.setViewName("home.jsp");
			//mv.addObject("Username","admin");
			mv.addObject("rollid",1);
		return mv;
		
	}
	
	
	@RequestMapping(value = "backToHome",  method = RequestMethod.GET)
	public ModelAndView backToHomeForUser(HttpServletRequest request) {
		int Id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mv = new ModelAndView();
        mv.setViewName("home.jsp");
//			mv.addObject("Username",);
			mv.addObject("id", Id);
			mv.addObject("rollid",2);
		return mv;
		
	}
	
	
	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public ModelAndView idFormyProfile(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		int Id = Integer.parseInt(request.getParameter("id"));
		mv.addObject("id", Id);
		mv.setViewName("myProfile.jsp");
		return mv ;
	}
	
	
	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public ModelAndView idForeditProfile(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		int Id = Integer.parseInt(request.getParameter("id"));
		mv.addObject("id", Id);
		mv.setViewName("editProfile.jsp");
		return mv ;
	}
	
//	@SuppressWarnings("null")
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public ModelAndView idForWishlist(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		int Id = Integer.parseInt(request.getParameter("id"));
		
		mv.addObject("id", Id);
		//mv.addObject("PList", pl);
		mv.setViewName("showWishlist.jsp");
		return mv ;
	}
	
	
	@RequestMapping(value = "addToCard", method = RequestMethod.GET)
	public ModelAndView addToCard(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		int Id = Integer.parseInt(request.getParameter("id"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		System.out.print(pid);
		
		Wishlist c = new Wishlist();
		c.setPid(pid);
		c.setUid(Id);
		
		Configuration con = new Configuration().configure().addAnnotatedClass(Wishlist.class);
		SessionFactory sf = con.buildSessionFactory();
		org.hibernate.Session session = sf.openSession();
		Transaction tx = (Transaction) session.beginTransaction();
		session.save(c);
		tx.commit();
		
		
		
		mv.addObject("id", Id);
		mv.addObject("rollid", 2);
		mv.setViewName("home.jsp");
		return mv ;
	}
	
	
	@RequestMapping(value = "/placeOrderForm", method = RequestMethod.GET)
	public ModelAndView placeOrderform(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		int Id = Integer.parseInt(request.getParameter("id"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		
		
		mv.addObject("id", Id);
		mv.addObject("pid", pid);
		mv.setViewName("placeOrder.jsp");
		return mv ;
	}
	
	@RequestMapping(value = "showOrder", method = RequestMethod.GET)
	public ModelAndView showOrder(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		int Id = Integer.parseInt(request.getParameter("id"));
		
		
		mv.addObject("id", Id);
		
		mv.setViewName("showOrder.jsp");
		return mv ;
	}
	
	
	
	

}
 