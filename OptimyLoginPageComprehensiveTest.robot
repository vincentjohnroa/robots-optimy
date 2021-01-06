*** Settings ***
Documentation    [OPTIMY:LOGIN] This test suite will test the negative scenarios for logging in Optimy.
Default Tags    OptimyLoginPageComprehensiveTest
Suite Setup    Open Optimy Login Page    chrome
Suite Teardown    Close All Browsers
Resource    optimy_login_page_keywords.robot

*** Test Cases ***
Failed To Login With Empty Login Credentials
    Given User Is In Optimy Login Page
    When User Clicks Element    ${LOGIN_BUTTON}
    Then Email Inline Error Message Should Be Visible    This field is required.
    Then Password Inline Error Message Should Be Visible    This field is required.

Failed To Login With Invalid Email Input Without Password
    Given User Is In Optimy Login Page
    When User Inputs Email Login Credential    abc@@gmail.com
    And User Clicks Element    ${LOGIN_BUTTON}
    Then Email Inline Error Message Should Be Visible    Please enter a valid email address (e.g.: john.smith@gmail.com).
    And Password Inline Error Message Should Be Visible    This field is required.

Failed To Login With Random Password Input Without Email
    Given User Is In Optimy Login Page
    When User Inputs Password Login Credential    abc123x@
    Then Email Inline Error Message Should Be Visible    Please enter a valid email address (e.g.: john.smith@gmail.com).

Failed To Login With Incorrect Credentials
    Given User Is In Optimy Login Page
    When User Inputs Random Email And Password
    And User Clicks Element    ${LOGIN_BUTTON}
    Then Invalid Account Error Should Be Visible    The email address or password is incorrect.

Failed To Login Due To Locked Account Credentials
    Given User Is In Optimy Login Page
    When User Inputs Login Credentials Until It Is Locked    abc@gmail.com    abcdes
    Then Locked Account Error Should Be Visible    This account has been locked due to too many failed login attempts.

Failed To Recover Login Credentials With Invalid Email
    Given User Is In Optimy Login Page
    When User Clicks Element    ${LOST_PASSWORD_BUTTON}
    And User Clicks Element    ${RECOVER_MY_ACCESS_BUTTON}
    Then Recovery Email Inline Error Message Should Be Visible    This field is required.
    When User Inputs Recovery Email Login Credential    abc@@gmail.com
    Then Recovery Email Inline Error Message Should Be Visible    Please enter a valid email address (e.g.: john.smith@gmail.com).
