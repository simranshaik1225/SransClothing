<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Srans - Home</title>
   <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
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
      <a href="${pageContext.request.contextPath}/orderController/myOrders">Orders</a>
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

  <div class="hero">Shop New Arrivals</div>

  


  <section class="section">
    <h2>Kurtis</h2>
    
<div class="products">
  <c:forEach var="product" items="${kurtis}">
    <div class="product-card">
      <div class="image-container">
        <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.productDescription}">
        <div class="hover-icons">
          
          <form action="${pageContext.request.contextPath}/wishlist/add" method="post" style="display:inline;">
    <input type="hidden" name="productId" value="${product.productId}">
    <button type="submit" class="icon" style="border:none; cursor:pointer;">
      <i class='bx bx-heart'></i>
    </button>
  </form>
          
        </div>
        <form action="${pageContext.request.contextPath}/kurtisController/product" method="get">
  <input type="hidden" name="id" value="${product.productId}" />
  <button type="submit" class="select-btn">Select options</button>
</form>

      </div>
      <h3>${product.category.categoryDescription}</h3>
      <p>₹${product.price}</p>
    </div>
  </c:forEach>
</div>
    <div class="shop-more" onclick="location.href='${pageContext.request.contextPath}/kurtisController/kurtis'"><button>Shop more</button></div>
  </section>
  
  
  
  <section class="section">
    <h2>Tops</h2>
    
<div class="products">
  <c:forEach var="product" items="${tops}">
    <div class="product-card">
      <div class="image-container">
        <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.productDescription}">
        <div class="hover-icons">
          
          <form action="${pageContext.request.contextPath}/wishlist/add" method="post" style="display:inline;">
    <input type="hidden" name="productId" value="${product.productId}">
    <button type="submit" class="icon" style="border:none; cursor:pointer;">
      <i class='bx bx-heart'></i>
    </button>
  </form>
          
        </div>
        <form action="${pageContext.request.contextPath}/topsController/product" method="get">
  <input type="hidden" name="id" value="${product.productId}" />
  <button type="submit" class="select-btn">Select options</button>
</form>

      </div>
      <h3>${product.category.categoryDescription}</h3>
      <p>₹${product.price}</p>
    </div>
  </c:forEach>
</div>
    <div class="shop-more" onclick="location.href='${pageContext.request.contextPath}/topsController/tops'"><button>Shop more</button></div>
  </section>
  
  <section class="section">
    <h2>Dresses</h2>
    
<div class="products">
  <c:forEach var="product" items="${dresses}">
    <div class="product-card">
      <div class="image-container">
        <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.productDescription}">
        <div class="hover-icons">
         
          <form action="${pageContext.request.contextPath}/wishlist/add" method="post" style="display:inline;">
    <input type="hidden" name="productId" value="${product.productId}">
    <button type="submit" class="icon" style="border:none; cursor:pointer;">
      <i class='bx bx-heart'></i>
    </button>
  </form>
         
        </div>
        <form action="${pageContext.request.contextPath}/dressController/product" method="get">
  <input type="hidden" name="id" value="${product.productId}" />
  <button type="submit" class="select-btn">Select options</button>
</form>

      </div>
      <h3>${product.category.categoryDescription}</h3>
      <p>₹${product.price}</p>
    </div>
  </c:forEach>
</div>
    <div class="shop-more" onclick="location.href='${pageContext.request.contextPath}/dressController/dress'"><button>Shop more</button></div>
  </section>

  <section class="section">
    <h2>Shrugs</h2>
    
<div class="products">
  <c:forEach var="product" items="${shrugs}">
    <div class="product-card">
      <div class="image-container">
        <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.productDescription}">
        <div class="hover-icons">
          
          <form action="${pageContext.request.contextPath}/wishlist/add" method="post" style="display:inline;">
    <input type="hidden" name="productId" value="${product.productId}">
    <button type="submit" class="icon" style="border:none; cursor:pointer;">
      <i class='bx bx-heart'></i>
    </button>
  </form>
         
        </div>
        <form action="${pageContext.request.contextPath}/shrugsController/product" method="get">
  <input type="hidden" name="id" value="${product.productId}" />
  <button type="submit" class="select-btn">Select options</button>
</form>

      </div>
      <h3>${product.category.categoryDescription}</h3>
      <p>₹${product.price}</p>
    </div>
  </c:forEach>
</div>
   <div class="shop-more" onclick="location.href='${pageContext.request.contextPath}/shrugsController/shrugs'"><button>Shop more</button></div>
  </section>



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
        <li><a href="#">Home</a></li>
        <li><a href="#">Best Sellers</a></li>
        <li><a href="#">New Arrivals</a></li>
        <li><a href="#">Tops</a></li>
        <li><a href="${pageContext.request.contextPath}/kurtisController/kurtis">Kurta</a></li>
        <li><a href="#">Kurta Sets</a></li>
        <li><a href="#">Dress</a></li>
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
