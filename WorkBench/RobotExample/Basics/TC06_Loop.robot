*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${baseurl}      https://lmstest.pinelabs.com
@{ROBOTS}=      Bender    Johnny5    Terminator    Robocop

${STRING}=                  cat
${NUMBER}=                  ${1}
@{LIST}=                    one    two    three
&{DICTIONARY}=              string=${STRING}    number=${NUMBER}    list=@{LIST}


*** Test Cases ***

Loop over a list of items and log each of them
    [Tags]  TC0601
    FOR    ${robot}    IN    @{ROBOTS}
        Log    ${robot}
        Log To Console   ${robot}

    END

Loop fixed no of iteration
    [Tags]  TC0602
    FOR  ${i}  IN  RANGE 1  10
        Log To Console    value= ${i}
    END

Break out of the for loop on condition
    [Tags]  TC0603
    FOR    ${robot}    IN    @{ROBOTS}
        IF    $robot == 'Johnny5'    BREAK
        Log    ${robot}
    END

Execute a for loop only three times (skipping one iteration)
    [Tags]  TC0604
    FOR    ${robot}    IN    @{ROBOTS}
        IF    $robot == 'Terminator'    CONTINUE
        Log    ${robot}
    END

Loop a list
    [Tags]  TC0605
    Log    ${LIST}    # ['one', 'two', 'three']
    FOR    ${item}    IN    @{LIST}
        Log    ${item}    # one, two, three
    END
    FOR    ${item}    IN    one    two    three
        Log    ${item}    # one, two, three
    END

Loop a dictionary
    [Tags]  TC0606
    Log    ${DICTIONARY}
    # {'string': 'cat', 'number': 1, 'list': ['one', 'two', 'three']}
    FOR    ${key_value_tuple}    IN    &{DICTIONARY}
        Log    ${key_value_tuple}
        # ('string', 'cat'), ('number', 1), ('list', ['one', 'two', 'three'])
    END
    FOR    ${key}    IN    @{DICTIONARY}
        Log    ${key}=${DICTIONARY}[${key}]
        # string=cat, number=1, list=['one', 'two', 'three']
    END

Loop a range from 0 to end index
    [Tags]  TC0607
    FOR    ${index}    IN RANGE    10
        Log    ${index}    # 0-9
    END

Loop a range from start to end index
    [Tags]  TC0608
    FOR    ${index}    IN RANGE    1    10
        Log    ${index}    # 1-9
    END

Loop a range from start to end index with steps
    [Tags]  TC0609
    FOR    ${index}    IN RANGE    0    10    2
        Log    ${index}    # 0, 2, 4, 6, 8
    END

WHILE: A simple while loop using the default loop limit
    [Tags]  TC0610
    WHILE    True    limit=10
        Log    Executed until the loop limit (10) is hit.
    END

WHILE: Loop while condition evaluates to True or the default loop limit is hit
    [Tags]  TC0611
    ${x}=    Set Variable    ${0}
    WHILE    ${x} < 3
        Log    Executed as long as the condition is True.
        ${x}=    Evaluate    ${x} + 1
    END

WHILE: Skip a loop iteration with CONTINUE
    [Tags]  TC0612
    ${x}=    Set Variable    ${0}
    WHILE    ${x} < 3
        ${x}=    Evaluate    ${x} + 1
        IF    ${x} == 2    CONTINUE    # Skip this iteration.
        Log    x = ${x}    # x = 1, x = 3
    END


WHILE: Exit loop with BREAK
    [Tags]  TC0613
    WHILE    True
        BREAK
        Log    This will not be logged.
    END
    IF    "cat" == "cat" and "dog" == "dog"
        Log    This line IS executed.
    END

    IF    "pan" == "pan" or "man" == "man"
        Log    This line IS executed.
    END
