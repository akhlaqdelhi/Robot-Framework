*** Settings ***
Library     SeleniumLibrary
Library         DataDriver      ./Resources/documentNumberVerify.xlsx     sheet_name=Sheet1


Test Setup    Login_jira
Test Template       Log_jira_work


*** Test Cases ***
Jira login
    [Tags]      JR01



*** Keywords ***
Login_jira
    Open Browser    https://jira.pinelabs.com/    chrome
    Maximize Browser Window
    Input Text    //input[@name="os_username"]    akhlaq.ahmed
    Input Text    //input[@name="os_password"]    bismI10-1444
    Click Element    xpath=(//div[@class="field-group"])[9]
    Click Element    //input[@name="login"]
    Sleep    5s

Log_jira_work
    Wait Until Element Is Visible    //input[@name="searchString"]      10s
    Input Text    //input[@name="searchString"]    SCR-42927
    Press Keys      //input[@name="searchString"]       RETURN
    Sleep    2s
    Wait Until Element Is Visible    //a[@id="opsbar-operations_more"]     10s
    Click Link    //a[@id="opsbar-operations_more"]
    Wait Until Element Is Visible    //span[@class='trigger-label'][normalize-space()='Log work']     10s
    Click Element    //span[@class='trigger-label'][normalize-space()='Log work']
    Wait Until Element Is Visible    //input[@name="timeLogged"]     10s
    Input Text    //input[@name="timeLogged"]    12m
    Click Element    xpath=(//div[@class="field-group"])[2]
    Input Text    //input[@name="startDate"]    27/Aug/2022 10:00 AM
#    Select Frame        //iframe[@id="mce_0_ifr"]
#    Input Text      //iframe[@id='mce_7_ifr']       Its my word
    Click Element           //button[normalize-space()='Text']
    Input Text      //fieldset//textarea[@id='comment']      Its my world
    Click Element    //input[@name="Log"]
