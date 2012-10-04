
<%@ page import="roar.Entry" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Animal Responder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-entry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list entry">
			
				<g:if test="${entryInstance?.agentName}">
				<li class="fieldcontain">
					<span id="agentName-label" class="property-label"><g:message code="entry.agentName.label" default="Agent Name" /></span>
					
						<span class="property-value" aria-labelledby="agentName-label"><g:fieldValue bean="${entryInstance}" field="agentName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entryInstance?.agentType}">
				<li class="fieldcontain">
					<span id="agentType-label" class="property-label"><g:message code="entry.agentType.label" default="Agent Type" /></span>
					
						<span class="property-value" aria-labelledby="agentType-label"><g:fieldValue bean="${entryInstance}" field="agentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entryInstance?.advName}">
				<li class="fieldcontain">
					<span id="advName-label" class="property-label"><g:message code="entry.advName.label" default="Adversary Name" /></span>
					
						<span class="property-value" aria-labelledby="advName-label"><g:fieldValue bean="${entryInstance}" field="advName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entryInstance?.advTech}">
				<li class="fieldcontain">
					<span id="advTech-label" class="property-label"><g:message code="entry.advTech.label" default="Adversary Tech" /></span>
					
						<span class="property-value" aria-labelledby="advTech-label"><g:fieldValue bean="${entryInstance}" field="advTech"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entryInstance?.serviceStart}">
				<li class="fieldcontain">
					<span id="serviceStart-label" class="property-label"><g:message code="entry.serviceStart.label" default="Service Start" /></span>
					
						<span class="property-value" aria-labelledby="serviceStart-label"><g:formatDate date="${entryInstance?.serviceStart}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${entryInstance?.serviceLast}">
				<li class="fieldcontain">
					<span id="serviceLast-label" class="property-label"><g:message code="entry.serviceLast.label" default="Service Last" /></span>
					
						<span class="property-value" aria-labelledby="serviceLast-label"><g:formatDate date="${entryInstance?.serviceLast}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${entryInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="entry.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${entryInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${entryInstance?.id}" />
					<g:link class="edit" action="edit" id="${entryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
