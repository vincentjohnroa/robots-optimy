*** Settings ***
Library     SeleniumLibrary
Library    String
Resource    optimy_login_page_constants.robot

*** Keywords ***
### SETUP KEYWORDS ###
Open Optimy Login Page
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${LOGIN_PAGE_URL}

### PRE-REQUISITE\GIVEN KEYWORDS ###
User Is In Optimy Login Page
    Location Should Contain    ${LOGIN_PAGE_URL}
    Element Should Be Visible    ${LOGIN_FORM}


### ACTION\WHEN KEYWORDS ###
User Clicks Element
    [Arguments]    ${p_element}
    Wait Until Page Contains Element    ${p_element}
    Wait Until Element Is Visible    ${p_element}
    Click Element    ${p_element}

User Inputs Email Login Credential
    [Arguments]    ${p_email}
    Input Text    ${LOGIN_EMAIL_INPUT_FIELD}    ${p_email}

User Inputs Login Credentials Until It Is Locked
    [Arguments]    ${p_email}    ${p_password}
    FOR    ${iteration}    IN RANGE    7 
    \    Input Text    ${LOGIN_EMAIL_INPUT_FIELD}    ${p_email}
    \    Input Text    ${LOGIN_PASSWORD_INPUT_FIELD}    ${p_password}
    \    Click Element    ${LOGIN_BUTTON}
    \    ${t_lockedErrorMessage} =    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${LOCKED_ACCOUNT_INLINE_ERROR}    20sec
    \    Exit For Loop If    ${t_lockedErrorMessage}
    Should Be True    ${t_lockedErrorMessage}    msg= Locked account error message did not display after ${iteration} tries.

User Inputs Password Login Credential
    [Arguments]    ${p_password}
    Input Text    ${LOGIN_PASSWORD_INPUT_FIELD}    ${p_password}

User Inputs Random Email And Password
    ${t_randomEmail} =     Generate Random String    4    [LETTERS]
    ${t_randomPassword} =    Generate Random String    4    [LETTERS][NUMBERS]
    Input Text    ${LOGIN_EMAIL_INPUT_FIELD}    ${t_randomEmail}@gmail.com
    Input Text    ${LOGIN_PASSWORD_INPUT_FIELD}    ${t_randomPassword}

User Inputs Recovery Email Login Credential
    [Arguments]    ${p_email}
    Wait Until Page Contains Element    ${RECOVERY_EMAIL_INPUT_FIELD}
    Wait Until Element Is Visible    ${RECOVERY_EMAIL_INPUT_FIELD}
    Input Text    ${RECOVERY_EMAIL_INPUT_FIELD}    ${p_email}


### ASSERTION\THEN KEYWORDS ###
Email Inline Error Message Should Be Visible
    [Arguments]    ${p_errorMessage}
    Element Should Contain    ${EMAIL_INLINE_ERROR}    ${p_errorMessage}

Invalid Account Error Should Be Visible
    [Arguments]    ${p_errorMessage}
    Wait Until Page Contains Element    ${INVALID_CREDENTIALS_ERROR}
    Wait Until Element Is Visible    ${INVALID_CREDENTIALS_ERROR}    20sec
    Element Should Contain    ${INVALID_CREDENTIALS_ERROR}    ${p_errorMessage}

Locked Account Error Should Be Visible
    [Arguments]    ${p_errorMessage}
    Wait Until Page Contains Element    ${LOCKED_ACCOUNT_INLINE_ERROR}
    Wait Until Element Is Visible    ${LOCKED_ACCOUNT_INLINE_ERROR}    20sec
    Element Should Contain    ${LOCKED_ACCOUNT_INLINE_ERROR}    ${p_errorMessage}

Password Inline Error Message Should Be Visible
    [Arguments]    ${p_errorMessage}
    Element Should Contain    ${PASSWORD_INLINE_ERROR}    ${p_errorMessage}

Recovery Email Inline Error Message Should Be Visible
    [Arguments]    ${p_errorMessage}
    Element Should Contain    ${LOST_PASSWORD_INLINE_ERROR}    ${p_errorMessage}
