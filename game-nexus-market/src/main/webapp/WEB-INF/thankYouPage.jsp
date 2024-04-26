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
<title>Thank You!</title>
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
				<a href="/clearsession" class="flex items-center space-x-3 rtl:space-x-reverse">
					<img src="/images/GameController.png" class="h-8"
					alt="Game Controller Logo" /> <span
					class="text-center sm:text-5xl text-xl font-semibold dark:text-white">Game Nexus Market</span>
				</a>

			</div>
		</nav>
	</div>

	<!-- Body -->
	<div>
	
		<h1 class="text-center mt-5 sm:text-4xl text-2xl font-semibold dark:text-white mt-3">Thank your for your purchase at Game Nexus Market!</h1>
		<p class="text-center mt-5 sm:text-2xl text-xl font-semibold dark:text-white mt-3" >Your order will be on the way shortly! Here are the items that you purchased today!</p>
		
		<c:if test="${not empty cartItems}">
			<div class="flex justify-center items-center w-full my-10">
				<div class="relative overflow-x-auto mx-1 w-max">
				    <table class="w-full text-sm sm:text-base text-center rtl:text-right text-gray-500 dark:text-gray-400">
					    <thead class="text-sm md:text-lg text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
					        
					    </thead>
					    <tbody>
					        <c:forEach items="${cartItems}" var="cartItem">
					            <c:if test="${cartItem != null && cartItem.item != null}">
					                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
					                    <th scope="row" class="hidden sm:table-cell px-6 py-4 font-medium text-gray-900 whitespace-normal dark:text-white text-center break-words">
					                    	<img alt="${cartItem.item.name}" src="${cartItem.item.imageLink}" class="mx-auto max-h-40">
					                    </th>
					                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-normal dark:text-white break-words">
					                        <c:out value="${cartItem.item.name}"/>
					                    </th>
					                    <td class="hidden sm:table-cell px-6 py-3 break-words">
					                        <c:out value="${cartItem.item.category.name}"/>
					                    </td>
					                    <td class="hidden sm:table-cell px-6 py-3 break-words">
					                        <c:out value="${cartItem.quantity}"/>
					                    </td>
					                    <td class="px-4 py-2 break-words">
					                        $<c:out value="${cartItem.getTotalPrice()}"/>
					                    </td>
					                </tr>
					            </c:if>
					        </c:forEach>
					    </tbody>
					</table>
				    <div class="text-center my-3">
				    	<p class="my-3 mr-5 mt-5 sm:text-2xl text-xl ">Total Price: $${total}</p>
				    </div>
				    <div class="text-center mt-36 text-secondary">
				    <a href="/clearsession">~Return to Dashboard~</a>
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