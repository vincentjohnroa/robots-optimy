*** Settings ***
Library     Selenium2Library
Library    String
Resource    optimy_login_page_constants.robot

*** Keywords ***
Open Optimy Login Page
    [Arguments]    ${p_browser}    #choices are chrome, firefox and ie
    Open Browser    ${LOGIN_PAGE_URL}    ${p_browser}

User Is In Optimy Login Page
    Location Should Contain    ${LOGIN_PAGE_URL}
    Element Should Be Visible    ${LOGIN_FORM}

User Inputs Random Email And Password
    ${t_randomEmail} =     Generate Random String    4    [LETTERS]
    ${t_randomPassword} =    Generate Random String    4    [LETTERS][NUMBERS]
    Input Text    ${LOGIN_EMAIL_INPUT_FIELD}    ${t_randomEmail}@gmail.com
    Input Text    ${LOGIN_PASSWORD_INPUT_FIELD}    ${t_randomPassword}
    
User Inputs Email Login Credential
    [Arguments]    ${p_email}
    Input Text    ${LOGIN_EMAIL_INPUT_FIELD}    ${p_email}

User Inputs Password Login Credential
    [Arguments]    ${p_password}
    Input Text    ${LOGIN_PASSWORD_INPUT_FIELD}    ${p_password}

User Clicks Element
    [Arguments]    ${p_element}
    Wait Until Page Contains Element    ${p_element}
    Wait Until Element Is Visible    ${p_element}
    Click Element    ${p_element}

Email Inline Error Message Should Be Visible
    [Arguments]    ${p_errorMessage}
    Element Should Contain    ${EMAIL_INLINE_ERROR}    ${p_errorMessage}

Password Inline Error Message Should Be Visible
    [Arguments]    ${p_errorMessage}
    Element Should Contain    ${PASSWORD_INLINE_ERROR}    ${p_errorMessage}

User Inputs Recovery Email Login Credential
    [Arguments]    ${p_email}
    Wait Until Page Contains Element    ${RECOVERY_EMAIL_INPUT_FIELD}
    Wait Until Element Is Visible    ${RECOVERY_EMAIL_INPUT_FIELD}
    Input Text    ${RECOVERY_EMAIL_INPUT_FIELD}    ${p_email}

Invalid Account Error Should Be Visible
    [Arguments]    ${p_errorMessage}
    Wait Until Page Contains Element    ${INVALID_CREDENTIALS_ERROR}
    Wait Until Element Is Visible    ${INVALID_CREDENTIALS_ERROR}    20sec
    Element Should Contain    ${INVALID_CREDENTIALS_ERROR}    ${p_errorMessage}

Recovery Email Inline Error Message Should Be Visible
    [Arguments]    ${p_errorMessage}
    Element Should Contain    ${LOST_PASSWORD_INLINE_ERROR}    ${p_errorMessage}
