<#import "elements/environment.ftl" as macros> 
<#import "elements/notice.ftl" as macrosN>

<@macros.environment> 
<#list products as product>
<form
	action="/basket"
	method="post">
	<input
		type="hidden"
		name="_csrf"
		value="${_csrf.token}" />
	<input
		type="hidden"
		name="id"
		value="${product.id}" />
	<div
		class="card mb-1"
		style="max-width: 600px;">
		<div class="row no-gutters"> 
			<div class="col-md-4">
			<#if product.filename??>
	        	<img src="/images/${product.filename}" class="card-img-top">
	        <#else> 
				<img src="/images/default.jpg" class="card-img-top">		
	        </#if>
    </div>
			<div class="col-md-8">
				<div class="card-body">
					<h3 class="card-title">${product.type}</h3>
					<p class="card-text">${product.model}</p>
				</div>
				<button
					class="btn btn-primary"
					type="submit"
					name="sendProduct">Send product to client</button>
				<button
					class="btn btn-primary"
					type="submit"
					name="deleteProduct">Remove from basket</button>
			</div>
		</div>
	</div>
</form>
<#else>  
	<@macrosN.notice str="No products"/> 
</#list>
</@macros.environment> 