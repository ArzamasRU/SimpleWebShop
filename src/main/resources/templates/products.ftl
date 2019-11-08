<#import "elements/environment.ftl" as macros> 
<#import "elements/notice.ftl" as macrosN>

<@macros.environment> 
<div class="form-row mt-5" >
	<div class="form-group col-md-6">
		<form
			method="get"
			action="/products"
			class="form-inline">
			<input
				type="text"
				name="filter"
				class="form-control"
				value="${filterByType?ifExists}"
				placeholder="Search by type">
			<input
			type="hidden"
			name="typeOfSort"
			value="type" />
			<button
				type="submit"
				class="btn btn-primary ml-2">Search</button>
		</form>
	</div>
	
	<div class="form-group col-md-6">
		<form
			method="get"
			action="/products"
			class="form-inline">
			<input
				type="text"
				name="filter"
				class="form-control"
				value="${filterByName?ifExists}"
				placeholder="Search by name"> 
			<input
			type="hidden"
			name="typeOfSort"
			value="name" />
			<button
				type="submit"
				class="btn btn-primary ml-2">Search</button>
		</form>
	</div>
</div>

<div class="card-columns">
	<#list products as product>
		<form
			action="/products"
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
				class="card mb-3"
				style="max-width: 540px;">
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
							type="submit">Add to basket</button>
					</div>
				</div>
			</div>
		</form>
	<#else> 
		<@macrosN.notice str="No products"/> 
	</#list>
</div> 
</@macros.environment> 