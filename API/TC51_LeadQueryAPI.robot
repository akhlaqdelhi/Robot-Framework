*** Settings ***
*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${baseurl}      https://lmstest.pinelabs.com

*** Test Cases ***

LeadQuery_API
    Create Session    lms_Session    ${baseurl}
    ${body}=    Create Dictionary   externalReferenceId=xRef7665    lmsReferenceId=45465
    ${headers}=     Create Dictionary    Content-Type=application/json
    ${response}=    Post On Session    lms_Session    /rest/epos/query.rest    json=${body}   headers=${headers}
    Log To Console    "request intiate for query Api"
    Log To Console    ${body}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    #VALIDATIONS
    ${status}=  Convert To String    ${response.status_code}
    Should Be Equal    ${status}    200

    ${responseBody}=    Convert To String    ${response.content}
    Log To Console    ${responseBody}

