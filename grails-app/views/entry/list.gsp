
<%@ page import="roar.Entry" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Animal Responder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-entry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="agentName" title="${message(code: 'entry.agentName.label', default: 'Agent Name')}" />
					
						<g:sortableColumn property="agentType" title="${message(code: 'entry.agentType.label', default: 'Agent Type')}" />
					
						<g:sortableColumn property="advName" title="${message(code: 'entry.advName.label', default: 'Adversary Name')}" />
					
						<g:sortableColumn property="advTech" title="${message(code: 'entry.advTech.label', default: 'Adversary Tech')}" />
					
						<g:sortableColumn property="serviceStart" title="${message(code: 'entry.serviceStart.label', default: 'Service Start')}" />
					
						<g:sortableColumn property="serviceLast" title="${message(code: 'entry.serviceLast.label', default: 'Service Last')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${entryInstanceList}" status="i" var="entryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${entryInstance.id}">${fieldValue(bean: entryInstance, field: "agentName")}</g:link></td>
					
						<td>${fieldValue(bean: entryInstance, field: "agentType")}</td>
					
						<td>${fieldValue(bean: entryInstance, field: "advName")}</td>
					
						<td>${fieldValue(bean: entryInstance, field: "advTech")}</td>
						
						<td><g:formatDate format="EEEE, MMM d, yyyy" date="${entryInstance.serviceStart}" /></td>
					
						<td><g:formatDate format="EEEE, MMM d, yyyy" date="${entryInstance.serviceLast}" /></td>
					
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${entryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
