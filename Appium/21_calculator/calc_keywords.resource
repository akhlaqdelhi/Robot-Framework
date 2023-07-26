*** Settings ***
Library    AppiumLibrary

*** Variables ***
${el_key_1}  id=com.android.calculator2:id/digit_1
${el_key_2}  id=com.android.calculator2:id/digit_2
${el_key_3}  id=com.android.calculator2:id/digit_3
${el_key_4}  id=com.android.calculator2:id/digit_4
${el_key_5}  id=com.android.calculator2:id/digit_5
${el_key_6}  id=com.android.calculator2:id/digit_6
${el_key_7}  id=com.android.calculator2:id/digit_7
${el_key_8}  id=com.android.calculator2:id/digit_8
${el_key_9}  id=com.android.calculator2:id/digit_9
${el_key_0}  id=com.android.calculator2:id/digit_0
${el_key_dec}  id=com.android.calculator2:id/dec_point
${el_key_eq}  id=com.android.calculator2:id/eq
${el_key_add}  id=com.android.calculator2:id/op_add
${el_key_sub}  id=com.android.calculator2:id/op_sub
${el_key_mul}  id=com.android.calculator2:id/op_mul
${el_key_div}  id=com.android.calculator2:id/op_div
${el_key_del}  id=com.android.calculator2:id/op_del

${el_area_result}  id=com.android.calculator2:id/result

*** Keywords ***

start_my_app
    Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  automationName=UIautomator2   deviceName=emulator-5554  appPackage=com.android.calculator2	appActivity=com.android.calculator2.Calculator
    Wait Until Page Contains Element    ${el_key_1}


do_calculation
    [Arguments]  ${key_sequence}  ${result}
    tap_key_squence  ${key_sequence}
    verify_result   ${result}


tap_key_squence
    [Arguments]    ${key_seq}
    log  keysequence is ${key_seq}
    FOR  ${key}  IN  @{key_seq}
        log  key to be pressed is == ${key}
        IF    "${key}"=="+"
            Click Element    ${el_key_add}
        ELSE IF    "${key}"=="-"
            Click Element    ${el_key_sub}
        ELSE IF    "${key}"=="/"
            Click Element    ${el_key_div}
        ELSE IF    "${key}"=="*"
            Click Element    ${el_key_mul}
        ELSE IF    "${key}"=="."
            Click Element    ${el_key_dec}
        ELSE IF    "${key}"=="="
            Click Element    ${el_key_eq}
        ELSE
            Wait Until Page Contains Element    id=com.android.calculator2:id/digit_${key}
            Click Element    id=com.android.calculator2:id/digit_${key}
        END
    END
    Click Element    ${el_key_eq}

verify_result
    [Arguments]    ${result}
    Wait Until Page Contains Element  ${el_area_result}
    Element Should Contain Text    ${el_area_result}   ${result}
