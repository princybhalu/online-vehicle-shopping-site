<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import="vehicleOnlineShop.Product" %>
<%@ page import=" org.hibernate.cfg.Configuration" %>
<%@ page import=" org.hibernate.SessionFactory" %>
<%@ page import="org.springframework.web.servlet.ModelAndView " %>
<%@ page import="org.springframework.stereotype.Controller " %>
<%@ page import="vehicleOnlineShop.Customer" %>
<%@ page import="org.hibernate.Session " %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Stock</title>
<style>
.card-img-top {
    width: 100%;
    height: 15vw;
    object-fit: cover;
}
</style>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd; font-size : 20px; ">
        <div class="container-fluid">
          <a class="navbar-brand" href="#" style="font-size: 23px;">Vehicle Vila</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link " aria-current="page" href="adminhomepage">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Add Product</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="viewCustomer.jsp">View Customer</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="inventory.jsp">Inventory</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="index.jsp">Log Out</a>
              </li>
              
              <!-- <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
              </li> -->
            </ul>
          </div>
        </div>
      </nav>

      <div class="text-center fs-5" style="font-size: 20px; margin-top: 15px; "> ${ Msg } </div>
      
      
      <div class="text-center fs-4" style="font-size: 18px; margin-top: 20px; ">Add Stock</div>

      
      <% 
      
      int pid = (Integer) request.getAttribute("pid");
      
      try {
    		Configuration cfg = new Configuration().configure().addAnnotatedClass(Product.class);			
    		cfg.configure("hibernate.cfg.xml");
    		SessionFactory factory = cfg.buildSessionFactory();
    		Session Session = factory.openSession();
    		
    		
    		
    		java.util.List li = Session.createQuery("from Product where id = " + pid ).list();
    		java.util.Iterator it=li.iterator();
    		while(it.hasNext()) {
    			Object o = (Object)it.next();
    			Product rs = (Product)o;
    		    
    		     
    		   
    		     
      %>
     
      <div class="container" style="margin-top: 30px;">
      
      <div class="card mb-3" >
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="<% out.print(rs.getImageurl()); %>" class="card-img-top card-img" style="hight='300'; width='300'">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><% out.print(rs.getName());  %></h5>
        <p class="card-text">Available Stock : <% out.print(rs.getStock()); %></p>
        <p class="card-text">Company : <% out.print(rs.getCompany()); %></p>
        <p class="card-text">Price : <% out.print(rs.getPrice()); %></p>
        
        <p class="card-text"><small class="text-muted"><% out.print(rs.getFeature()); %></small></p>
      </div>
    </div>
  </div>
</div>

      <form action="addStockDB" method="post" >
      <input type="hidden" name='id' value="<%  out.print(rs.getId() ); %> "  >
        <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Add Stock</label>
            <input type="text" class="form-control" id="formGroupExampleInput" name="n" placeholder="Enter Stock Number">
          </div>
          
         
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
      </div>
      <%  
	     
		 System.out.println(rs.getId());
		//flag++;
	}
	Session.close();
	factory.close();
}
catch(Exception ex) {
	System.out.println(ex);	
}
      %>

</body>
</html>