*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_url}  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
fill_login_form
    [Arguments]    ${uType}  ${uProfile}
    Log Many    ${uType}  ${uProfile}
    Create Webdriver    Chrome
    Go To    ${loginurl}
    Maximize Browser Window
    Input Text    id:username  rahulshettyacademy
    Input Password    id:password  learning
    Log    looking for this element== xpath://input[@id='usertype' and @value='${uType}']
    Wait Until Element Is Enabled    xpath://input[@id='usertype' and @value='${uType}']
    Click Element    xpath://input[@id='usertype' and @value='${uType}']       # click on User radiobutton
    IF  "${uType}" == "user"
        Wait Until Element Is Enabled    id:okayBtn
        Capture Page Screenshot    Screenshot-{index}.png
    Click Button    id:okayBtn
    END
    Select From List By Label  //select[@class='form-control']  ${uProfile}
    Select Checkbox    id:terms
    Capture Page Screenshot    Screenshot-{index}.png
    Click Element    id:signInBtn

Verify_success_lgin
    Wait Until Element Is Visible    //a[@class='navbar-brand' and contains(text(), 'ProtoCommerce Home')]
    Element Should Be Visible    //a[@class='navbar-brand' and contains(text(), 'ProtoCommerce Home')]
    Capture Page Screenshot    Screenshot-{index}.png
