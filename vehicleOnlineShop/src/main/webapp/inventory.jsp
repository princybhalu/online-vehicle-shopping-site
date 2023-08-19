<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import=" org.hibernate.cfg.Configuration" %>
<%@ page import=" org.hibernate.SessionFactory" %>
<%@ page import="org.springframework.web.servlet.ModelAndView " %>
<%@ page import="org.springframework.stereotype.Controller " %>
<%@ page import="vehicleOnlineShop.Product" %>
<%@ page import="org.hibernate.Session " %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inventory</title>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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
                <a class="nav-link" aria-current="page" href="adminhomepage">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="addProduct.jsp">Add Product</a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="viewCustomer.jsp">View Customer</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="#">Inventory</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="wishlist?id=${id}">Wish List</a>
              </li>
               
              <!-- <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
              </li> -->
            </ul>
          </div>
        </div>
      </nav>


<div class="text-center fs-4" style="font-size: 18px; margin-top: 20px; ">Inventory Stock</div>

<div class="container" style="margin-top: 20px;">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">NAME</th>
            <th scope="col">Company</th>
            <th scope="col">Price</th>
            <th scope="col">Stock</th>
            <th scope="col">Add Stock</th>
          </tr>
        </thead>
        <tbody>
        
<%
try {
	Configuration cfg = new Configuration().configure().addAnnotatedClass(Product.class);			
	cfg.configure("hibernate.cfg.xml");
	SessionFactory factory = cfg.buildSessionFactory();
	Session Session = factory.openSession();
	
	
	
	java.util.List li = Session.createQuery("from Product").list();
	java.util.Iterator it=li.iterator();
	while(it.hasNext()) {
		Object o = (Object)it.next();
		Product rs = (Product)o;
	     
	     %>


         <tr>
           <th scope="row"><% out.print(rs.getId()); %></th>
           <td><% out.print(rs.getName()); %></td>
           <td><% out.print(rs.getCompany()); %></td>
           <td><% out.print(rs.getPrice() ); %></td>
           <td><% out.print(rs.getStock()); %></td>
           <td><a class="btn btn-primary" href="addstock?pid=<% out.print(rs.getId());  %>" role="button">Add Stock</a></td>
         </tr>
         <%  
	     
		 
	}
	Session.close();
	factory.close();
}
catch(Exception ex) {
	System.out.println(ex);	
}



         
          %>
        </tbody>
      </table>
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
</body>
</html>