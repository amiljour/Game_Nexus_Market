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
<title>Checkout</title>
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
		
	</div>

	<!-- Mobile Navigation Bar -->
	<div class="md:hidden flex justify-between items-center sticky top-0 z-50 bg-base-100">
	    
	    <!-- Page Currently On -->
	    <h2 id="mobile-menu-trigger" class="cursor-pointer text-xl font-semibold my-3 ml-24">Checkout</h2>
	    
	    <div class="flex g-2 items-center mr-24">
			<p class="mx-2">${cartSize}</p>
			<a href="/shoppingCart"> <img src="/images/ShoppingCart2.png" alt="Shopping Cart" class="h-8" /></a>
		</div>
	</div>

	<!-- Body -->
	<div>
		<div class="flex justify-center items-center flex-col w-full mt-5">
			<h2 class="text-center sm:text-2xl text-xl font-semibold my-3">Shipping and Billing Info</h2>
			<form class="relative overflow-x-auto mx-1 w-10/12 mb-5">
		
				<!-- 2 lines on the form -->
		   		<div class="grid md:grid-cols-2 md:gap-6 mt-5">
		   
				   	<!-- First Name -->
				    <div class="relative z-0 w-full mb-5 group">
				        <input type="text" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="floating_first_name" id="floating_first_name" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
				        <label for="floating_first_name" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">First Name</label>
				    </div>
				   
				   	<!-- Last Name -->
				    <div class="relative z-0 w-full mb-5 group">
				        <input type="text" name="floating_last_name" id="floating_last_name" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
				        <label for="floating_last_name" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Last Name</label>
				    </div>
			  	</div>
			  	
			  	<!-- Email -->
			  	<div class="relative z-0 w-full mb-5 group">
			      	<input type="text" name="floating_email" id="floating_email" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
			      	<label for="floating_email" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Email</label>
			  	</div>
			  	
			  	<!-- Address -->
			  	<div class="relative z-0 w-full mb-5 group">
			      	<input type="text" name="floating_address" id="floating_address" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
			      	<label for="floating_address" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Address</label>
			  	</div>
			  
			  	<!-- 2 lines on the form -->
			   	<div class="grid md:grid-cols-2 md:gap-6">
			   
				   	<!-- City -->
				   	<div class="relative z-0 w-full mb-5 group">
				       <input type="text" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="floating_city" id="floating_city" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
				       <label for="floating_city" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">City</label>
				   	</div>
				   
				   	<!-- State -->
				   	<div class="relative z-0 w-full mb-5 group">
				       	<input type="text" name="floating_state" id="floating_state" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
				       	<label for="floating_state" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">State</label>
					</div>
				</div>
				
				<!-- 2 lines on the form -->
			   	<div class="grid md:grid-cols-2 md:gap-6">
			   
				   	<!-- Zip Code -->
				   	<div class="relative z-0 w-full mb-5 group">
				       <input type="number" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="floating_zip_code" id="floating_zip_code" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
				       <label for="floating_zip_code" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Zip Code</label>
				   	</div>
				   
				   	<!-- Phone Number -->
				   	<div class="relative z-0 w-full mb-5 group">
				       	<input type="tel" name="floating_phone_number" id="floating_phone_number" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
				       	<label for="floating_phone_number" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Phone Number</label>
					</div>
				</div>
				
				<!-- 2 lines on the form -->
			   	<div class="grid md:grid-cols-2 md:gap-6">
			   	
			   		<!-- Name on Card -->
				   	<div class="relative z-0 w-full mb-5 group">
				       	<input type="text" name="floating_card_full_name" id="floating_card_full_name" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
				       	<label for="floating_card_full_name" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Name on Card</label>
					</div>
			   
				   	<!-- Card Number -->
				   	<div class="relative z-0 w-full mb-5 group">
				       <input type="text" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="floating_card_number" id="floating_card_number" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
				       <label for="floating_card_number" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Card Number</label>
				   	</div>
				   
				</div>
				
				<!-- 2 lines on the form -->
			   	<div class="grid md:grid-cols-2 md:gap-6">
			   	
			   		<!-- Expiration Date -->
				   	<div class="relative z-0 w-full mb-5 group">
				       	<input type="text" name="floating_exp_date" id="floating_exp_date" pattern="\d{2}/\d{4}" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder="  " required />
				       	<label for="floating_exp_date" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Expiration Date (MM/YYYY)</label>
					</div>
			   
				   	<!-- CCV Numberr -->
				   	<div class="relative z-0 w-full mb-5 group">
				       <input type="number" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="floating_ccv_number" id="floating_ccv_number" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder="  " required />
				       <label for="floating_ccv_number" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">CCV Number</label>
				   	</div>
				   	
				</div>
				
				<div class="mt-4 mx-1 flex flex-col">
				    <label class="my-2 ">
				        <input type="radio" name="addressType" value="shipping" checked onclick="toggleAddress(false)">
				        Use Shipping Address
				    </label>
				    <label class="my-2">
				        <input type="radio" name="addressType" value="different" onclick="toggleAddress(true)">
				        Use a Different Billing Address
				    </label>
				</div>
				
				<!-- Script for New Address -->
				<script>
				function toggleAddress(show) {
				    document.getElementById('billingAddressForm').style.display = show ? 'block' : 'none';
				}
				</script>
				
				<div id="billingAddressForm" style="display: none;">
				    <!-- Billing Address Form Fields -->
				    <div class="grid md:grid-cols-4 md:gap-6 mt-5">
				    
						<!-- Address -->
					  	<div class="relative z-0 w-full mb-5 group">
					      	<input type="text" name="floating_billing_address" id="floating_billing_address" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
					      	<label for="floating_billing_address" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Billing Address</label>
					  	</div>
				   
					   	<!-- City -->
					   	<div class="relative z-0 w-full mb-5 group">
					       <input type="text" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="floating_billing_city" id="floating_city" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
					       <label for="floating_billing_city" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Billing City</label>
					   	</div>
					   
					   	<!-- State -->
					   	<div class="relative z-0 w-full mb-5 group">
					       	<input type="text" name="floating_billing_state" id="floating_billing_state" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
					       	<label for="floating_billing_state" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Billing State</label>
						</div>
						
						<!-- Zip Code -->
					   	<div class="relative z-0 w-full mb-5 group">
					       <input type="number" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="floating_billing_zip_code" id="floating_billing_zip_code" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
					       <label for="floating_billing_zip_code" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Billing Zip Code</label>
					   	</div>
					
					</div>
					
				</div>
		 
		  		<c:if test="${not empty cartItems}">
					<div class="flex justify-center items-center w-full">
						<div class="relative overflow-x-auto w-full">
							<h3 class="text-center sm:text-2xl text-xl font-semibold my-3">Items in Cart</h3>
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
					                		<tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 text-lg">
							                    <td scope="row" class="hidden sm:table-cell px-6 py-3 font-medium text-gray-900 whitespace-normal dark:text-white text-center break-words">
							                    	<img alt="${cartItem.item.name}" src="${cartItem.item.imageLink}" class="mx-auto max-h-40">
							                    </td>
							                    <td scope="row" class="px-6 py-3 font-medium text-gray-900 whitespace-normal dark:text-white break-words">
							                        <c:out value="${cartItem.item.name}"/>
							                    </td>
							                    <td class="hidden sm:table-cell px-6 py-3 break-words">
							                        <c:out value="${cartItem.item.category.name}"/>
							                    </td>
					                    		<td class="px-6 py-3 break-words">
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
				    		<div class="text-center my-3 flex flex-col justify-center items-center bg-base">
				    			<p class="my-3 mr-5 text-xl text-secondary">Total Price: $${total}</p>
				    			<!-- <button type="submit" class="my-3 mr-5 btn btn-md lg:btn-lg btn-outline btn-primary">Buy Now!</button> -->
				    			<a href="/purchase" class="my-3 mr-5 btn btn-md lg:btn-lg btn-outline btn-primary">Buy Now!</a>
				    		</div>
						</div>
					</div>
				</c:if>
			</form>
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
					<li><a href="/admin" class="hover:underline me-4 md:me-6">Admin Page</a></li>
					<li><a href="/test" class="hover:underline me-4 md:me-6">Test Page</a></li>
					<li><a href="/clearsession" class="hover:underline me-4 md:me-6">Logout Admin</a></li>
				</c:if> 
			</ul>
		</div>
	</footer>

</body>
</html>