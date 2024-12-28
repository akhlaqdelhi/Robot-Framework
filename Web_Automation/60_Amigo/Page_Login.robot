*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${usernameLocator}                 id=username
${passwordLocator}                 id=password
${forgotyourpasswordLocator}       link=Forgot your password?
${loginbtnLocator}                 id=loginbtn
${baseUrl}    https://amigo.amityonline.com/login/index.php
${userName}    akhlaq@amityonline.com
${passWord}    itN0@#23ae
#thanks to github
*** Keywords ***
Open LoginPage
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To    ${baseUrl}
    Wait Until Element Is Visible    ${usernameLocator}

Set Username
    [Arguments]  ${usernameValue}
    [Documentation]  Set Username INPUT element value
    Wait Until Element Is Enabled    ${usernameLocator}
    Input Text  ${usernameLocator}  ${usernameValue}

Set Password
    [Arguments]  ${passwordValue}
    [Documentation]  Set Password INPUT element value
    Wait Until Element Is Enabled    ${passwordLocator}
    Input Text  ${passwordLocator}  ${passwordValue}

Click Forgotyourpassword
    [Documentation]  Click on the Forgotyourpassword A element
    Wait Until Element Is Enabled    ${forgotyourpasswordLocator}
    Click Element  ${forgotyourpasswordLocator}

Click Loginbtn
    [Documentation]  Click on the Loginbtn BUTTON element
    Wait Until Element Is Enabled    ${loginbtnLocator}
    Click Element  ${loginbtnLocator}