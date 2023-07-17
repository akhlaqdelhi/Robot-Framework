*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${baseurl}      https://lmstest.pinelabs.com
${cert_path}       C:\\Users\\akhlaq.ahmed\\Downloads\\lmsuat_pinelabs_com.crt
${key_path}


*** Test Cases ***
LeadQuery_API
    [Tags]      WB5101
    Create Session    lms_Session    ${baseurl}
    ${body}    Create Dictionary   externalReferenceId=xRef7665    lmsReferenceId=45465
    ${headers}     Create Dictionary    Content-Type=application/json
#    ${response}=    Post On Session    lms_Session    /rest/epos/query.rest    data=${body}   headers=${headers}        verify=C:\\Users\\akhlaq.ahmed\\AppData\\Local\\Programs\\Python\\Python310\\lib\\site-packages\\certifi\\cacert.pem
#    Log To Console    \n \n ${body} \n
    ${response}=    Post On Session    lms_Session    /rest/epos/query.rest    data=${body}   headers=${headers}        verify=${cert_path}
#    ${response}=    Post On Session    lms_Session    /rest/epos/query.rest    json=${body}   headers=${headers}
    Log To Console    "request intiate for query Api"
    Log To Console    ${body}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    ${status}=  Convert To String    ${response.status_code}
    Should Be Equal    ${status}    200
    ${responseBody}=    Convert To String    ${response.content}
    Log To Console    ${responseBody}

LeadQuery_API_Debugg_to be deleted
    [Tags]      WB5102
    ${body}=    Create Dictionary   externalReferenceId=xRef7665    lmsReferenceId=45465
    ${headers}=     Create Dictionary    Content-Type=application/json
#Approach1
    Create Session    lms_Session    ${baseurl}
    ${response}=    Post    ${baseurl}/rest/epos/query.rest    json=${body}   headers=${headers}
# ----------------------
# Approach 2
#    @{client certs}=  create list  ${cert_path}     ${key_path}
#    Create Client Cert Session      mysertSession       ${baseurl}      headers=${headers}      client_certs=${client certs}
#    ${response}=    Post On Session    mysertSession    /rest/epos/query.rest      data=${body}      headers=${headers}
# ----------------------
# Approach 3
#    Create Client Cert Session      mysertSession       ${baseurl}      headers=${headers}      verify=${false}
#    ${response}=    Post On Session    mysertSession    /rest/epos/query.rest      data=${body}      headers=${headers}
# ----------------------
    Log To Console    "request intiate for query Api"
    Log To Console    ${body}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    ${status}=  Convert To String    ${response.status_code}
    Should Be Equal    ${status}    200
    ${responseBody}=    Convert To String    ${response.content}
    Log To Console    ${responseBody}