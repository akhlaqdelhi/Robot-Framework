*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC_got to portal
    [Documentation]    goto the designated sites
    [Tags]    GUI0102
    Open Browser    https://demoqa.com/      chrome
#    Scroll Element Into View  xpath://body[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/svg[1]/path[1]
##    Wait Until Element Is Visible  //body[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/svg[1]/path[1]
#    Click Element    xpath://body[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/svg[1]/path[1]
#    Click Link    Text Box
#    Input Text    tagname:input     Akhlaq Ahmed
    Sleep    50s
