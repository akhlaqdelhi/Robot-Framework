*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}=    https://reqres.in/

*** Test Cases ***

TC_ fetch specific user details
    Create Session    mysession    ${base_url}
    ${response}=    Get Request    mysession    /api/users/2
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}

TC_ update the user data
    Create Session    usersession    ${base_url}
    ${body}=    Create Dictionary    name=akhlaq ahmed     job=leader
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    Put Request    usersession    /api/users/2      data=${body}     headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    #Verify body Contain
    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    akhlaq
    #Verify response status-code
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

TC_ Verify user details after update
    Create Session    mysession    ${base_url}
    ${response}=    Get Request    mysession    /api/users/2
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}