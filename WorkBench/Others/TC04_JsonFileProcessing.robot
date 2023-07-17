*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections
Library     OperatingSystem

*** Variables ***
${file_path}    ${CURDIR}/../data/sampleJson.json

*** Test Cases ***
Fetch value from json file
    ${jsonfile}=    load json from file     ${file_path}
    ${result}=     Get Value From Json    ${jsonfile}      $.Name
    Log To Console    \n \n Name= ${result}[0] \n

update value to a json file
    Log To Console    Starting TC


