*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary


*** Variables ***
${baseurl}      https://reqres.in/
${Id}      2

*** Test Cases ***

get_User_details
    Create Session    lms_Session    ${baseurl}
    ${response}=    Get Request    lms_Session    /api/users/${Id}
    Log To Console    "request intiate for user Api"
    Log To Console    ${response.status_code}
    Log To Console    _____________________________________________________
    Log To Console    ${response.content}
    Log To Console    _____________________________________________________
    Log To Console    ${response.headers}
    Log To Console    _____________________________________________________

# validation

    ${response_status}=     Convert To String    ${response.status_code}
    Should Be Equal     ${response_status}      200
    Log To Console    _____________________________________________________
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    application/json; charset=utf-8
    Log To Console    _____________________________________________________
    #${json_object}=     Get Value From Json  ${response.content}       $.data.first_name
    #Log To Console    ${json_object[0]}