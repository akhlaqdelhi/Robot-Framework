*** Settings ***
Library         SeleniumLibrary
Library         ${CURDIR}}../../../LMS_UI/globals.py

*** Variables ***
${txt_username}     //input[@id='login-form-username']
${txt_password}     //input[@id='login-form-password']
${btn_login}    //input[@id='login']
${btn_create}    //a[@id='create_link']


*** Keywords ***

Jira login
    [Documentation]    login to jira portal
       ${chrome options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${prefs}  Create Dictionary
    ...  download.default_directory=${CURDIR}\\dataFiles\\Download
    Call Method  ${chrome options}  add_experimental_option  prefs  ${prefs}
    Create Webdriver  Chrome  chrome_options=${chrome options}
    Go To       ${url_pinejira}
    maximize browser window
    Enter credentials


Enter credentials
    [Documentation]    enter the username and password, and verify login is successful
    Wait Until Element Is Visible        ${txt_username}     30s
    Input Text      ${txt_username}     ${username}
    Input Text      ${txt_password}     ${password_cypher}
    Wait Until Element Is Visible        ${btn_login}     10s
    Click Element    ${btn_login}
    Wait Until Element Is Visible       ${btn_create}      30       dashboard Page is not displayed
    Page Should Contain Element     ${btn_create}
    Sleep    1s


