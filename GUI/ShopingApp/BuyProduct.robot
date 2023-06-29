*** Settings ***
Library    SeleniumLibrary

#Test Teardown    Close Browser

*** Variables ***
${webURL}       https://rahulshettyacademy.com/angularpractice/shop
#${el_product_list}       //*/app-card-list/app-card
${el_product_list}       //*/h4[@class='card-title']/a

*** Test Cases ***
TC_buy a product from page-- blackberry mobile
    [Tags]    UI0201
#    Open Browser    ${webURL}
    Create Webdriver    Firefox
    Maximize Browser Window
    Go To    ${webURL}
    select_item  Samsung Note 8


*** Keywords ***
select_item
    [Arguments]    ${itemName}
    Wait Until Element Is Visible    ${el_product_list}
    @{element_list}  Get Webelements    ${el_product_list}
    ${index}=  Set Variable    1
    FOR    ${element}  IN  @{element_list}
        Log    element value is -- ${element.text}
        Exit For Loop If    '${element.text}' == '${itemName}'
        ${index}  Evaluate     ${index}+1
    END
    Log    item found at index no - ${index}
    Click Button    (//div[@class='card-footer'])[${index}]/button
