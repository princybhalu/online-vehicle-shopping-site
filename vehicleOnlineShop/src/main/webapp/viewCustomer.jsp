<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>View Customer</title>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<% String name = null;
Customer c = new Customer();
int rid = 0 , id = 0; %>

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
                <a class="nav-link active" href="#">View Customer</a>
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
      
      <div class="text-center fs-4" style="font-size: 18px; margin-top: 20px; ">All Customer List</div>

<div class="container" style="margin-top: 20px;">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">USER NAME</th>
            <th scope="col">GENDER</th>
            <th scope="col">ADDRESS</th>
            <th scope="col">PHONE_NO</th>
          </tr>
        </thead>
        <tbody>
        
<%
try {
	Configuration cfg = new Configuration().configure().addAnnotatedClass(Customer.class);			
	cfg.configure("hibernate.cfg.xml");
	SessionFactory factory = cfg.buildSessionFactory();
	Session Session = factory.openSession();
	
	
	
	java.util.List li = Session.createQuery("from Customer where roll_id = 2").list();
	java.util.Iterator it=li.iterator();
	while(it.hasNext()) {
		Object o = (Object)it.next();
		Customer rs = (Customer)o;
	     name = rs.getName();
	     rid = rs.getRoll_id();
	     id = rs.getId();
	     
	     %>


         <tr>
           <th scope="row"><% out.print(rs.getId()); %></th>
           <td><% out.print(rs.getName()); %></td>
           <td><% out.print(rs.getGender()); %></td>
           <td><% out.print(rs.getAddress() ); %></td>
           <td><% out.print(rs.getPhone_no()); %></td>
         </tr>
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
        </tbody>
      </table>
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
</body>
</html>