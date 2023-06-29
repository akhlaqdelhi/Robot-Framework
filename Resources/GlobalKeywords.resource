*** Settings ***
Library    JSONLibrary

*** Keywords ***
Get_field_from_config
    [Arguments]    ${fieldName}
    ${file_obj} =     Load JSON From File    C:\\Users\\akhlaq.ahmed\\credentials.json
    ${fieldValue}=         Get Value From Json     ${file_obj}     $.${fieldName}
    ${l}    Get Length    ${fieldValue}[0]
    IF  ${l}>0
        Log     fieldValue= ${fieldValue}[0]
        RETURN        ${fieldValue}[0]
    ELSE
        RETURN        ${EMPTY}
    END

