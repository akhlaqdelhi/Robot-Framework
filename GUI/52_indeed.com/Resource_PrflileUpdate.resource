*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    Dialogs
Resource    ../../Resources/GlobalKeywords.resource

*** Variables ***
${portal_url}       https://in.indeed.com/
${el_btn_login}     //div[contains(@class, 'gnav-header-')]/a[text()='Sign in']
${el_txt_username}     id:ifl-InputFormField-3

#   verify if this exist than verify you are a human
${el_verify_human}   //div[@id='challenge-body-text' and text()='in.indeed.com needs to review the security of your connection before proceeding.']
#   Continue element
#//button[@type='submit']/span[text()='Continue']

${el_last_update}     //div[@class='user-details-inner fixed']/div[@class='other-info-wrapper']/p
${profile_url}     https://www.naukri.com/mnjuser/homepage
${el_txt_password}     xpath://form[@name='login-form']/div[@class='form-row']/input[@placeholder='Enter your password']
${el_btn_submit_login}     xpath://form[@name='login-form']//button[@class='btn-primary loginButton']
${el_link_view_profile}     link:View profile
${el_image_profile}     xpath://div[@class='img-wrapper col s2 center']/div[@class='photoTrigger']/img
${file_path_resume}     C:\\Users\\akhlaq.ahmed\\OneDrive\\Desktop\\Resume-Akhlaq_Ahmed.docx

*** Keywords ***
login_to_job_portal
    Create Webdriver    Firefox
    Maximize Browser Window
    Go To    ${portal_url}
    Verify_you_are_human
#    Wait Until Element Is Enabled        ${el_btn_login}
#    Click Element    ${el_btn_login}
#    Wait Until Element Is Enabled        ${el_txt_username}
#    ${username}      Get_field_from_config      id_username
#    ${password}      Get_field_from_config       id_password
#    Input Text    ${el_txt_username}        ${username}[0]
#    Input Password    ${el_txt_password}        ${password}[0]
#    Click Button    ${el_btn_submit_login}
#    Wait Until Element Is Enabled       ${el_link_view_profile}
#    Element Should Be Enabled    ${el_link_view_profile}
#    Capture Element Screenshot      ${el_link_view_profile}     filename=EMBED


navigate_edit_profile
    Click Element    ${el_link_view_profile}
    Wait Until Element Is Visible    ${el_image_profile}
    Element Should Be Visible    ${el_image_profile}
    Capture Page Screenshot     filename=ScreenShot_edit_prfile_{index}.png

update_profile_and_resume
    Choose File     id:attachCV     ${file_path_resume}
    Sleep    3s


Verify_profiled_successfully
    Reload Page
    ${curr_date}        Get Current Date    time_zone=local  result_format=%b %d, %Y
    Wait Until Element Is Visible    xpath://div[@class='attachCV']//div[@class='cvPreview']//div[@class='updateOn typ-14Regular']
    Element Text Should Be    xpath://div[@class='attachCV']//div[@class='cvPreview']//div[@class='updateOn typ-14Regular']     Uploaded on ${curr_date}
    Capture Page Screenshot     filename=ScreenShot_edit_prfile_{index}.png


Verify_you_are_human
    [Documentation]    This keyword will handle verify human page will tackle to do it
#    Todo this needs to comlete later
    Wait Until Element Is Visible    ${el_verify_human}
    Sleep    10s
    Mouse Over    ${el_verify_human}
    Sleep    1100ms
    Log    ok we are landed on a verify screen
    Wait Until Element Is Visible    xpath://input[@type='checkbox']        timeout=20s
    Mouse Over    xpath://input[@type='checkbox']
    Sleep    1500ms
    Mouse Down    xpath://input[@type='checkbox']
    Sleep    1000ms
    Mouse Up    xpath://input[@type='checkbox']
    Sleep    3s
    Pause Execution
    Sleep    60s