*** Settings ***
Resource    keywords.robot
Resource        ${CURDIR}}../../../${environment}.robot

Library         SeleniumLibrary
Library         CryptoLibrary    variable_decryption=True

*** Test Cases ***

Log work
    [Documentation]     this wil be used to log the work in jira
    [Tags]      WB01
    Jira login


debug
    [Tags]    DB01
    ${var}      set test variable       ${CURDIR}}../../../
    log to console    ${var}