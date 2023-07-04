*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser

*** Variables ***
${webURL}       https://rahulshettyacademy.com/angularpractice/shop
${el_product_list}       //*/h4[@class='card-title']/a

*** Test Cases ***
TC_buy a product from page-- blackberry mobile
    [Tags]    UI0201
    #   @{list_items}   Create List    iphone X     Samsung Note 8      Nokia Edge      Blackberry
    @{list_items}  Create List  iphone X  Samsung Note 8
    navigate_shoping_portal
    select_item  ${list_items}
    proceed_checkout

*** Keywords ***
navigate_shoping_portal
    Create Webdriver    Firefox
    Maximize Browser Window
    Go To    ${webURL}

select_item
    [Arguments]    ${items}
    Wait Until Element Is Visible    ${el_product_list}
    FOR    ${item}      IN      @{items}
        Log    ProductName== ${item}
        @{element_list}  Get Webelements    ${el_product_list}
        ${index}=  Set Variable    1
        FOR    ${element}  IN  @{element_list}
            Log    element value is -- ${element.text}
            Exit For Loop If    '${element.text}' == '${item}'
            ${index}  Evaluate     ${index}+1
        END
        Log    item found at index no - ${index}
        Click Button    (//div[@class='card-footer'])[${index}]/button
    END
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png

proceed_checkout
    Click Element    //a[@class='nav-link btn btn-primary']
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Click Element    //button[@class='btn btn-success']
    Input Text    id:country        Saharanpur
    Sleep    3s
    Click Element    xpath://input[@value='Purchase']
    Element Should Contain  //div[@class='alert alert-success alert-dismissible']  Your order will be delivered in next few weeks
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Sleep    3s
