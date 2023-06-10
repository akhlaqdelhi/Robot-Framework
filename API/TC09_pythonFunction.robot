*** Settings ***
Library     ./data/DeploymentRequest.py
Library     ./data/sampleJson.py
Library     JSONLibrary

*** Variables ***
${depReqJson}

*** Keywords ***


*** Test Cases ***

#Verify Json returned by Python function
#    ${Json}=    Run Keyword     CRM_DC_EMI
#    Set Test Variable    ${depReqJson}      ${Json}
#    Log To Console    valuejson= ${depReqJson}
#    
    
Manipulating sampleJson    
    ${Json_obj}=    Run Keyword         myJson
    ${Json_obj}=    Convert String To JSON    ${Json_obj}
    Log To Console    json fetched= ${Json_obj}
    ${name}=        Get Value From Json    ${Json_obj}    $..name
    Log To Console    Name value= ${name}
    Update Value To Json    ${Json_obj}    $..name    Ahmed
    ${name}=        Get Value From Json    ${Json_obj}    $..name
    Log To Console    New Name value= ${name}


    