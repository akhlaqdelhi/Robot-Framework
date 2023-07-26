*** Settings ***
Library    AppiumLibrary

*** Variables ***

*** Test Cases ***
TC_login_app
    [Tags]    AP2001
    Log To Console    \n here we are starting the application
#    Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  automationName=UIautomator2   deviceName=399653JA1172000457  appPackage=com.linkedin.android	appActivity=com.linkedin.android.infra.navigation.MainActivity
    Capture Page Screenshot
