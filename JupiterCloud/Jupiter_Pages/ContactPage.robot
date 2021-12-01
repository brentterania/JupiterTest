*** Settings ***
Library    SeleniumLibrary    timeout=60
Resource    ../Resources/SourceFile.robot

*** Variables ***
${back_button}    //a[contains(text(),"Back")]

*** Keywords ***
Click Element
    [Documentation]    Overriding Click Element of Selenium
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    
    SeleniumLibrary.Click Element    ${locator}
    
Click Back
    Click Element    ${back_button}
          
Input Text
    [Documentation]    Overriding Input Text of Selenium
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    
    SeleniumLibrary.Input Text   ${locator}    ${text}
    
Wait Until Sending Feedback Popup Disappeared
    ${sending_feeback_locator}    Sending Feedback Popup
    Wait Until Element Is Not Visible    ${sending_feeback_locator}
    
Populate Contact Page
    [Arguments]    ${forename}    ${email}    ${message}    ${surname}=${EMPTY}    ${telephone}=${EMPTY}    ${wait_sending_feedback_popup}=False
    Enter Value To Forename    ${forename}
    Run Keyword If    "${surname}" != "${EMPTY}"    Enter Value To Surname    ${surname}
    Enter Value To Email    ${email}
    Run Keyword If    "${telephone}" != "${EMPTY}"    Enter Value To Telephone    ${telephone}
    Enter Value To Message    ${message}
    Click Submit Button
    Run Keyword If    ${wait_sending_feedback_popup}    Wait Until Sending Feedback Popup Disappeared
    
Click Submit Button
    ${submit_locator}    Submit Locator
    Wait Until Element Is Visible    ${submit_locator}    
    Click Element    ${submit_locator}    
    
Enter Value To Forename
    [Arguments]    ${forename}
    ${forname_locator}    Forename Locator
    Input Text    ${forname_locator}    ${forename}    
    
Enter Value To Surname
    [Arguments]    ${surname}
    ${surname_locator}    Surname Locator
    Input Text    ${surname_locator}    ${surname}  
       
Enter Value To Email
    [Arguments]    ${email}
    ${email_locator}    Email Locator
    Input Text    ${email_locator}    ${email}  
       
Enter Value To Telephone
    [Arguments]    ${telephone}
    ${telephone_locator}    Telephone Locator
    Input Text    ${telephone_locator}    ${telephone}  
       
Enter Value To Message
    [Arguments]    ${message}
    ${message_locator}    Message Locator
    Input Text    ${message_locator}    ${message}

Verify Submission Message
    [Arguments]    ${expected_message}
    ${submission_message_locator}    Submission Message Locator
    ${actual_message}    Get Text    ${submission_message_locator}
    Should Be Equal    ${expected_message}    ${actual_message}    
       
Verify Error Message For Forname Is Displayed
    [Arguments]    ${expected_error}
    ${forname_error_locator}    Forname Error Locator
    ${actual_error}    Get Text    ${forname_error_locator}
    Should Be Equal    ${expected_error}    ${actual_error}    

Verify Error Message For Email Is Displayed
    [Arguments]    ${expected_error}
    ${email_error_locator}    Email Error Locator
    ${actual_error}    Get Text    ${email_error_locator}
    Should Be Equal    ${expected_error}    ${actual_error}    
    
Verify Error Message For Message Is Displayed
    [Arguments]    ${expected_error}
    ${message_error_locator}    Message Error Locator
    ${actual_error}    Get Text    ${message_error_locator}
    Should Be Equal    ${expected_error}    ${actual_error}
    
Verify Error Message For Forname Is No Longer Displayed
    [Arguments]    ${message}=FAIL: Forname still displayed in the contact page.
    ${forname_error_locator}    Forname Error Locator
    Element Should Not Be Visible    ${forname_error_locator}    ${message}
    
Verify Error Message For Email Is No Longer Displayed
    [Arguments]    ${message}=FAIL: Email still displayed in the contact page.
    ${email_error_locator}    Email Error Locator
    Element Should Not Be Visible    ${email_error_locator}    ${message}
    
Verify Error Message For Message Is No Longer Displayed
    [Arguments]    ${message}=FAIL: Message still displayed in the contact page.
    ${message_error_locator}    Email Error Locator
    Element Should Not Be Visible    ${message_error_locator}    ${message}