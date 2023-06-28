*** Settings ***
Library    SeleniumLibrary
Resource    GlobalVaribles.resource

*** Variables ***
${name}     mngr509573
${password}     YsetenU

*** Keywords ***
Create_Customer
    Click Link    New Customer
    Input Text    name:name      ${name}
    Input Password    name:password     ${password}
    Click Button    name:btnLogin
    Wait Until Element Is Visible       //h2[contains(text(),'Gtpl Bank')]

Verify_success_login
    Element Should Be Visible       //h2[contains(text(),'Gtpl Bank')]


