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
<title>Add a Category</title>
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