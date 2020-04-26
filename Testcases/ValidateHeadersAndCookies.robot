*** Settings ***
Documentation    Suite description
Library  XML
Library  Collections
Library  RequestsLibrary
Library  os

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
    create session  mysession   ${base_url}
    ${response}=    get request  mysession  /photos

    log to console   ${response.headers}

    ${contentTypeValue}=      get from dictionary  ${response.headers}      Content-Type
    should be equal  ${contentTypeValue}    application/json; charset=utf-8

    ${contentEncodeValue}=      get from dictionary  ${response.headers}      Content-Encoding
    should be equal  ${contentEncodeValue}    gzip

TestCookies
     create session  mysession   ${base_url}
    ${response}=    get request  mysession  /photo

    log to console   ${response.cookies}

    ${cookie_value}=    get from dictionary  ${response.cookies}    __cfduid
    log to console   ${cookie_value}
