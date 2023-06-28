*** Settings ***
Resource    01_Resource_Login.resource

*** Test Cases ***
Login to banking app
    [Tags]    UI0101
    open_portal
    Verify_success_login


