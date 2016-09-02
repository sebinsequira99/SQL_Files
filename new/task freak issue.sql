

declare @xmlout VARCHAR (8000)
exec usp_CallWebService 'http://cdmap01.myadoptionportal.com/webservice/taskfreak/?wsdl'
,'POST'
,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
					   <soapenv:Header/>
						<soapenv:Body>
						  <tem:WSTaskFreakCreateNewResource> 
							   <tem:AgencyID>222</tem:AgencyID>         
							   <tem:connid>-102480</tem:connid>            
						 </tem:WSTaskFreakCreateNewResource>
					   </soapenv:Body>
					</soapenv:Envelope>', 
'WSTaskFreakCreateNewResource'
,'','',@xmlOut out


<?xml version="1.0" encoding="UTF-8"?><SOAP-ENV:Envelope SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
  xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/">
<SOAP-ENV:Body><SOAP-ENV:Fault><faultcode xsi:type="xsd:string">SOAP-ENV:Client</faultcode><faultactor xsi:type="xsd:string"></faultactor><faultstring xsi:type="xsd:string">error in msg parsing:
xml was empty, didn&apos;t parse!</faultstring><detail xsi:type="xsd:string"></detail></SOAP-ENV:Fault></SOAP-ENV:Body></SOAP-ENV:Envelope>


select * from webservicelog
order by WSCallStartTime desc





