*** Settings ***
Library    AppiumLibrary



*** Variables ***
${el_animation1}  //android.widget.TextView[@text="Animation"]
${el_animation2}  //android.widget.TextView[contains(@text,"Animat")]
${el_animation3}  //android.widget.TextView[@text="Animation" and @resource-id="android:id/text1"]
${el_animation4}  //android.widget.ListView//android.widget.TextView[@text="Animation"]

#whatsapp *** Variables ***
${el_newMessage}  id:com.whatsapp:id/fab

*** Test Cases ***
TC_Open My Application>>
    [Tags]    AU0101
    Log To Console    \n welcome to android project-- opening an application
    #deviceName= run command "adb devices" and use the name shown,
    #appPackage= app name find it using apkinfo app
    #appActivity= reference to screen to be open find under "Activities" section of "apk info" app, Also it can be retrieved by "uiautomatorviewer" utility
    #Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  automationName=UIautomator2   deviceName=emulator-5554  appPackage=io.appium.android.apis  appActivity=io.appium.android.apis.ApiDemos
    #deviceName=399653JA1172000457  # Nokia G20 device
    Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  automationName=UIautomator2   deviceName=399653JA1172000457  appPackage=io.appium.android.apis  appActivity=io.appium.android.apis.ApiDemos
    Capture Page Screenshot
    Wait Until Page Contains Element    ${el_animation1}
    Wait Until Page Contains Element    ${el_animation2}
    Wait Until Page Contains Element    ${el_animation3}
    Wait Until Page Contains Element    ${el_animation4}



TC_WhatsApp_action
    [Tags]    AU0102
#    Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  automationName=UIautomator2   deviceName=399653JA1172000457  appPackage=com.whatsapp  appActivity=com.whatsapp.HomeActivity
    Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  automationName=UIautomator2   deviceName=399653JA1172000457  appPackage=com.whatsapp  appActivity=com.whatsapp.HomeActivity
    Wait Until Page Contains Element    ${el_newMessage}
    Click Element    ${el_newMessage}











