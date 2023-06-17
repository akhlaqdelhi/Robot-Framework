*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections
Library     OperatingSystem

*** Variables ***
${FilePath}     ${CURDIR}\\data\\employee.json

*** Test Cases ***
Test case:: working with json file
    [Documentation]    This testcase include json operation like fetching the filed value, updating value,
    ...  removing node and adding a new node to json object
    [Tags]      TC0401
    ${jsonfile}=    load json from file     ${FilePath}
    ${name}=     Get Value From Json    ${jsonfile}      $.Name
    Log Many   ${jsonfile}      ${name}
    # update filedValue from json object
    ${jsonfile}     Update Value To Json        ${jsonfile}     $.EmpId     5555
    Log         After updating EmpId value= ${jsonfile}
    # Remove a Filed from json object
    ${jsonfile}     Delete Object From Json        ${jsonfile}     $.DOB
    Log         After removing DOB value= ${jsonfile}
    # Adding a node to json object
    ${project}=    Create Dictionary  projectName= Merchant Data Plateform  Type= Microservice  Duration= 12 month
    ${jsonfile}=    Add Object To Json    ${jsonfile}    $.project    ${project}
    Log         AfterAddingNode=${jsonfile}


