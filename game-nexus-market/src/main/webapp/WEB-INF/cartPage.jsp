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
<title>Cart</title>
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
	    <h2 id="mobile-menu-trigger" class="cursor-pointer text-xl font-semibold">Cart</h2>
	    
	    <div class="flex g-2 items-center mr-3">
			<p class="mx-2">${cartSize}</p>
			<a href="/shoppingCart"> <img src="/images/ShoppingCart2.png" alt="Shopping Cart" class="h-8" /></a>
		</div>
	</div>


	<!-- Mobile Menu Drop-Down -->
	<div class="md:hidden hidden sticky top-0 z-50" id="mobile-menu">
	    <ul class="flex flex-col text-center text-xl text-white p-4 mt-4 bg-gray-50 dark:bg-gray-700 rounded-lg border border-gray-100 dark:border-gray-600">
	    
	    	<!-- Dashboard -->
	        <li><a href="/" class="block py-2 px-3 rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Dashboard</a></li>
	        
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
	<div>
		<c:if test="${not empty cartItems}">
			<h1 class="text-center mt-5 sm:text-4xl text-2xl font-semibold dark:text-white mt-3">Shopping Cart</h1>
		</c:if>
		<c:if test="${!not empty cartItems}">
			<div class="m-10 text-center">
				<c:if test="${not empty emptyMessage}">
		    		<div class="alert alert-warning">
		        		<c:out value="${emptyMessage}"/>
		   			</div>
				</c:if>
			</div>
			<h1 class="text-center sm:text-4xl text-2xl font-semibold dark:text-white mt-3">Your shopping cart is empty...</h1>
		</c:if>
		
		<div class="m-10 text-center">
			<c:if test="${not empty successMessage}">
	    		<div class="alert alert-success">
	        		<c:out value="${successMessage}"/>
	   			</div>
			</c:if>
			<c:if test="${not empty errorMessage}">
	    		<div class="alert alert-warning">
	        		<c:out value="${errorMessage}"/>
	    		</div>
			</c:if>
			<c:if test="${not empty removeMessage}">
	    		<div class="alert alert-error">
	        		<c:out value="${removeMessage}"/>
	    		</div>
			</c:if>
		</div>

		<c:if test="${not empty cartItems}">
			<div class="flex justify-center items-center w-full">
				<div class="relative overflow-x-auto mx-1 w-10/12">
				    <table class="w-full text-sm sm:text-base text-center rtl:text-right text-gray-500 dark:text-gray-400">
					    <thead class="text-sm md:text-lg text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
					        <tr>
					            <th scope="col" class="hidden sm:table-cell px-6 py-3"></th>
					            <th scope="col" class="sm:text-sm md:text-lg px-6 py-3 break-words">Product name</th>
					            <th scope="col" class="hidden sm:table-cell px-6 py-3 break-words">Category</th>
					            <th scope="col" class="px-6 py-3 break-words">Quantity</th>
					            <th scope="col" class="px-6 py-3 break-words">Price</th>
					        </tr>
					    </thead>
					    <tbody>
					        <c:forEach items="${cartItems}" var="cartItem">
					            <c:if test="${cartItem != null && cartItem.item != null}">
					                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
					                    <th scope="row" class="hidden sm:table-cell px-6 py-4 font-medium text-gray-900 whitespace-normal dark:text-white text-center break-words">
					                        <a href="/item/${cartItem.item.id}" class="inline-block">
					                            <img alt="${cartItem.item.name}" src="${cartItem.item.imageLink}" class="mx-auto max-h-40">
					                        </a>
					                    </th>
					                    <th scope="row" class="px-6 py-4 text-lg font-medium text-gray-900 whitespace-normal dark:text-white break-words">
					                        <a href="/item/${cartItem.item.id}"><c:out value="${cartItem.item.name}"/></a>
					                    </th>
					                    <td class="hidden sm:table-cell px-6 py-3 break-words text-lg">
					                        <c:out value="${cartItem.item.category.name}"/>
					                    </td>
					                    <th class="px-6 py-3 break-words text-lg">
					                       <a href="/item/add/${cartItem.item.id}" class="text-success text-lg">+ | </a><c:out value="${cartItem.quantity}"/> 
					                        <a href="/cart/remove/${cartItem.item.id}" class="text-error text-lg"> | -</a>
					                    </th>
					                    
					                    <td class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 text-lg">
					                        $<c:out value="${cartItem.getTotalPrice()}"/>
					                    </td>
					                </tr>
					            </c:if>
					        </c:forEach>
					    </tbody>
					</table>
				    <div class=" my-3 text-xl flex items-center justify-end flex-column">
				    	<p class="my-3 mr-5">Total Price: $${total}</p>
				    	<p class="my-3 mr-5"><a href="/checkout" class="btn btn-primary">Checkout</a></p>
				    </div>
				</div>
			</div>
		</c:if>
		
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