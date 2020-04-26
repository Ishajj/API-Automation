*** Settings ***
Documentation    Suite description
Library  JSONLibrary
Library  Collections
Library  os
Library  RequestsLibrary

*** Variables ***
${base_url}     https://restcountries.eu

*** Test Cases ***
Get_countryinfo
     create session     mysession   ${base_url}
     ${response}=   get request  mysession    /rest/v2/alpha/IN
     ${json_object}=    to json  ${response.content}

     #Single data
     ${country_name}=    get value from json    ${json_object}      $.name
     log to console      ${country_name[0]}
     should be equal     ${country_name[0]}   India

     #Single data validation in array
     ${border_value}=    get value from json    ${json_object}      $.borders[0]
     log to console      ${border_value[0]}
     should be equal     ${border_value[0]}   AFG

     #Multiple values verification in array

     ${border_values}=  get value from json     ${json_object}      $.borders
     log to console     ${border_values[0]}
     should contain any    ${border_values[0]}      AFG   BTN   MMR
     should not contain any  ${border_values[0]}   xyz      pkr
