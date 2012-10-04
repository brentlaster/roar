<%@ page import="roar.Entry" %>



<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'agentName', 'error')} ">
	<label for="agentName">
		<g:message code="entry.agentName.label" default="Agent Name" />
		
	</label>
	<g:textField name="agentName" value="${entryInstance?.agentName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'agentType', 'error')} ">
	<label for="agentType">
		<g:message code="entry.agentType.label" default="Agent Type" />
		
	</label>
	<g:textField name="agentType" value="${entryInstance?.agentType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'advName', 'error')} ">
	<label for="advName">
		<g:message code="entry.advName.label" default="Adversary Name" />
		
	</label>
	<g:textField name="advName" value="${entryInstance?.advName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'advTech', 'error')} ">
	<label for="advTech">
		<g:message code="entry.advTech.label" default="Adversary Tech" />
		
	</label>
	<g:textField name="advTech" maxlength="100" value="${entryInstance?.advTech}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'serviceStart', 'error')} required">
	<label for="serviceStart">
		<g:message code="entry.serviceStart.label" default="Service Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="serviceStart" precision="day"  value="${entryInstance?.serviceStart}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'serviceLast', 'error')} required">
	<label for="serviceLast">
		<g:message code="entry.serviceLast.label" default="Service Last" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="serviceLast" precision="day"  value="${entryInstance?.serviceLast}"  />
</div>

