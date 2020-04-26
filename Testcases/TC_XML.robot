*** Settings ***
Documentation    Suite description
Library  os
Library  XML
Library  Collections

*** Test Cases ***
Test case 1
    ${xml_obj}=     parse xml   C:/Users/I823285/Desktop/testxml.xml

    #Validations
    #Approach 1
    ${emp_fname}=   get element text    ${xml_obj}      .//employee[1]/firstName
    should be equal  ${emp_fname}       Leonardo

    #Approach 2
    ${emp_firstnmae}=    get element  ${xml_obj}     .//employee[1]/firstName
    should be equal  ${emp_fname}       Leonardo

    #Approach 3
    element text should be      ${xml_obj}      Leonardo    .//employee[1]/firstName

    #Validation 2 check no. of elements
    ${count}=    get element count  ${xml_obj}       .//employee
    should be equal as integers  ${count}       3

    #Validation for some attribute in XML or not when <emp id=1>
    #element attribute should be  ${xml_obj}  id   1     .//employee[1]
    #element attribute should be    ${xml_obj}   id    1     .//employee[1]

    #Validation of child elements
    ${child_elms}=  get child elements  ${xml_obj}      .//employee[1]
    should not be empty  ${child_elms}

    ${fname}=    get element text  ${child_elms[1]}
    ${lname}=    get element text  ${child_elms[2]}
    ${id}=    get element text  ${child_elms[0]}

    log to console  ${fname}
    log to console  ${lname}
    log to console  ${id}

    should be equal  ${fname}   Leonardo
    should be equal  ${lname}   DiCaprio
    should be equal  ${id}   1
