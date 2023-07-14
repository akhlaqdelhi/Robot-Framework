*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
validate login on UI
    [Tags]    WBUI01
    open portal in the browser
    fille login data
    Verify login state



*** Keywords ***
open portal in the browser
    Create Webdriver    Chrome      executable_path="D:\\All Basic Softwares\\chromedriver_win32\\chromedriver.exe"

