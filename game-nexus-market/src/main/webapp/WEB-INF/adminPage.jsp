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
<title>Admin Page</title>
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
		    <div class="lg:flex hidden justify-center items-center mx-auto max-w-screen-xl p-4">
		        <a href="/admin" class="flex items-center space-x-3 rtl:space-x-reverse">
		            <img src="/images/GameController.png" class="h-8" alt="Game Controller Logo" />
		            <span class="text-center text-5xl font-semibold dark:text-white">Game Nexus Market</span>
		        </a>
		    </div>
		    
		    <!-- Mobile Menu View -->
		    <div class="flex lg:hidden justify-center items-center mx-auto max-w-screen-xl p-4">
		        <a href="/admin" class="flex items-center space-x-3 rtl:space-x-reverse">
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
						<li><a href="/" class="block py-2 text-white rounded hover:text-accent" aria-current="page">Dashboard</a></li>	
						
						<!-- Admin Home -->
						<li><a href="/admin" class="block py-2 text-info rounded hover:text-accent" aria-current="page">Admin Home</a></li>	
						
						<!-- Add Category -->	
						<li><a href="/admin/add/category" class="block py-2 text-white rounded hover:text-accent">Add Category</a></li>
						
						<!-- Add Item -->
						<li><a href="/admin/add/item" class="block py-2 text-white rounded hover:text-accent">Add Item</a></li>
						
						<!-- Items Out of Stock -->
						<li><a href="/admin/items/outOfStock" class="block py-2 text-white rounded hover:text-accent">Items Out of Stock</a></li>
						
						<!-- Items on Sale -->
						<li><a href="/clearsession" class="block py-2 text-white rounded hover:text-accent">Logout</a></li>

					</ul>

				</div>
			</div>
		</nav>
	</div>

	<!-- Mobile Navigation Bar -->
	<div class="md:hidden flex justify-center items-center sticky top-0 z-50 bg-base-100">
	    <button id="mobile-menu-button" class="self-start ml-3 text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5">
	        <svg class="w-7 h-7" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
	            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
	        </svg>
	        <span class="sr-only">Open main menu</span>
	    </button>
	    
	    <!-- Page Currently On -->
	    <h2 id="mobile-menu-trigger" class="cursor-pointer text-xl font-semibold">Admin Home</h2>
	</div>


	<!-- Mobile Menu Drop-Down -->
	<div class="md:hidden hidden sticky top-10 z-50" id="mobile-menu">
	    <ul class="flex flex-col text-center text-xl text-white p-4 mt-4 bg-gray-50 dark:bg-gray-700 rounded-lg border border-gray-100 dark:border-gray-600">
	    
	    	<!-- Dashboard -->
	        <li><a href="/" class="block py-2 px-3 rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Dashboard</a></li>
						
			<!-- Admin Home -->
			<li><a href="/admin" class="block py-2 px-3 text-info rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-whitet">Admin Home</a></li>	
						
			<!-- Add Category -->	
			<li><a href="/admin/add/category" class="block py-2 px-3 rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Add Category</a></li>
						
			<!-- Add Item -->
			<li><a href="/admin/add/item" class="block py-2 px-3 rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Add Item</a></li>
						
			<!-- Items Out of Stock -->
			<li><a href="/admin/items/outOfStock" class="block py-2 px-3 rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Items Out of Stock</a></li>
						
			<!-- Items on Sale -->
			<li><a href="/clearsession" class="block py-2 px-3 rounded hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Logout</a></li>
    	</ul>
	</div>
	
	<!-- Body -->

	<h1 class="text-center text-5xl font-bold dark:text-white my-5">Categories</h1>

	<div class="container my-5 mx-auto px-5 flex justify-around flex-wrap">

		<c:forEach var="category" items="${categories}">

			<div class="card w-96 h-40 my-3 bg-primary text-primary-content">
				<div class="card-body">
					<h2 class="text-center text-2xl font-semibold">
						<c:out value="${category.name}"></c:out>
					</h2>
					<div class="card-actions justify-center">
						<a href="/admin/edit/category/${category.id}"
							class="btn btn-outline btn-warning">Edit</a>
						<form action="/admin/delete/category/${category.id}" method="post">
							<input type="hidden" name="_method" value="DELETE">
							<button type="submit" class="btn btn-outline btn-success">Delete</button>
						</form>
					</div>
				</div>
			</div>

		</c:forEach>

	</div>



	<!-- Items -->
	<h1 class="text-center text-5xl font-semibold dark:text-white my-5">Items</h1>

	<div class="container my-5 mx-auto px-5 flex justify-around flex-wrap">

		<c:forEach var="item" items="${items}">

			<div class="card w-96 my-3 bg-neutral neutral-content shadow-xl">
				<figure>
					<a href="/admin/edit/item/${item.id}"><img src="${item.imageLink}" alt="${item.name}" class="h-full max-h-48 m-2" /></a>
				</figure>
				<div class="card-body items-center text-center">
					<a href="/admin/edit/item/${item.id}" class="card-title"><c:out value="${item.name}"></c:out></a>
					<c:choose>
					    <c:when test="${item.discount > 0}">
					    	<p class="secondary-content">Original Price: $<c:out value="${item.price}"/></p>
					      	<p class="secondary-content">Discounted Price: $<c:out value="${item.getDiscountedPrice()}"/></p>
					    </c:when>
					    <c:otherwise>
					    	<p>Price: $<c:out value="${item.price}"/></p>
						</c:otherwise>
					</c:choose>
					<p>Console: <c:out value="${item.category.name}"></c:out></p>
					<c:choose>
						<c:when test="${item.inventory == 0}">
							<p class="text-error">Items in Stock: <c:out value="${item.inventory}"></c:out></p>
						</c:when>
						<c:otherwise>
							<p class="text-success">Items in Stock: <c:out value="${item.inventory}"></c:out></p>
						</c:otherwise>
					</c:choose>
					<div class="mt-3 card-actions justify-center">
						<a href="/admin/edit/item/${item.id}" class="btn btn-outline btn-warning">Edit</a> 
						<form action="/admin/delete/item/${category.id}" method="post">
							<input type="hidden" name="_method" value="DELETE">
							<button type="submit" class="btn btn-outline btn-primary">Delete</button>
						</form>
					</div>

				</div>
			</div>
			
		</c:forEach>

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