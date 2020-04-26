*** Settings ***
Documentation    Suite description
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base_url}=    http://restapi.demoqa.com/customer

*** Test Cases ***
Post_CustomerRegistration
    create session  mysession   ${base_url}
    ${body}=  create dictionary  FirstName=Isha1234  LastName=Isha1234  UserName=Isha1234  Password=Isha1234  Email=Isha1234
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=    post request  mysession  /register  data=${body}  headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}

    #VALIDATIONS
    ${res_status}=  convert to string  ${response.status_code}
    should be equal   ${res_status}    201

    ${res_body}=  convert to string     ${response.content}
    should contain  ${res_body}     OPERATION_SUCCESS
    should contain  ${res_body}     Operation completed successfully
