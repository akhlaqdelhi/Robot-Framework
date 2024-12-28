
*** Settings ***
Library     RequestsLibrary
Library     Collections
Library    SeleniumLibrary
#\LMS_Automation\GlobalKeyword.robot
#\LMS_Automation\LMS_UI\WorkBench\RobotExample\TC11_KeepAlive.robot
Resource        ${Current}../../../GlobalKeywords.robot

*** Variables ***
${baseurl}      https://lmstest.pinelabs.com
${txt_username}     //input[@id='username']
${browser}      Chrome
${driver_path}

*** Test Cases ***

Keep Alive
    [Tags]    TC_11
    Log    Hello there
    ${driver_path}=      GET_DRIVER_PATH        ${browser}
    open browser        ${base_url}          ${browser}      executable_path=${driver_path}
    Press Key    ${txt_username}        ALTER


