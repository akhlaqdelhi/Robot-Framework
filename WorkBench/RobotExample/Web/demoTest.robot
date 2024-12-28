*** Settings ***
Library    SeleniumLibrary
Suite Teardown    End_Testing

*** Variables ***
${username}  standard_user
${password}  secret_sauce
${browser}      firefox     # chrome, firefox
${baseurl}      https://www.saucedemo.com/

*** Test Cases ***
TestCase: Login to site
    [Documentation]    this testcase is about login to sites
    [Tags]    GUI0101
    log_portal
    Verify_success_login
    Sleep    13s

*** Keywords ***
log_portal
        open browser        ${baseurl}          ${browser}
        Input Text    //input[@id='user-name']      ${username}
        Input Password      css:#password       ${password}
        Click Button    id:login-button

End_Testing
    Close Browser

Verify_success_login
    Element Should Be Visible  //button[@id='react-burger-menu-btn']
