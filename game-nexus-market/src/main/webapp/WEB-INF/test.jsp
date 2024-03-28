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
<title>Test</title>
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
		<nav class="bg-white border-gray-200 dark:bg-gray-900">
			<div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl p-4">
				<a href="/" class="flex items-center space-x-3 rtl:space-x-reverse">
					<img src="/images/GameController.png" class="h-8"
					alt="Flowbite Logo" /> <span
					class="self-center text-5xl font-semibold whitespace-nowrap dark:text-white">Game
						Nexus Market</span>
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
				<div class="flex items-center">
					<ul
						class="flex flex-row font-medium mt-0 space-x-8 rtl:space-x-reverse text-sm items-center">
						<li><a href="/"
							class="block py-2 px-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500"
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
							<button data-collapse-toggle="navbar-search" type="button"
								class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
								aria-controls="navbar-search" aria-expanded="false">
								<span class="sr-only">Open main menu</span>
								<svg class="w-5 h-5" aria-hidden="true"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 17 14">
            <path stroke="currentColor" stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M1 1h15M1 7h15M1 13h15" />
        </svg>
							</button></li>
					</ul>

				</div>
			</div>
		</nav>
	</div>

	<div class="hero  my-5 bg-base-200">
  <div class="hero-content text-center">
    <div class="max-w-md">
      <h1 class="text-3xl font-bold">Embark on an Epic Quest for Gaming Glory!</h1>
      <p class="py-6">Dive into the ultimate collection of video games, state-of-the-art consoles, and must-have accessories designed to catapult your gaming experience into new dimensions. Whether you're a seasoned warrior in the realms of virtual battles or a newcomer ready to press start on your first adventure, Game Nexus Market is your trusted ally, furnishing you with everything you need for the next level of play. Get ready to game like never before!</p>
    </div>
  </div>
</div>

<div class="container my-5 mx-auto px-5 flex justify-around ">

  <div class="card w-56 bg-base-100 shadow-xl">
  <figure><img src="https://daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.jpg" alt="Shoes" /></figure>
  <div class="card-body">
    <h2 class="card-title">Shoes!</h2>
    <p>If a dog chews shoes whose shoes does he choose?</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div class="card w-56 bg-base-100 shadow-xl">
  <figure><img src="https://daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.jpg" alt="Shoes" /></figure>
  <div class="card-body">
    <h2 class="card-title">Shoes!</h2>
    <p>If a dog chews shoes whose shoes does he choose?</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div class="card w-56 bg-base-100 shadow-xl">
  <figure><img src="https://daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.jpg" alt="Shoes" /></figure>
  <div class="card-body">
    <h2 class="card-title">Shoes!</h2>
    <p>If a dog chews shoes whose shoes does he choose?</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

</div>





	<footer class="bg-white rounded-lg shadow m-4 dark:bg-gray-800">
    <div class="w-full mx-auto max-w-screen-xl p-4 md:flex md:items-center md:justify-between">
      <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">© 2024 <a href="/" class="hover:underline">Game Nexus Market™</a>. All Rights Reserved.
    </span>
    <ul class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
        <li>
            <a href="/adminView" class="hover:underline me-4 md:me-6">Admin Page</a>
        </li>
        <li>
            <a href="/test" class="hover:underline me-4 md:me-6">Test Page</a>
        </li>
        <li>
            <a href="/" class="hover:underline me-4 md:me-6">About</a>
        </li>
        <li>
            <a href="/" class="hover:underline me-4 md:me-6">Privacy Policy</a>
        </li>
        <li>
            <a href="/" class="hover:underline me-4 md:me-6">Licensing</a>
        </li>
        <li>
            <a href="/" class="hover:underline">Contact</a>
        </li>
    </ul>
    </div>
</footer>
	

</body>
</html>