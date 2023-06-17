
*** Settings ***
Resource        TC05B_keywords.resource

*** Test Cases ***
Test case:: call a reusable piece of code defined in keyword
    [Tags]    TC04_01
    doWelcome

Test Case:: call a keyword that accep arguments
    [Tags]    TC04_02
    ${name}     Set Local Variable    Akhlaq Ahmed
    ${city}     Set Local Variable    New Delhi
    CallPerson    ${name}    ${city}

Test Case:: call a keyword that can return a result
    [Tags]    TC04_03
    ${n1}     Set Variable    ${125}
    ${n2}     Set Variable    ${325}
#    Log To Console    \n sum== Evaluate ${n1}+${n2}
    ${result}     NumberSum    ${n1}    ${n2}
    Log    sum of two numbers == ${result}
