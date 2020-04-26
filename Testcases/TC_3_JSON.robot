*** Settings ***
Documentation    Suite description
Library  JSONLibrary
Library  Collections
Library  os
Library  JSONLibrary
Library     os      #loading file
Library     Collections

# https://jsonpath.com/?; http://jsonpathfinder.com/
*** Test Cases ***
Testcase 1:
    ${json_obj}=    load json from file     C:/Users/I823285/Desktop/test.json
    ${name_value}=  get value from json   ${json_obj}      $.firstName
    ${street_address}=  get value from json     ${json_obj}     $.address.streetAddress
    ${phone_number}=    get value from json     ${json_obj}     $.phoneNumbers[1].type

    log to console  ${name_value[0]}
    should be equal  ${name_value[0]}   John
    log to console  ${street_address[0]}
    should be equal  ${street_address[0]}   naist street
    log to console  ${phone_number[0]}
    should be equal  ${phone_number[0]}   home