*** Settings ***
Library     DataDriver      ${CURDIR}//data//TestData.xlsx       sheet_name=Sheet1
Test Template       Do repeated work

*** Test Cases ***
Log the work in Jira ${empId}__${name}
    [Tags]      Case1010

*** Keywords ***
Do repeated work
    [Arguments]           ${empId} 	${name}	 ${mobile} 	${email} 	${city}
    Log Many        ${empId} 	${name}	 ${mobile} 	${email} 	${city}


