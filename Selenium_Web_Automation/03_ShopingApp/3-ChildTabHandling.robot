*** Settings ***
Library    SeleniumLibrary

Suite Teardown    Close Browser


*** Test Cases ***
TC_Do action on Child Window
    [Tags]    UI0301
    click link to child window
    Switch_and_verify_child wondow is_opend
#    Do_some_action_on_Child_window


*** Keywords ***
click link to child window
    Create Webdriver    Firefox
    Maximize Browser Window
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    Click Element    //a[@class='blinkingText']


Switch_and_verify_child wondow is_opend
    Switch Window    NEW
    Wait Until Element Is Visible       //h1[contains(text(),'Documents request')]
    Element Should Be Visible    //h1[contains(text(),'Documents request')]


Do_some_action_on_Child_window