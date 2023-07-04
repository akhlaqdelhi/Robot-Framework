*** Settings ***
Library    SeleniumLibrary
Resource    2-Resource_loginPage.resource
Test Template    parameterize_login
Suite Teardown    Close Browser

*** Variables ***
#${userType}     user       # valid values are ==  admin, user
#${userProfile}      Consultant     # valid values are == Student, Teacher, Consultant

*** Test Cases ***      userType     userProfile
TC_parameterize_login1  admin  Student
TC_parameterize_login2      admin       Teacher
TC_parameterize_login3      admin       Consultant
TC_parameterize_login4      user       Student
TC_parameterize_login5      user       Teacher
TC_parameterize_login6      user       Consultant



*** Keywords ***
parameterize_login
    [Arguments]    ${userType}  ${userProfile}
    fill_login_form  ${userType}  ${userProfile}
    Verify_success_lgin
