*** Settings ***
Documentation    Suite description
Library  XML
Library  Collections
Library  RequestsLibrary
Library  os

#http://www.thomas-bayer.com/sqlrest/CUSTOMER/15
*** Variables ***
${base_url}  http://www.thomas-bayer.com

*** Test Cases ***
Testcase1
    create session   mysession   ${base_url}
    ${response}=    get request     mysession       /sqlrest/CUSTOMER/15
    ${xml_string}=    convert to string  ${response.content}
    ${xml_object}=      parse xml  ${xml_string}

    #Check single element value
    element text should be   ${xml_object}     15      .//ID

    #Check multiple values
    ${child_elements}=  get child elements  ${xml_object}
    should not be empty  ${child_Elements}

    ${id}=  get element text  ${child_Elements[0]}
    ${fname}=  get element text  ${child_Elements[1]}
    ${lname}=  get element text  ${child_Elements[2]}
    ${street}=  get element text  ${child_Elements[3]}
    ${city}=  get element text  ${child_Elements[4]}

    should be equal   ${id}     15
    should be equal   ${fname}     Bill
    should be equal   ${lname}     Clancy
    should be equal   ${street}     319 Upland Pl.
    should be equal   ${city}     Seattle


