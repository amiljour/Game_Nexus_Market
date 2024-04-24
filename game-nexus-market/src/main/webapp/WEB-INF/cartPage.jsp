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

				<div class="flex g-2 items-center">
					<p class="mx-2">${cartSize}</p>
					<a href="/shoppingCart"> <img src="/images/ShoppingCart2.png"
					alt="Shopping Cart" class="h-8" /></a>
				</div>

			</div>
		</nav>
		<nav class="bg-gray-50 dark:bg-gray-700">
			<div class="max-w-screen-xl px-4 py-3 mx-auto">
				<div class="flex items-center ">
					<ul
						class="flex flex-row flex-wrap font-medium mt-0 space-x-8 rtl:space-x-reverse text-sm items-center">
						<li><a href="/"
							class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700"
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
							</button> 
							
							<!-- Dropdown Options -->
							<div id="dropdownNavbar"
								class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
								<ul class="py-2 text-sm text-gray-700 dark:text-gray-200"
									aria-labelledby="dropdownLargeButton">
									<c:forEach var="category" items="${categories}">
 										<li><a href="/category/${category.id}"
										class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"><c:out value="${category.name}"></c:out></a></li>
        							</c:forEach>
								</ul>
							</div>
							
						<li><a href="/allItems"
							class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">All
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

	<!-- Body -->
	<div>
		<c:if test="${not empty cartItems}">
			<h1 class="text-center mb-5 mt-10 text-4xl font-semibold dark:text-white my-3">Shopping Cart</h1>
		</c:if>
		<c:if test="${!not empty cartItems}">
			<h1 class="text-center mb-5 mt-10 text-4xl font-semibold dark:text-white my-3">Your shopping cart is empty...</h1>
		</c:if>
		
		<div class="m-10 text-center">
		<c:if test="${not empty successMessage}">
    		<div class="alert alert-success">
        		<c:out value="${successMessage}"/>
   			</div>
		</c:if>
		<c:if test="${not empty errorMessage}">
    		<div class="alert alert-danger">
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
				<div class="relative overflow-x-auto mx-1 w-max">
				    <table class="w-full text-sm sm:text-base text-center rtl:text-right text-gray-500 dark:text-gray-400">
					    <thead class="text-sm md:text-lg text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
					        <tr>
					            <th scope="col" class="hidden sm:table-cell px-6 py-3"></th>
					            <th scope="col" class="sm:text-sm md:text-lg px-6 py-3 break-words">Product name</th>
					            <th scope="col" class="hidden sm:table-cell px-6 py-3 break-words">Quantity</th>
					            <th scope="col" class="px-6 py-3 break-words">Actions</th>
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
					                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-normal dark:text-white break-words">
					                        <a href="/item/${cartItem.item.id}"><c:out value="${cartItem.item.name}"/></a>
					                    </th>
					                    <td class="hidden sm:table-cell px-6 py-3 break-words">
					                        <c:out value="${cartItem.quantity}"/>
					                    </td>
					                    <td class="px-4 py-2 break-words">
					                        <a href="/item/add/${cartItem.item.id}" class="text-success">Add</a> ||
					                        <a href="/cart/remove/${cartItem.item.id}" class="text-error">Remove</a>
					                    </td>
					                    <td class="px-4 py-2 break-words">
					                        $<c:out value="${cartItem.getTotalPrice()}"/>
					                    </td>
					                </tr>
					            </c:if>
					        </c:forEach>
					    </tbody>
					</table>
				    <div class="text-right my-3">
				    	<p class="my-3 mr-5">Total Price: $${total}</p>
				    	<p class="my-3 mr-5"><a href="/" class="btn btn-primary">Checkout</a></p>
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
					<li><a href="/" class="hover:underline me-4 md:me-6">Terms & Conditions</a></li>
					<li><a href="/" class="hover:underline me-4 md:me-6">Cookie Policy</a></li>
					<li><a href="/" class="hover:underline me-4 md:me-6">Contact</a></li>
				</c:if>
				<c:if test="${userId != null}">
					<li><a href="/admin" class="hover:underline me-4 md:me-6">Admin Page</a></li>
					<li><a href="/test" class="hover:underline me-4 md:me-6">Test Page</a></li>
					<li><a href="/clearsession" class="hover:underline me-4 md:me-6">Logout Admin</a></li>
				</c:if> 
			</ul>
		</div>
	</footer>


</body>
</html>