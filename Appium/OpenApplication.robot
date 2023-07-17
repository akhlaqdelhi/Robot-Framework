*** Settings ***
Library    AppiumLibrary


*** Variables ***
${el_animation1}  //android.widget.TextView[@text="Animation"]
${el_animation2}  //android.widget.TextView[contains(@text,"Animat")]
${el_animation3}  //android.widget.TextView[@text="Animation" and @resource-id="android:id/text1"]
${el_animation4}  //android.widget.ListView//android.widget.TextView[@text="Animation"]


*** Test Cases ***
TC_Open My Application>>
    [Tags]    AU0101
    Log To Console    \n welcome to android project-- opening an application
#    Open Application	http://localhost:4723/wd/hub	alias=Myapp1	platformName=iOS	platformVersion=7.0	deviceName='iPhone Simulator'	app=your.app
#    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=399653JA1172000457  appPackage=com.whatsapp  appActivity=com.whatsapp.HomeActivity  automationName=UIautomator2
#    Open Application  http://127.0.0.1:4723/  platformName=Android  deviceName=emulator-5554  appPackage=com.android.dreams.basic  appActivity=com.android.dreams.basic.Colors
#    to get the device name run command "adb devices" and use it on below line

    Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  automationName=UIautomator2   deviceName=emulator-5554  appPackage=io.appium.android.apis  appActivity=io.appium.android.apis
    Capture Page Screenshot
    Wait Until Page Contains Element    ${el_animation1}
    Wait Until Page Contains Element    ${el_animation2}
    Wait Until Page Contains Element    ${el_animation3}
    Wait Until Page Contains Element    ${el_animation4}