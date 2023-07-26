*** Settings ***
Library    AppiumLibrary
Library    String

*** Variables ***
#    com.simplemobiletools.smsmessenger     # related variables
${package_name}      com.simplemobiletools.smsmessenger
${start_activity}       ${package_name}.activities.MainActivity
${deviceName}       399653JA1172000457     #real device nokia G20
#${deviceName}       Pixel3API28Android9     # emulator device
#com.android.settings/com.android.settings.SmsDefaultDialog     # Change SMS app? pop up screen
${popupChanegSMSApp_yes_buttton}        Id=android:id/button1
${smsApp_search_field}      id=${package_name}:id/top_toolbar_search
${smsApp_selectMessage_element}      ${package_name}:id/search_result_image
#${smsview_message_area}      id=com.simplemobiletools.smsmessenger:id/thread_message_body
${smsview_message_area}      ${package_name}:id/thread_messages_list
${smsview_message_area}      ${package_name}:id/thread_message_holder
${smsview_message_area}      ${package_name}:id/thread_message_body

${app_url}      ${CURDIR}/SMSMessenger.apk

*** Keywords ***
#open_sms_app_com.microsoft.android.smsorganizer
#    Log To Console    \n code for the keyword 'open_sms_app'
#    Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  automationName=UIautomator2   deviceName=399653JA1172000457  appPackage=com.microsoft.android.smsorganizer  appActivity=com.microsoft.android.smsorganizer.StartupActivity
#    wait_click_element      ${Agreement_Accept_button}
#    click_element_if_exist      ${defaultApp_cancel_button}
#    click_element_if_exist      ${permissionController_Allow_button}
#    click_element_if_exist      ${permissionController_Allow_button}
#    click_element_if_exist      ${permissionController_Allow_button}
#    wait_click_element      ${backup_skip_button}
#    wait_click_element      ${readyScreen_getStarted_button}
#    click_element_if_exist      ${permissionController_Allow_button}
#    click_element_if_exist      ${permissionController_disAllow_button}
#    wait_click_element      ${newtheme_dismiss_button}
#    wait_click_element      ${readyScreen_getStarted_button}
#    Capture Page Screenshot


open_sms_app
    Log To Console    \n code for the keyword ${package_name}
#    Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  automationName=UIautomator2   deviceName=${deviceName}  appPackage=${package_name}  appActivity=${start_activity}
#    Open Application  http://127.0.0.1:4723  platformName=Android  automationName=UIautomator2   deviceName=${deviceName}  appPackage=${package_name}  appActivity=${start_activity}
    Open Application  http://127.0.0.1:4723  platformName=Android  automationName=UIautomator2   deviceName=${deviceName}  appPackage=${package_name}  appActivity=${start_activity}   app=${app_url}
    ${flag}     Run Keyword And Return Status    Page Should Contain Element    ${popupChanegSMSApp_yes_buttton}
    Run Keyword If    "${flag}"=="True"         manage_defaultapp_popup


Search_message
    [Arguments]    ${text}
    Wait Until Page Contains Element    ${smsApp_search_field}
    Click Element    ${smsApp_search_field}
    Input Text    ${smsApp_search_field}  ${text}
    Wait Until Page Contains Element    ${smsApp_selectMessage_element}
    Click Element    ${smsApp_selectMessage_element}

get_sms
    [Arguments]    ${text}
    Search_message      ${text}
    Wait Until Page Contains Element    ${smsview_message_area}
    Wait Until Page Contains Element    //androidx.recyclerview.widget.RecyclerView[contains(@resource-id,'thread_messages_list')]//android.view.ViewGroup[contains(@resource-id,'thread_message_holder')][1]//android.widget.TextView[contains(@text,'${text}')]
    @{elements}	Get Webelements	//android.widget.TextView[contains(@text,'${text}')]
    ${count}  Get Length  ${elements}
    ${message}  Get Text        //androidx.recyclerview.widget.RecyclerView[contains(@resource-id,'thread_messages_list')]//android.view.ViewGroup[contains(@resource-id,'thread_message_holder')][${count}]//android.widget.TextView[contains(@text,'${text}')]
#    ${message2}  Get Text        //androidx.recyclerview.widget.RecyclerView[contains(@resource-id,'thread_messages_list')]//android.view.ViewGroup[contains(@resource-id,'thread_message_holder')][2]//android.widget.TextView[contains(@text,'${text}')]
#    ${message3}  Get Text        //androidx.recyclerview.widget.RecyclerView[contains(@resource-id,'thread_messages_list')]//android.view.ViewGroup[contains(@resource-id,'thread_message_holder')][3]//android.widget.TextView[contains(@text,'${text}')]
#    Log To Console    \n ${message}-${message2}-${message3}
    RETURN      ${message}


get_OTP
    [Arguments]    ${text}
    IF    "${text}"=="bdZmBPxea15"
        ${message}  get_sms     ${text}
        ${otp}  Get Substring       ${message}      0       4
        RETURN  ${otp}
    ELSE
        Log    no OTP found
        RETURN   N/A
    END

manage_defaultapp_popup
    Click Element    ${popupChanegSMSApp_yes_buttton}


#wait_click_element
#    [Arguments]    ${element}
#    Wait Until Page Contains Element    ${element}
#    Click Element    ${element}
#
#click_element_if_exist
#    [Arguments]    ${element}
#    Sleep    1s
#    ${flag}  Run Keyword And Return Status    Element Should Be Enabled    ${element}
##    Wait Until Page Contains Element    ${element}
#    IF    "${flag}"=="True"
#        Click Element    ${element}
#    END
#
#get_sms
#    [Arguments]    ${from}  ${text}
#    Log To Console    \n code for the keyword
#    RETURN      nodn fsdn ffdsnods ngd sondfgo
#
#
#retrieve_an_otp
#    [Arguments]    ${message}
#    Log To Console    \n code for the keyword
#    RETURN      4561

