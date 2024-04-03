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
					class="self-center text-5xl font-semibold dark:text-white">Admin View</span>
				</a>

			</div>
		</nav>
		<nav class="bg-gray-50 dark:bg-gray-700">
			<div class="max-w-screen-xl px-4 py-3 mx-auto">
				<div class="flex items-center ">
					<ul
						class="flex flex-row flex-wrap font-medium mt-0 space-x-8 rtl:space-x-reverse text-sm items-center">
						<li><a href="/admin" class="block py-2 px-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500">Admin Page</a></li>
						<li><a href="/admin/add/category"
							class="hover:underline me-4 md:me-6">Add Category</a></li>
						<li><a href="/admin/add/item"
							class="hover:underline me-4 md:me-6">Add Item</a></li>
							<li><a href="/"
							class="hover:underline me-4 md:me-6">Dashboard</a></li>
						<li><a href="/clearsession"
							class="hover:underline me-4 md:me-6">Logout</a></li>
					</ul>

				</div>
			</div>
		</nav>
	</div>

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

			<div class="card w-96 my-3 bg-secondary text-secondary-content shadow-xl">
				<figure>
					<img src="${item.imageLink}" alt="${item.name}"
					class="h-full max-h-48 m-2" />
				</figure>
				<div class="card-body items-center text-center">
					<a href="/item/${item.id}" class="card-title"><c:out value="${item.name}"></c:out></a>
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
							<p class="secondary-content">Items in Stock: <c:out value="${item.inventory}"></c:out></p>
						</c:when>
						<c:otherwise>
							<p class="secondary-content">Items in Stock: <c:out value="${item.inventory}"></c:out></p>
						</c:otherwise>
					</c:choose>
					<div class="mt-3 card-actions justify-center">
						<a href="/admin/edit/item/${item.id}" class="btn btn-outline btn-warning">Edit</a> 
						<form action="/admin/delete/item/${category.id}" method="post">
							<input type="hidden" name="_method" value="DELETE">
							<button type="submit" class="btn btn-outline btn-success">Delete</button>
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
			<span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">©
				2024 <a href="/" class="hover:underline">Game Nexus Market™</a>. All
				Rights Reserved.
			</span>
			<ul
				class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
				<li><a href="/admin" class="hover:underline me-4 md:me-6">Admin
						Page</a></li>
				<li><a href="/admin/add/category"
					class="hover:underline me-4 md:me-6">Add Category</a></li>
				<li><a href="/admin/add/item"
					class="hover:underline me-4 md:me-6">Add Item</a></li>
				<li><a href="/clearsession"
					class="hover:underline me-4 md:me-6">Logout</a></li>
			</ul>
		</div>
	</footer>


</body>
</html>