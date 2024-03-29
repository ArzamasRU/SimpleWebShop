<#macro login path isRegisterForm>
<form
	action="${path}"
	method="post">
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">User Name :</label>
		<div class="col-sm-6">
			<input
				type="text"
				name="username"
				class="form-control"
				placeholder="User name" />
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">Password:</label>
		<div class="col-sm-6">
			<input
				type="password"
				name="password"
				class="form-control"
				placeholder="Password" />
		</div>
	</div>
	<input
		type="hidden"
		name="_csrf"
		value="${_csrf.token}" />
	<button
		class="btn btn-primary"
		type="submit">
		<#if isRegisterForm>Create<#else>Sign In</#if>
	</button>
	<#if !isRegisterForm>
	<a>or </a><a href="/registration">add new user</a></#if>
</form>
</#macro>


