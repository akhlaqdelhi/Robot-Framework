*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource    TC07B_GlobalVariables.resource

*** Variables ***
@{num}=                    one    two    three
@{Name}=        Ahmed        Samad       Abdul

*** Test Cases ***
TC_working with list <Set List Value>,<Log List>,<Get Length>
    [Tags]  TC0701
    Log   {Name}= ${Name}
    Set List Value    ${Name}    -1    Khaliq   # to set a value at last index position
    Log   {Name}= ${Name}
    Log List    ${Name}     #Log the length and show list item also
    ${len}=  Get Length    ${Name}
    Log   length of {Name} list is ${len}

TC_List iterate values
    [Tags]      TC0706
    @{numbers}      Create List
    Append To List  ${numbers}      102     234        231     890
    Log  list contains values= ${numbers}
    FOR     ${val}     IN      @{numbers}
        Log     {val}= ${val}
    END

TC_List Assertions
    [Tags]  TC0703
    @{numbers}      Create List
    Append To List  ${numbers}  six  seven
    Log     {numbers}= ${numbers}
    List Should Not Contain Value    ${numbers}    ten
    # to check whether a value exist in List or not
    ${idx1}=  Get Index From List    ${numbers}     six
    IF  ${idx1}==-1
        Log    Value not found in List variable
    ELSE
        Log    This value exist in List value
    END

Reuse the testCase witjout rewriting
    [Tags]  TC0704
    Log To Console    we are going to call another Action as keyword
    keyword_Append_to_list
    Log To Console    Here goes new code in this test case

Accessing global variable defined elsewhere
    [Tags]  TC0705
    Log    value in global variable(Anoher testcase file)= ${COMPANY}
    Set Global Variable     ${COMPANY}       PINE Academy
    Log     New value in {COMPANY} variable= ${COMPANY}

*** Keywords ***
keyword_Append_to_list
    Append To List    ${num}  Four  Five        #Append the values at end
    Log To Console    Now {LIST} contains= ${num}
