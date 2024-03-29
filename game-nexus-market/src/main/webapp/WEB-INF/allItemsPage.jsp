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
<title>All Items</title>
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
</head>
<body>
	<!-- Header -->
	<div>
		<nav class="border-gray-200 dark:bg-gray-900">
			<div
				class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl p-4">
				<a href="/" class="flex items-center space-x-3 rtl:space-x-reverse">
					<img src="/images/GameController.png" class="h-8"
					alt="Game Controller Logo" /> <span
					class="self-center text-5xl font-semibold dark:text-white">Game Nexus Market</span>
				</a>
				<div class="flex items-center space-x-6 rtl:space-x-reverse">
					<a href="/loginandregister"
						class="text-sm  text-blue-600 dark:text-blue-500 hover:underline">Login
						or Register</a>
				</div>

				<a href="/shoppingCart"> <img src="/images/ShoppingCart2.png"
					alt="Shopping Cart" class="h-8" />
				</a>

			</div>
		</nav>
		
		<nav class="bg-gray-50 dark:bg-gray-700">
			<div class="max-w-screen-xl px-4 py-3 mx-auto">
				<div class="flex items-center ">
					<ul
						class="flex flex-row flex-wrap font-medium mt-0 space-x-8 rtl:space-x-reverse text-sm items-center">
						<li><a href="/"
							class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700"
							aria-current="page">Dashboard</a></li>
						<!-- Category Dropdown Menu -->
						<li>
							<button id="dropdownNavbarLink"
								data-dropdown-toggle="dropdownNavbar"
								class="flex items-center justify-between  w-full py-2 px-3 text-gray-900 hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 md:w-auto dark:text-white md:dark:hover:text-blue-500 dark:focus:text-white dark:hover:bg-gray-700 md:dark:hover:bg-transparent">
								Categories
								<svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 10 6">
    <path stroke="currentColor" stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4" />
  </svg>
							</button> <!-- Dropdown Options -->
							<div id="dropdownNavbar"
								class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
								<ul class="py-2 text-sm text-gray-700 dark:text-gray-200"
									aria-labelledby="dropdownLargeButton">
									<li><a href="/categoryPage"
										class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Category
											1</a></li>
									<li><a href="/categoryPage"
										class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Category
											2</a></li>
								</ul>
							</div>
						</li>
						<li><a href="/allItems"
							class="block py-2 px-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500 ">All
								Items</a></li>
						<li><a href="/itemsAvailable"
							class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Items
								Available</a></li>
						<li><a href="/itemsNotAvaiable"
							class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Items
								Not Available</a></li>
						<li><a href="/itemsOnSale"
							class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Items
								on Sale</a></li>
						<li><button type="button"
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

<!-- Items -->
	<h1 class="text-center text-5xl font-semibold dark:text-white my-5">All Items</h1>

	<div class="container my-5 mx-auto px-5 flex justify-around flex-wrap">


		<c:forEach var="item" items="${items}">

			<div class="card w-96 glass shadow-xl">
				<figure>
					<img src="${item.imageLink}" alt="${item.name}"
					class="h-full max-h-48 m-2" />
				</figure>
				<div class="card-body items-center text-center">
					<a href="" class="card-title"><c:out value="${item.name}"></c:out></a>
					<p>Price: $<c:out value="${item.price}"></c:out></p>
					<p>Console: <c:out value="${item.category.name}"></c:out></p>
					<p>Items in Stock: <c:out value="${item.inventory}"></c:out></p>
					<p>Description: <c:out value="${item.description}"></c:out></p>
					<div class="mt-3 card-actions justify-center">
						<a href="" class="btn btn-success">Add to Cart</a> 
					</div>
				</div>
			</div>
			
		</c:forEach>

	</div>
	

	<!-- Footer -->
	<footer class="rounded-lg shadow m-4 dark:bg-gray-800">
		<div
			class="w-full mx-auto max-w-screen-xl p-4 md:flex md:items-center md:justify-between">
			<span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">©
				2024 <a href="/" class="hover:underline">Game Nexus Market™</a>. All
				Rights Reserved.
			</span>
			<ul
				class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
				<li><a href="/admin" class="hover:underline me-4 md:me-6">Admin
						Page</a></li>
				<li><a href="/test" class="hover:underline me-4 md:me-6">Test
						Page</a></li>
				<li><a href="/clearsession" class="hover:underline me-4 md:me-6">Clear Session</a>
				</li>
				<li><a href="/" class="hover:underline me-4 md:me-6">Privacy
						Policy</a></li>
				<li><a href="/" class="hover:underline me-4 md:me-6">Licensing</a>
				</li>
				<li><a href="/" class="hover:underline">Contact</a></li>
			</ul>
		</div>
	</footer>

</body>
</html>