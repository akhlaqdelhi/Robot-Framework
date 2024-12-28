*** Settings ***
#Library    AppiumLibrary
Resource    calc_keywords.resource

*** Variables ***
${el_key_clr}  id=com.android.calculator2:id/clr


*** Test Cases ***
TC_calculator_app_actions
    [Tags]    AP2101
    start_my_app
    @{keys1}  Create List      4  +  5  +  7
    do_calculation  ${keys1}  16

    Wait Until Page Contains Element    ${el_key_clr}
    Click Element  ${el_key_clr}
    @{keys2}  Create List      1  2  4  +  2  3  5  -  1  0  7  *  2  3  /  1  2
    do_calculation  ${keys2}  153

