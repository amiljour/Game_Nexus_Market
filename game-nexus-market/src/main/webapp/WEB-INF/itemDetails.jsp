<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en" data-theme="synthwave">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Item Details</title>
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdn.jsdelivr.net/npm/daisyui@4.9.0/dist/full.min.css"
	rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script>
</head>
<body>
	<!-- Header -->
	<div>
		<nav class="border-gray-200 dark:bg-gray-900">
		
		    <!-- Desktop Menu View -->
		    <div class="lg:flex hidden justify-between items-center mx-auto max-w-screen-xl p-4">
		        <a href="/" class="flex items-center space-x-3 rtl:space-x-reverse">
		            <img src="/images/GameController.png" class="h-8" alt="Game Controller Logo" />
		            <span class="text-center text-5xl font-semibold dark:text-white">Game Nexus Market</span>
		        </a>
		        <div class="flex g-2 items-center">
		            <p class="mx-2">${cartSize}</p>
		            <a href="/shoppingCart"><img src="/images/ShoppingCart2.png" alt="Shopping Cart" class="h-8" /></a>
		        </div>
		    </div>
		    
		    <!-- Mobile Menu View -->
		    <div class="flex lg:hidden justify-center items-center mx-auto max-w-screen-xl p-4">
		        <a href="/" class="flex items-center space-x-3 rtl:space-x-reverse">
		            <img src="/images/GameController.png" class="h-8" alt="Game Controller Logo" />
		            <span class="text-center text-4xl sm:text-5xl font-semibold dark:text-white">Game Nexus Market</span>
		        </a>
		    </div>
		</nav>
		
		<!-- Desktop Navigation Bar -->
		<nav class="hidden md:flex bg-gray-50 dark:bg-gray-700">
		    <div class="w-full px-4 py-3 mx-auto">
		        <div class="flex items-center justify-around">
		            <ul class="flex flex-row flex-wrap justify-around font-medium mt-0 space-x-8 rtl:space-x-reverse text-md items-center w-full mx-24">
						
						<!-- Dashboard -->
						<li>
							<a href="/" class="block py-2  rounded hover:text-accent" aria-current="page">Dashboard</a>
						</li>
						
						<!-- Categories Drop Down Menu -->
						<li>
							<button id="dropdownNavbarLink" data-dropdown-toggle="dropdownNavbar" class="flex items-center justify-between w-full py-2 text-white hover:text-accent">
								Categories
								<svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 10 6">
    								<path stroke="currentColor" stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4" />
  								</svg>
							</button> 
							
							<!-- Drop Down Options -->
							<div id="dropdownNavbar"
								class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
								<ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownLargeButton">
									<c:forEach var="category" items="${categories}">
 										<li>
 											<a href="/category/${category.id}" class="block px-4 py-2 hover:bg-gray-600 hover:text-accent">
 												<c:out value="${category.name}"></c:out>
 											</a>
 										</li>
        							</c:forEach>
								</ul>
							</div>
						</li>
							
						<!-- All Items -->	
						<li><a href="/allItems" class="block py-2 text-white rounded hover:text-accent">All Items</a></li>
						
						<!-- Items Available -->
						<li><a href="/itemsAvailable" class="block py-2 text-white rounded hover:text-accent">Items Available</a></li>
						
						<!-- Items Not Available -->
						<li><a href="/itemsNotAvaiable" class="block py-2 text-white rounded hover:text-accent">Items Not Available</a></li>
						
						<!-- Items on Sale -->
						<li><a href="/itemsOnSale" class="block py-2 text-white rounded hover:text-accent">Items on Sale</a></li>
						
						<!-- Admin Home Page -->
						<c:if test="${userId != null}">
							<li><a href="/admin" class="block py-2 rounded hover:text-accent">Admin Home</a></li>
						</c:if>
						
						<!-- Search-Bar ***In Progress*** -->
						<li>
							<button type="button"
								data-collapse-toggle="navbar-search"
								aria-controls="navbar-search" aria-expanded="false"
								class="md:hidden text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5 me-1">
								<svg class="w-5 h-5" aria-hidden="true"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 20 20">
        							<path stroke="currentColor" stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
      								</svg>
								<span class="sr-only">Search</span>
							</button>
							<div class="relative hidden md:block">
								<div
									class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
									<svg class="w-4 h-4 text-gray-500 dark:text-gray-400"
										aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 20 20">
          								<path stroke="currentColor" stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
        							</svg>
									<span class="sr-only">Search icon</span>
								</div>
								<input type="text" id="search-navbar"
									class="block w-full p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
									placeholder="Search...">
							</div>
						</li>
					</ul>

				</div>
			</div>
		</nav>
	</div>

	<!-- Mobile Navigation Bar -->
	<div class="md:hidden flex justify-between items-center sticky top-0 z-50 bg-base-100">
	    <button id="mobile-menu-button" class="ml-3 text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5">
	        <svg class="w-7 h-7" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
	            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
	        </svg>
	        <span class="sr-only">Open main menu</span>
	    </button>
	    
	    <!-- Page Currently On -->
	    <h2 id="mobile-menu-trigger" class="cursor-pointer text-xl font-semibold"><c:out value="${item.name}"></c:out></h2>
	    
	    <div class="flex g-2 items-center mr-3">
			<p class="mx-2">${cartSize}</p>
			<a href="/shoppingCart"> <img src="/images/ShoppingCart2.png" alt="Shopping Cart" class="h-8" /></a>
		</div>
	</div>


	<!-- Mobile Menu Drop-Down -->
	<div class="md:hidden hidden sticky top-0 z-50" id="mobile-menu">
	    <ul class="flex flex-col text-center text-xl text-white p-4 mt-4 bg-gray-50 dark:bg-gray-700 rounded-lg border border-gray-100 dark:border-gray-600">
	    
	    	<!-- Dashboard -->
	        <li><a href="/" class="block py-2 px-3  rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Dashboard</a></li>
	        
	        <!-- Category Drop-Down Menu -->
			<li>
				<button id="dropdownNavbarLink2" data-dropdown-toggle="dropdownNavbar2" class="flex items-center justify-center w-full block py-2 px-3 text-white rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Categories
					<svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
    					<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4" />
  					</svg>
				</button> 
							
				<!-- Category Drop-Down Options -->
				<div id="dropdownNavbar2" class="hidden z-10 bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
					<ul class="py-2 text-xl text-white dark:text-gray-200" aria-labelledby="dropdownLargeButton">
						<c:forEach var="category" items="${categories}">
 							<li>
 								<a href="/category/${category.id}" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 text-white">
 									<c:out value="${category.name}"></c:out>
 								</a>
 							</li>
        				</c:forEach>
					</ul>
				</div>
			</li>
			
			<!-- All Items -->
	        <li><a href="/allItems" class="block py-2 px-3  rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">All Items</a></li>
	        
	        <!-- Items Available -->
	        <li><a href="/itemsAvailable" class="block py-2 px-3  rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Items Available</a></li>
	        
	        <!-- Items Not Available -->
	        <li><a href="/itemsNotAvaiable" class="block py-2 px-3  rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Items Not Available</a></li>
	        
	        <!-- Items on Sale -->
	        <li><a href="/itemsOnSale" class="block py-2 px-3  rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Items on Sale</a></li>
	        
	        <!-- Admin Home Page -->
	        <c:if test="${userId != null}">
				<li><a href="/admin" class="block py-2 px-3  rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white" >Admin Home</a></li>
			</c:if>
    	</ul>
	</div>

	<!-- Body -->
	<div class="hero min-h-5/6 my-3 bg-base-200">
		<div class="hero-content flex-col lg:flex-row">
			<img
				src="${item.imageLink}"  alt="${item.name}"
				class="max-w-sm rounded-lg shadow-2xl mr-3" />
			<div>
				<h1 class="text-5xl font-bold"><c:out value="${item.name}"></c:out></h1>
				<c:choose>
					<c:when test="${item.discount > 0}">
						<p class="text-error line-through my-3">Original Price: $<c:out value="${item.price}"/></p>
					    <p class="text-success">Discounted Price: $<c:out value="${item.getDiscountedPrice()}"/></p>
					</c:when>
					<c:otherwise>
						<p class=" mt-3">Price: $<c:out value="${item.price}"/></p>
					</c:otherwise>
				</c:choose>
				<p class="py-6">Console: <c:out value="${item.category.name}"></c:out></p>
				<c:choose>
					<c:when test="${item.inventory == 0}">
						<p class="text-error">Items in Stock: <c:out value="${item.inventory}"></c:out></p>
					</c:when>
					<c:otherwise>
						<p class="text-secondary">Items in Stock: <c:out value="${item.inventory}"></c:out></p>
					</c:otherwise>
				</c:choose>
				<p class="py-6">Description: <c:out value="${item.description}"></c:out></p>
				<div class="mt-3 card-actions justify-center">
					<c:if test="${item.inventory != 0}">
						<a href="/item/add/${item.id}" class="btn btn-success">Add to Cart</a>     						
					</c:if>
					<c:if test="${item.inventory == 0}">
						   <a href="" class="btn btn-success btn-disabled">Stock Coming Soon!</a> 
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="rounded-lg shadow m-4 dark:bg-gray-800">
		<div
			class="w-full mx-auto max-w-screen-xl p-4 md:flex md:items-center md:justify-between">
			<span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">©2024 
				<a href="/" class="hover:underline">Game Nexus Market™</a>
				. AllRights Reserved.
			</span>
			<ul
				class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
				<c:if test="${userId == null}">
					<li><a href="/loginandregister" class="hover:underline me-4 md:me-6">Admin Login / Registration</a></li>
					<li><a href="/" class="hover:underline me-4 md:me-6">Privacy Policy</a></li>
				<li><a href="/" class="hover:underline me-4 md:me-6">Licensing</a></li>
				<li><a href="/" class="hover:underline">Contact</a></li>
				</c:if>
				<c:if test="${userId != null}">
					<!-- Dashboard -->
					<li><a href="/" class="hover:underline me-4 md:me-6" aria-current="page">Dashboard</a></li>	
						
					<!-- Admin Home -->
					<li><a href="/admin" class="hover:underline me-4 md:me-6" aria-current="page">Admin Home</a></li>	
						
					<!-- Add Category -->	
					<li><a href="/admin/add/category" class="hover:underline me-4 md:me-6">Add Category</a></li>
						
					<!-- Add Item -->
					<li><a href="/admin/add/item" class="hover:underline me-4 md:me-6">Add Item</a></li>
						
					<!-- Items Out of Stock -->
					<li><a href="/admin/items/outOfStock" class="hover:underline me-4 md:me-6">Items Out of Stock</a></li>
						
					<!-- Items on Sale -->
					<li><a href="/clearsession" class="hover:underline me-4 md:me-6">Logout</a></li>
				</c:if> 
			</ul>
		</div>
	</footer>


</body>
</html>