*** Settings ***
Library    AppiumLibrary        timeout=20
Resource    ../../Resources/GlobalKeywords.resource

*** Variables ***
${package_name}      com.pinelabs.pinelabsone.qa
${start_activity}       com.pinelabs.pinelabsone.MainActivity
${deviceName}       399653JA1172000457     #real device nokia G20
#${deviceName}       Pixel3API28Android9     # emulator device
#${app_url}      ${CURDIR}/SMSMessenger.apk

${langSelect_continue_button}        //android.widget.Button
${signin_withUserId_button}         //android.widget.Button[@content-desc='Sign In with User ID']
${signin_withMobile_button}         //android.widget.Button[@content-desc='Sign in with mobile no']
#   sign in screeen
${enterCredential_username_field}         //android.widget.EditText[@index='0']
${enterCredential_password_field}         //android.widget.EditText[@index='2']
${enterCredential_signIn_button}         //android.widget.ImageView[@content-desc='Sign In Securely']
# setup screen
${setup_heading}        accessibility_id=Let’s get started
${setup_skip_button}        accessibility_id=Skip
${setup_explore_button}        accessibility_id=Let’s explore

# Home Screen
${Home_home_tab}         accessibility_id=Home\nTab 1 of 3

*** Keywords ***
open_pinelabsone_app
    Log To Console    \n code for the keyword ${package_name}
#    Open Application  http://127.0.0.1:4723  platformName=Android  automationName=UIautomator2   deviceName=${deviceName}  appPackage=${package_name}  appActivity=${start_activity}
    Open Application  http://127.0.0.1:4723  platformName=Android  automationName=UIautomator2   uuid=${deviceName}  appPackage=${package_name}  appActivity=${start_activity}
    Wait Until Page Contains Element    ${langSelect_continue_button}


login_app
    Click Element    ${langSelect_continue_button}
    Wait Until Page Contains Element    ${signin_withUserId_button}
    Click Element    ${signin_withUserId_button}
    Wait Until Page Contains Element    ${enterCredential_username_field}
    ${plOne_username}      Get_field_from_config      plOne_username
    ${plOne_password}      Get_field_from_config      plOne_password
    Tap    ${enterCredential_username_field}
    Input Text    ${enterCredential_username_field}     ${plOne_username}
    @{position}	create list	${100}	${500}
    Tap with Positions	${500}  ${position}
    Wait Until Element Is Visible    ${enterCredential_password_field}       timeout=25
    Tap    ${enterCredential_password_field}
    Input Password    ${enterCredential_password_field}     ${plOne_password}
    Tap with Positions	${500}  ${position}
    Sleep    2s     # wait before screen change
    Click Element    ${enterCredential_signIn_button}       #   click on SignIn buton
    Wait Until Element Is Visible    ${setup_heading}
    Click Element    ${setup_skip_button}


    Wait Until Element Is Visible    ${setup_explore_button}       timeout=25
    Press Keycode             4
    Wait Until Element Is Visible    ${Home_home_tab}       timeout=25
    Sleep    5s     # last wait before closing the testcase

#    ${flag}     Run Keyword And Return Status    Page Should Contain Element    ${popupChanegSMSApp_yes_buttton}
#    Run Keyword If    "${flag}"=="True"         manage_defaultapp_popup

#get_OTP
#    [Arguments]    ${text}
#    IF    "${text}"=="bdZmBPxea15"
#        ${message}  get_sms     ${text}
#        ${otp}  Get Substring       ${message}      0       4
#        RETURN  ${otp}
#    ELSE
#        Log    no OTP found
#        RETURN   N/A
#    END
#
#manage_defaultapp_popup
#    Click Element    ${popupChanegSMSApp_yes_buttton}