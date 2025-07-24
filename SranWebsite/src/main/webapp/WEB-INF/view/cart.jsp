<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/sranlogo.png">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">
    
   <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
   <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&display=swap" rel="stylesheet">

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
   
  <main class="cart-container">
  <h1>Shopping Cart</h1>

  <c:forEach var="item" items="${cart.items.values()}">
    <div class="cart-item">
      <div class="cart-item-image">
        <img src="${pageContext.request.contextPath}/${item.product.imageUrl}" alt="${item.product.productDescription}" />
      </div>
      <div class="cart-item-details">
        <h3>${item.product.productDescription}</h3>
        <p><strong>Size:</strong> ${item.size}</p>
        <p>Rs. ${item.product.price}</p>
        <div class="cart-item-qty">
          <!-- Update + -->
          <form action="${pageContext.request.contextPath}/cartController/action" method="post" style="display: inline;">
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="productId" value="${item.product.productId}" />
            <input type="hidden" name="selectedSize" value="${item.size}" />
            <input type="hidden" name="quantity" value="${item.quantity + 1}" />
            <button type="submit">+</button>
          </form>

          <!-- Quantity display -->
          <span>${item.quantity}</span>

          <!-- Update - -->
          <form action="${pageContext.request.contextPath}/cartController/action" method="post" style="display: inline;">
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="productId" value="${item.product.productId}" />
            <input type="hidden" name="selectedSize" value="${item.size}" />
            <input type="hidden" name="quantity" value="${item.quantity - 1}" />
            <button type="submit" <c:if test="${item.quantity == 1}">disabled</c:if>>-</button>
          </form>

          <!-- Remove -->
          <form action="${pageContext.request.contextPath}/cartController/action" method="post" style="display: inline;">
            <input type="hidden" name="action" value="remove" />
            <input type="hidden" name="productId" value="${item.product.productId}" />
            <input type="hidden" name="selectedSize" value="${item.size}" />
            <button type="submit" class="remove-btn">Remove</button>
          </form>
        </div>
      </div>
    </div>
  </c:forEach>

  <div class="cart-footer">
  <p><strong>Total:</strong> Rs. ${totalPrice}</p>

  
  <c:choose>
  <c:when test="${totalPrice == 0}">
    <button class="checkout-btn" disabled>Checkout</button>
  </c:when>
  <c:otherwise>
    <a href="${pageContext.request.contextPath}/checkoutController/checkout"
       class="checkout-btn">Checkout</a>
  </c:otherwise>
</c:choose>
  

  <a href="${pageContext.request.contextPath}/cartController/clear" class="view-cart-link">Clear Cart</a>
</div>

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
