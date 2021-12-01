*** Settings ***
Resource    ../Resources/SourceFile.robot


Test Setup    Navigate To Homepage    ${base_url}
Test Teardown    Close Browser

*** Test Cases ***       
Test Case 1: Verify That Mandatory Fields Return Errors When Value Is Blank
    [Tags]    Priority1
    Get Contact Test Data    TestCase1
    Click Contact
    Click Submit Button
    Verify Error Message For Forname Is Displayed    Forename is required
    Verify Error Message For Email Is Displayed    Email is required
    Verify Error Message For Message Is Displayed    Message is required
    Populate Contact Page    ${Forename}    ${Email}    ${Message}
    Verify Error Message For Forname Is No Longer Displayed 
    Verify Error Message For Email Is No Longer Displayed
    Verify Error Message For Message Is No Longer Displayed
    
Test Case 2: Verify User Can Send Feedback Successfully
    [Tags]    Priority2
    Verify User Can Send Feedback X Times Successfully    5

*** Keywords ***
Verify User Can Send Feedback X Times Successfully
    [Arguments]    ${x_times}
    :FOR  ${i}  IN RANGE    ${x_times}
    \    Get Contact Test Data    TestCase2    ${i}
    \    Click Contact
    \    Populate Contact Page    ${Forename}    ${Email}    ${Message}    wait_sending_feedback_popup=True
    \    Verify Submission Message    Thanks ${Forename}, we appreciate your feedback.
    \    Click Back
    