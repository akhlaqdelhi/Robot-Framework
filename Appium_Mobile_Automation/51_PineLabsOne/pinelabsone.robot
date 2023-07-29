*** Settings ***
Resource    res_pinelabsone.resource

Test Template    loginVia_userrname_password
Suite Setup    open_pinelabsone_app
Suite Teardown    Close All Applications

*** Test Cases ***
#TC login with invalid user      jsdkfj      itN0@#
#    [Tags]    AP5101
#    [Documentation]    this test verrify if a user can login successfully
#
#TC login with invalid password      BEST_INTERNATIONAL_INC_1      sldfkj
#    [Tags]    AP5101
#    [Documentation]    this test verrify if a user can login successfully

TC login with valid user and password      BEST_INTERNATIONAL_INC_1      itN0@#
    [Tags]    AP5101
    [Documentation]    this test verrify if a user can login successfully



*** Keywords ***
loginVia_userrname_password
    [Arguments]    ${userrname}     ${password}
    Log To Console    \n login acivity to be done here ${userrname} | ${password}
    login_app
