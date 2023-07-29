*** Keywords ***
doWelcome
    [Documentation]    this is a sample keyword to be callled from actual robot feture file
    Log To Console    \n You are most welcome here


CallPerson
    [Documentation]    This Keyword accept 2 arguments
    [Arguments]    ${personName}        ${personCity}
    Log To Console    \n Hi Mr. ${personName} You are from ${personCity}

NumberSum
    [Documentation]    This Keyword accept 2 arguments
    [Arguments]    ${num1}        ${num2}
    ${sum}      Evaluate    ${num1}+${num2}
    Log To Console    \n sum of number is ${sum}
    [Return]        ${sum}