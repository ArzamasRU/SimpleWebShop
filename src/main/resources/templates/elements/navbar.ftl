<#include "securityVars.ftl"> 
<#import "signOut.ftl" as macrosOut> 
<#import "signIn.ftl" as macrosIn>
<#import "basket.ftl" as macrosB>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a
		class="navbar-brand"
		href="/">SimpleWebShop</a>
	<button
		class="navbar-toggler"
		type="button"
		data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent"
		aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div
		class="collapse navbar-collapse"
		id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a
				class="nav-link"
				href="/products">Products</a></li>
<!-- 			<li class="nav-item"><a -->
<!-- 				class="nav-link" -->
<!-- 				href="requests">Popular requests</a></li> -->
<!-- 			<li class="nav-item"><a -->
<!-- 				class="nav-link" -->
<!-- 				href="/test">test</a></li> -->
		</ul>

		<#if user??>
			<@macrosB.basket/>
			<div class="navbar-text mr-5">${name!}</div>
			<@macrosOut.signOut/>
		<#else>
			<div class="navbar-text mr-5">Please, sign in</div>
			<@macrosIn.signIn/>
		</#if>
	</div>
</nav>