*** Settings ***
Library  RequestsLibrary
Library  OperatingSystem
Library  Collections

*** Variables ***
${base_url}     https://certtransaction.elementexpress.com
#TOKEN- E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801
${bearer_token}     "Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
BearerAuth
    create session  mysession   ${base_url}
    ${headers}  create dictionary  Authorization=${bearer_token}        Content-Type=text/xml
    ${rer_body}=  get file      C:/Users/I823285/Desktop/PostXml.xml

    ${resp_body}=    post request  mysession  / data=${rer_body}  headers=${headers}
    log to console  ${resp_body}


