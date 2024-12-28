*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ele_bk_store}    //h5[contains(text(),'Book Store Application')]
${ele_bk_icon}    //body[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[6]/div[1]/div[2]/svg[1]/path[1]



*** Test Cases ***
TC_ Navigate to portal
    [Documentation]    goto the designated sites
    [Tags]    GUI0102
    Open Browser    https://demoqa.com/      chrome
    Maximize Browser Window
    Scroll Element Into View  xpath:${ele_bk_store}
    Wait Until Element Is Visible  ${ele_bk_store}    20s
    Wait Until Element Is Enabled    ${ele_bk_store}    20s
    Sleep    5s
    Click Element    //iframe[@id='google_ads_iframe_/21849154601,22343295815/Ad.Plus-Anchor_0']
#                        //iframe[@id='google_ads_iframe_/21849154601,22343295815/Ad.Plus-Anchor_0']
    Sleep    10s

    Click Element    xpath:${ele_bk_icon}
#    Click Link    Text Box
#    Input Text    tagname:input     Akhlaq Ahmed
    Sleep    50s
