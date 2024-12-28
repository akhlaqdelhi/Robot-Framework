*** Settings ***
Library    Browser

*** Variables ***
${baseUrl}    https://demo.guru99.com/test/newtours/
${userName}    
${Password}    

*** Test Cases ***
Register a User
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${baseUrl}
#    Get Title      ==    Browser
    Sleep    5 seconds
#    Fill Text    //tbody/tr[2]/td[2]/input[1]    mngr509573
#    Fill Text    //input[@name="password"]    asfd
#    Click    //input[@name="submit"]
    Close Browser

