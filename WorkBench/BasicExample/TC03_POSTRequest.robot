*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}=    https://reqres.in/

*** Test Cases ***
Create_User
    [Tags]      WBTC03_01
    Create Session    usersession    ${base_url}
    ${body}=    Create Dictionary    name=akhlaq     job=leader
    ${header}=    Create Dictionary    Content-Type=application/json
#    ${response}=    Post Request    usersession    /api/users      data=${body}     headers=${header}
    ${response}=    POST On Session    usersession    /api/users      json=${body}     headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    #Validation
 #Verify body Contain
    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    akhlaq
 #Verify response status-code
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    201
   