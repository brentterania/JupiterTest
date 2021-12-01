*** Settings ***
Library    SeleniumLibrary    timeout=60
Resource    ../Resources/SourceFile.robot


*** Variables ***
${base_url}    https://jupiter.cloud.planittesting.com/
${contact_link}    //a[contains(text(),"Contact")]
${shop_link}    //a[contains(text(),"Shop")]
${car_link}    //a[contains(text(),"Cart")]

*** Keywords ***
Click Contact
    Click Element    ${contact_link}
    
Click Shop
    Click Element    ${shop_link}
    
Click Cart
    Click Element    ${car_link}
    