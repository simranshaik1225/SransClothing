<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Wishlist</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/sranlogo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/wishlist.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
  <div class="wishlist-container"> 

    <%-- LOGIC: if user is logged in show wishlist, else show login message --%>
    <c:choose>
      <c:when test="${loggedInUser != null}">
        <c:choose>
          <c:when test="${not empty wishlist.items}">
            <c:forEach var="item" items="${wishlist.items}">
              <div class="wishlist-item">
                <img src="${pageContext.request.contextPath}/${item.product.imageUrl}" alt="${item.product.productDescription}">
                <div class="wishlist-details">
                  <h3>${item.product.category.categoryDescription}</h3>
                  <p>Price: ₹${item.product.price}</p>
                </div>
                <form action="${pageContext.request.contextPath}/wishlist/remove" method="get" style="margin-bottom: 10px;">
                  <input type="hidden" name="productId" value="${item.product.productId}" />
                  <button type="submit" class="select-btn">Remove</button>
                </form>
                <form action="${pageContext.request.contextPath}/wishlist/product" method="get">
                  <input type="hidden" name="id" value="${item.product.productId}" />
                  <button type="submit" class="select-btn">Select options</button>
                </form>
              </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <p>Your wishlist is empty.</p>
          </c:otherwise>
        </c:choose>
      </c:when>

      <c:otherwise>
        <p style="text-align:center; margin:50px; font-size:20px;">
          Please <a href="${pageContext.request.contextPath}/loginController/login">login</a> to view or add items to your wishlist.
        </p>
      </c:otherwise>
    </c:choose>

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
