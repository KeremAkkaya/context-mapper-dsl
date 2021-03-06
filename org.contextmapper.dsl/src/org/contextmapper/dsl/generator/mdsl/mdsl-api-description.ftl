<#if timestampString?has_content>
// ${timestampString}
</#if>
API description ${serviceSpecification.name}
<#if serviceSpecification.usageContext?has_content>
usage context ${serviceSpecification.usageContext.toString()} for BACKEND_INTEGRATION and FRONTEND_INTEGRATION
</#if>

<#if serviceSpecification.dataTypeProtectedRegion?has_content>
// ** BEGIN PROTECTED REGION for data types
${serviceSpecification.dataTypeProtectedRegion}
// ** END PROTECTED REGION for data types
</#if>

<#list serviceSpecification.dataTypes as dataType>
	<#if !dataType.isPrimitiveType()>
		<#if dataType.hasComments()>
// ${dataType.getCommentsString()}
		</#if>
		<#if dataType.isAbstractDataType()>
data type ${dataType.name} P // the type ${dataType.name} has not been specified or does not contain any attributes in CML
		<#elseif dataType.isEnumType()>
data type ${dataType.name} {${dataType.getEnumValuesString()}}
		<#else>
data type ${dataType.name} { <#list dataType.attributes as attribute>"${attribute.getName()}":${attribute.getType()}<#if attribute.isCollection()>*<#elseif attribute.isNullable()>?</#if><#if attribute_index < dataType.attributes?size - 1>, </#if></#list> }
		</#if>
	</#if>
</#list>

<#if serviceSpecification.endpointProtectedRegion?has_content>
// ** BEGIN PROTECTED REGION for endpoint types
${serviceSpecification.endpointProtectedRegion}
// ** END PROTECTED REGION for endpoint types
</#if>

<#list serviceSpecification.endpoints as endpoint>
endpoint type ${endpoint.name}
	<#if endpoint.servesAs?has_content>
	serves as <#if endpoint.isServesAsPatternMatched()>${endpoint.servesAs}<#else>"${endpoint.servesAs}"</#if>
	</#if>
	<#if endpoint.operations?has_content>
	exposes
	<#else>
// Your aggregate root does not specify any methods/operations. Therefore we can not generate any endpoint operations.
	</#if>
		<#list endpoint.operations as operation>
		operation ${operation.name}
			<#if operation.endpointResponsibility?has_content>
			with responsibility <#if operation.isEndpointResponsibilityPatternMatched()>${operation.endpointResponsibility}<#else>"${operation.endpointResponsibility}"</#if>
			</#if>
			<#if operation.expectingPayload?has_content>
			expecting
				payload ${operation.expectingPayload.name}<#if operation.expectingCollection()>*</#if>
			</#if>
			<#if operation.deliveringPayload?has_content>
			delivering
				payload ${operation.deliveringPayload.name}<#if operation.deliveringCollection()>*</#if>
			</#if>
		</#list>
</#list>

<#if serviceSpecification.providerProtectedRegion?has_content>
// ** BEGIN PROTECTED REGION for API providers
${serviceSpecification.providerProtectedRegion}
// ** END PROTECTED REGION for API providers
</#if>

<#list serviceSpecification.providers as provider>
<#if provider.hasComments()>
	<#list provider.comments as comment>
// ${comment}
	</#list>
</#if>
API provider ${provider.name}
	<#if provider.domainVisionStatement?has_content>
	// ${provider.domainVisionStatement}
	</#if>
	<#list provider.endpointOffers as offer>
	offers ${offer.offeredEndpoint.name}
	at endpoint location "${offer.location}"
		via protocol "${offer.protocol}"<#if offer.hasProtocolComment()> // ${offer.getProtocolComment()}</#if>
	</#list>
</#list>

<#if serviceSpecification.clientProtectedRegion?has_content>
// ** BEGIN PROTECTED REGION for API clients
${serviceSpecification.clientProtectedRegion}
// ** END PROTECTED REGION for API clients
</#if>

<#list serviceSpecification.clients as client>
<#if client.hasComments()>
	<#list client.comments as comment>
// ${comment}
	</#list>
</#if>
API client ${client.name}
	<#if client.domainVisionStatement?has_content>
	// ${client.domainVisionStatement}
	</#if>
	<#list client.consumedOfferNames as offername>
	consumes ${offername}
	</#list>
</#list>

IPA