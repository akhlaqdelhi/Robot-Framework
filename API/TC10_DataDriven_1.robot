*** Settings ***
Library     DataDriver      ${CURDIR}//data//JiraTaskLog.xlsx       sheet_name=Sheet1

Test Template       Do repeated work

*** Test Cases ***
Log the work in Jira ${SRCNo}_${Date}_${Time}_${DurationInMinutes}_${Comments}
    [Tags]      Case1010

*** Keywords ***
Do repeated work
    [Arguments]           ${SRCNo}	     ${Date} 	    ${Time}	      ${DurationInMinutes}	      ${Comments}
    Log Many         ${SRCNo}	        ${Date}     	${Time}	      ${DurationInMinutes}	        ${Comments}

