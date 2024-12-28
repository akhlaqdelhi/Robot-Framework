*** Settings ***
Resource    Page_Login.robot
Suite Teardown    Close Browser

*** Variables ***
${theme}    //span[@title='Light mode']



*** Test Cases ***
Login to Portal
    Open LoginPage
    Set Username    ${userName}
    Set Password    ${passWord}
    Click Loginbtn
    Sleep    10s