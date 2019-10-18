<#assign currContext = Session.SPRING_SECURITY_CONTEXT??>

<#if currContext>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
    >
</#if>
 