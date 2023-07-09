*** Settings ***
Documentation  This script opens dialer on phone
Library  AppiumLibrary
Library  Collections

*** Variables ***
${Device_name}  399653JA1172000457
${Appium_server}  http://localhost:4723/wd/hub
#${appPackage}  com.android.dialer
#${appActivity}  com.android.dialer.DialtactsActivity
${appPackage}  com.android.phone
${appActivity}  com.android.dialer.EmergencyDialer
${platfrom}  4.4
${automationName}  uiautomator2

*** Test Cases ***
Open_Dialer
    [Tags]    AI0201
    setup and open dialer


*** Keywords ***
setup and open dialer
  ${androiddriver}=  Open Application  ${Appium_server}  platformName=android  platformVersion=${platfrom}  deviceName=${Device_name}  automationName=${automationName}
  ...  appPackage=${appPackage}  newCommandTimeout=2500  appActivity=${appActivity}