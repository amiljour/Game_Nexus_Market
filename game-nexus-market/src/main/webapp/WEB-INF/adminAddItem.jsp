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
<title>Add an Item</title>
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
					class="self-center text-5xl font-semibold dark:text-white">Admin
						View</span>
				</a>

			</div>
		</nav>
		<nav class="bg-gray-50 dark:bg-gray-700">
			<div class="max-w-screen-xl px-4 py-3 mx-auto">
				<div class="flex items-center ">
					<ul
						class="flex flex-row flex-wrap font-medium mt-0 space-x-8 rtl:space-x-reverse text-sm items-center">
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
			</div>
		</nav>
	</div>

	<!-- Add an Item Form -->
	<div class="flex flex-col w-3/5 lg:w-600px mx-auto my-5">
		<h2 class="text-center mb-5 text-3xl font-semibold dark:text-white">Add an Item</h2>
		<form:form action="/admin/add/item" method="POST"
			modelAttribute="newItem">

			<div class="mb-4">
				<form:label path="name" class="block text-sm font-medium mb-2">Item Name</form:label>
				<form:input type="text" path="name"
					class="input input-bordered rounded-md block w-full bg-transparent"
					placeholder="Category Name..." />
				<form:errors path="name" class="text-error text-center" />
			</div>

			<div class="mb-4">
				<form:label path="category" class="block text-sm font-medium mb-2">Category</form:label>
				<form:select path="category" class="select select-bordered w-full ">
					<c:forEach var="category" items="${categories}">
						<option value="${category.id}">${category.name}</option>
					</c:forEach>
				</form:select>
			</div>

			<div class="mb-4">
				<form:label path="imageLink" class="block text-sm font-medium mb-2">Image Link</form:label>
				<form:input type="text" path="imageLink"
					class="input input-bordered rounded-md block w-full bg-transparent"
					placeholder="Image Link..." />
				<form:errors path="imageLink" class="text-error text-center" />
			</div>

			<div class="mb-4">
				<form:label path="price" class="block text-sm font-medium mb-2">Price</form:label>
				<form:input type="number" path="price"
					class="input input-bordered rounded-md block w-full bg-transparent"
					placeholder="Price..." step="0.01" />
				<form:errors path="price" class="text-error text-center" />
			</div>

			<div class="mb-4">
				<form:label path="inventory" class="block text-sm font-medium mb-2">Inventory</form:label>
				<form:input type="number" path="inventory"
					class="input input-bordered rounded-md block w-full bg-transparent"
					placeholder="Inventory..." />
				<form:errors path="inventory" class="text-error text-center" />
			</div>

			<div class="mb-4">
				<form:label path="description"
					class="block text-sm font-medium mb-2">Description</form:label>
				<form:textarea path="description"
					class="textarea textarea-bordered rounded-md block w-full bg-transparent"
					placeholder="Description..." />
				<form:errors path="description" class="text-error text-center" />
			</div>

			<button type="submit" class="btn btn-outline btn-primary">Add</button>

		</form:form>
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