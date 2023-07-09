*** Settings ***
Library    AppiumLibrary


*** Test Cases ***
TC_Open My Application>>
    [Tags]    AI0101
    Log To Console    \n welcome to android project-- opening an application
#    Open Application	http://localhost:4723/wd/hub	alias=Myapp1	platformName=iOS	platformVersion=7.0	deviceName='iPhone Simulator'	app=your.app
#    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=399653JA1172000457  appPackage=com.whatsapp  appActivity=com.whatsapp.HomeActivity  automationName=UIautomator2
    Open Application  http://localhost:4723/wd/hub  platformName=Android  deviceName=emulator-5554  appPackage=com.whatsapp  appActivity=com.whatsapp.home.ui.StarredMessagesPlaceholderActivity
