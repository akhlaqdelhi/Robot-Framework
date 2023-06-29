*** Settings ***
Library    DateTime
Resource    Resource_PrflileUpdate.resource
Suite Teardown    Close Browser

*** Test Cases ***
TC_Update Profile at naukri.com website
    [Documentation]    this testcases is usefull to update the profle at naukri.com website
    [Tags]      NK0101
    login_to_job_portal
    navigate_edit_profile
    update_profile_and_resume
    Verify_profiled_successfully
    Sleep    10s

