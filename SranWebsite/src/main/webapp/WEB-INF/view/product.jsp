<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product</title>
    
    
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/sranlogo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dress.css">
    
   <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
   <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;700&display=swap" rel="stylesheet">
	<style>
  .sizeBtn {
    padding: 10px 15px;
    border: 1px solid #000;
    background: #fff;
    cursor: pointer;
  }

  .sizeBtn:hover {
    background: #eee;
  }

  .sizeBtn.active {
    background: #000;
    color: #fff;
  }
  .product-images {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 20px;
  }

  .product-images .thumbnails {
    display: flex;
    gap: 10px;
  }

  .product-images .thumbnails img {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border: 1px solid #ccc;
    cursor: pointer;
  }

  .product-images .main-image img {
    width: 100%;
    max-width: 500px;
    height: auto;
    border: 1px solid #ccc;
  }
</style>
	
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
   <main style="max-width: 1200px; margin: 50px auto; display: flex; gap: 50px; font-family: Arial, sans-serif;">

  <div class="product-images">
    
    <div class="main-image">
      <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.productDescription}" />
    </div>
  </div>

  <form action="${pageContext.request.contextPath}/cartController/action" method="post" style="flex:1;">
    <input type="hidden" name="productId" value="${product.productId}">
    <input type="hidden" name="selectedSize" id="selectedSize">
    <input type="hidden" name="quantity" id="quantityInput" value="1">
    <input type="hidden" name="action" value="add">

    <h1 style="font-family: 'Playfair Display', serif; font-size: 2rem; margin-bottom: 10px;">${product.category.categoryDescription}</h1>
    <p style="font-size: 1.2rem; margin-bottom: 20px;">Rs. ${product.price}</p>

    <div style="margin-bottom: 20px;">
      <p>Size:</p>
      <div id="sizeOptions" style="display: flex; flex-wrap: wrap; gap: 10px;"></div>
    </div>

    <div style="margin-bottom: 20px;">
      <p>Quantity:</p>
      <button id="decreaseQty" type="button">-</button>
      <span id="quantityValue">1</span>
      <button id="increaseQty" type="button">+</button>
    </div>

    <button type="submit" style="padding: 10px 20px; background: black; color: white; border: none; cursor: pointer;">Add to Cart</button>
  </form>

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
  <script>
  const sizes = ['XS', 'S', 'M', 'L', 'XL'];
  const sizeContainer = document.getElementById('sizeOptions');
  const selectedSizeInput = document.getElementById('selectedSize');

  sizes.forEach((size, index) => {
    const btn = document.createElement('button');
    btn.type = 'button'; // IMPORTANT!!
    btn.textContent = size;
    btn.className = 'sizeBtn';

    if (index === 0) {
      btn.classList.add('active');
      selectedSizeInput.value = size;
    }

    btn.onclick = () => {
      document.querySelectorAll('.sizeBtn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      selectedSizeInput.value = size;
    };

    sizeContainer.appendChild(btn);
  });

  const qtyValue = document.getElementById('quantityValue');
  const qtyInput = document.getElementById('quantityInput');
  const decreaseBtn = document.getElementById('decreaseQty');
  const increaseBtn = document.getElementById('increaseQty');

  let quantity = 1;

  decreaseBtn.onclick = () => {
    if (quantity > 1) {
      quantity--;
      qtyValue.textContent = quantity;
      qtyInput.value = quantity;
    }
  };

  increaseBtn.onclick = () => {
    if (quantity < 10) {
      quantity++;
      qtyValue.textContent = quantity;
      qtyInput.value = quantity;
    }
  };
</script>


  
</body>
</html>