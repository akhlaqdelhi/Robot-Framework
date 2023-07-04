*** Settings ***
Library    SeleniumLibrary
Resource    2-Resource_loginPage.resource

*** Variables ***
${userType}     user       # valid values are ==  admin, user
${userProfile}      Consultant     # valid values are == Student, Teacher, Consultant

*** Test Cases ***
Login to portal and handle browser child tab
    [Tags]    UI030201
    fill_login_form  ${userType}  ${userProfile}
    Verify_success_lgin
