<#import "elements/environment.ftl" as macros> 
<#import "elements/notice.ftl" as macrosN> 

<@macros.environment> 
<div class="container">
	<div class="row">
		<div class="col">
			<form
				action="/requests"
				method="get">
				<#include "elements/requestsButtons.ftl">
			</form>
		</div>
		<div class="col-8">
			<div class="card-columns" style="column-count: 2;">
				<#if products??>
					<#list products as product, productName>
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
										<p class="card-text">${productName}</p>
									</div>
								</div>
							</div>
						</div>
					</#list>
				</#if>
			</div> 
			<#if data??>
				<table class="table">
					<#if labels?has_content>
						<thead class="thead-dark">
							<tr>
								<th scope="col">#</th>
								<#list labels as label>
									<th scope="col">
										<#if label?has_content>${label}<#else>null</#if>
									</th>
								</#list>
							</tr>
						</thead>
					</#if>
					  <tbody>
					    <#list data as rows>
						    <tr>
						      <th scope="row">${rows?counter}</th>
						      <#list rows as col>
						      	<td>
						      		<#if col?has_content>${col}<#else>null</#if>
					      		</td>
						      </#list>
						    </tr> 
					 	</#list>
					  </tbody>
				 </table>
			</#if>
			<#if !products?? && !data??>
				<@macrosN.notice str="No data"/>
			</#if>
		</div>
	</div>
</div> 
</@macros.environment> 
