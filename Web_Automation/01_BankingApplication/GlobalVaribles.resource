*** Variables ***
${baseUrl}      https://demo.guru99.com/V1/index.php


*** Keywords ***

Get_field_from_config
    [Arguments]    ${fieldName}
    ${file_obj} =     Load JSON From File    ${CURDIR}${/}\\API\\Resources\\Data\\config.json
    Log Many    config json path    ${CURDIR}${/}\\API\\Resources\\Data\\config.json
    ${fieldValue}=         Get Value From Json     ${file_obj}     $.${fieldName}
    ${l}    Get Length    ${fieldValue}[0]
    IF  ${l}>0
        Log     fieldValue= ${fieldValue}[0]
        RETURN        ${fieldValue}[0]
    ELSE
        RETURN        ${EMPTY}
    END

Set_field_to_config
    [Arguments]    ${fieldName}  ${fieldValue}
    ${file_obj} =     Load JSON From File    ${CURDIR}${/}\\API\\Resources\\Data\\config.json
    ${fieldlist}=         Get Value From Json     ${file_obj}     $.${fieldName}
     Insert Into List	${fieldlist}[0]	-1	${fieldValue}
#    Get From List
     Set to dictionary    ${file_obj}   ${fieldName}=${fieldlist}[0]
     Dump Json To File       ${CURDIR}${/}\\API\\Resources\\Data\\config.json       ${file_obj}

remove_field_from_config
    [Arguments]    ${fieldName}
        ${file_obj} =     Load JSON From File    ${CURDIR}${/}\\API\\Resources\\Data\\config.json
    ${fieldlist}=         Get Value From Json     ${file_obj}     $.${fieldName}
#    remove value from first postion
     Remove From List	${fieldlist}[0]	0
#    Set the update list value
     Set to dictionary    ${file_obj}   ${fieldName}=${fieldlist}[0]
     Dump Json To File       ${CURDIR}${/}\\API\\Resources\\Data\\config.json       ${file_obj}
