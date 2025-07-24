<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.sran.model.Orders" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderhistory.css">
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/sranlogo.png">
</head>
<body>
  
  <header>
    <div><strong>Sran</strong></div>
    <nav>
      <a href="${pageContext.request.contextPath}/">Home</a>
      
      <a href="${pageContext.request.contextPath}/topsController/tops">Tops</a>
      <a href="${pageContext.request.contextPath}/shrugsController/shrugs">Shrugs</a>
      <a href="${pageContext.request.contextPath}/kurtisController/kurtis">Kurtis</a>
      <a href="#">Kurta Sets</a>
      <a href="${pageContext.request.contextPath}/dressController/dress">Dresses</a>
      
    </nav>
    
    
     <div class="header-icons">
     <div class="search-box">
  <form action="${pageContext.request.contextPath}/searchController/search" method="get">
    <input type="text" placeholder="Search for products, categories..." name="search">
    <button type="submit" ><i class='bx bx-search'></i></button>
  </form>
</div>
    
    <c:choose>
    <c:when test="${not empty loggedInUser}">
      <span>${loggedInUser.customerName}</span>
      <a href="${pageContext.request.contextPath}/logoutController/logout" >Logout</a>
      <a href="${pageContext.request.contextPath}/orderhistory">Orders</a>
    </c:when>
    <c:otherwise>
      <a href="${pageContext.request.contextPath}/loginController/login">
        <i class='bx bx-user'></i>
      </a>
    </c:otherwise>
  </c:choose>
      
      <a href="${pageContext.request.contextPath}/wishlist"><i class='bx bx-heart'></i></a>
      <a href="${pageContext.request.contextPath}/cartController/cartView"><i class='bx bx-cart'></i></a>
      
      
    </div>
  </header>
<main>
<h2 style="text-align:center;padding:30px">Your Order History</h2>

<%
    List<Orders> orders = (List<Orders>) request.getAttribute("orders");
    if (orders != null && !orders.isEmpty()) {
%>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Date</th>
            <th>Total Price</th>
            <th>Status</th>
        </tr>
        <%
            for (Orders order : orders) {
        %>
            <tr>

               <td>
               
               <form action="${pageContext.request.contextPath}/orderController/items" method="get">
    <input type="hidden"  name="orderId" value="<%= order.getOrderId() %>">
    <button type="submit" ><%= order.getOrderId() %></button>
  </form>
               
               </td>
				
                <td><%= order.getOrderDate() %></td>
                <td>₹<%= order.getTotalAmount() %></td>
                <td><%= order.getStatus() %></td>
            </tr>
        <%
            }
        %>
    </table>
<%
    } else {
%>
    <p style="text-align:center;">You haven't placed any orders yet.</p>
<%
    }
%>
</main>
<footer>
    <div class="footer-col">
      <h4>Information</h4>
      <ul>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Washcare</a></li>
        <li><a href="#">FAQ</a></li>
        <li><a href="#">Terms & Conditions</a></li>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Refund Policy</a></li>
        <li><a href="#">Shipping Policy</a></li>
      </ul>
    </div>
    <div class="footer-col">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li><a href="#">Best Sellers</a></li>
        <li><a href="#">New Arrivals</a></li>
        <li><a href="${pageContext.request.contextPath}/topsController/tops">Tops</a></li>
        <li><a href="${pageContext.request.contextPath}/kurtisController/kurtis">Kurta</a></li>
        <li><a href="#">Kurta Sets</a></li>
        <li><a href="${pageContext.request.contextPath}/dress">Dress</a></li>
        <li><a href="#">Sale</a></li>
        <li><a href="#">Size Guide</a></li>
      </ul>
    </div>
    <div class="footer-col subscribe">
      <h4>Subscribe</h4>
      <p>Enter your email below to be the first to know about new collections and product launches.</p>
      <input type="email" placeholder="Enter your email" />
      <button>Subscribe</button>
    </div>
  </footer>
</body>
</html>
