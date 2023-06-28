*** Settings ***
Library    SeleniumLibrary
Resource    GlobalVaribles.resource

*** Variables ***
${username}     mngr509573
${password}     YsetenU
# above credential will expire post 20 days after 19-06-2023

*** Keywords ***
open_portal
#   Create Webdriver    Chrome      executable_path=D:\All Basic Softwares\chromedriver_win32_V114\
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To    ${baseUrl}
#   Open Browser    https://demo.guru99.com/V1/index.php
    Input Text    name:uid      ${username}
    Input Password    name:password     ${password}
    Click Button    name:btnLogin
    Wait Until Element Is Visible       //h2[contains(text(),'Gtpl Bank')]

Verify_success_login
    Element Should Be Visible       //h2[contains(text(),'Gtpl Bank')]


