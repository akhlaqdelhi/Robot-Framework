*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_url}  https://rahulshettyacademy.com/loginpagePractise/
${userType}     user       # valid values are ==  admin, user
${userProfile}      Consultant     # valid values are == Student, Teacher, Consultant

*** Test Cases ***
Login to portal and handle browser child tab
    [Tags]    UISA0201
    fill_login_form
    Sleep    9s


*** Keywords ***
fill_login_form
    Create Webdriver    Chrome
    Go To    ${loginurl}
    Maximize Browser Window
    Input Text    id:username  rahulshettyacademy
    Input Password    id:password  learning
    Wait Until Element Is Enabled    xpath://input[@id='usertype' and @value='${userType}']
    Click Element    xpath://input[@id='usertype' and @value='${userType}']       # click on User radiobutton
    IF  "${userType}" == "user"
        Wait Until Element Is Enabled    id:okayBtn
        Capture Page Screenshot    Screenshot-{index}.png
    Click Button    id:okayBtn
    END
    Select From List By Label  //select[@class='form-control']  ${userProfile}
    Select Checkbox    id:terms
    Capture Page Screenshot    Screenshot-{index}.png
    Click Element    id:signInBtn
    Wait Until Element Is Visible    //a[@class='navbar-brand' and contains(text(), 'ProtoCommerce Home')]
    Element Should Be Visible    //a[@class='navbar-brand' and contains(text(), 'ProtoCommerce Home')]
    Capture Page Screenshot    Screenshot-{index}.png
