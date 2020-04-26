#How To Configure PyCharm for Robot Framework, follow the below link

https://www.youtube.com/watch?v=r3Mg60r1Jjk

*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***

${baseurl}  http://restapi.demoqa.com/
${city}  Delhi

*** Test Cases ***
Get_weatherInfo
    create session  mysession   ${baseurl}
    ${response}=  get request  mysession     utilities/weather/city/${city}
#    log to console      ${response.status_code}
#    log to console   ${response.content}
#    log to console  ${response.headers}

#Validate status code, response body and header

    ${status_code}=     convert to string    ${response.status_code}
    should be equal  ${status_code}               200
    ${body}=          convert to string  ${response.content}
    should contain  ${body}     Delhi
    ${contentTypeValue}=    get from dictionary     ${response.headers}     Content-Type
    should be equal  ${contentTypeValue}  application/json
