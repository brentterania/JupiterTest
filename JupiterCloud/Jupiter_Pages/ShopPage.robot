*** Settings ***
Library    SeleniumLibrary    timeout=60
Resource    ../Resources/SourceFile.robot

*** Keywords ***
Add To Cart
    [Arguments]    ${product_name}    ${times}=1
    ${product_id}    _Get Product ID Based On Product Name    ${product_name}
    :FOR    ${i}    IN RANGE    0    ${times}
    \    ${buy_locator}    Buy Locator    ${product_id}
    \    Click Element    ${buy_locator}
    
_Get Product ID Based On Product Name
    [Arguments]    ${product_name}
    ${all_products}    All Products Locator
    Wait Until Element Is Visible    ${all_products}    
    ${total_products}    Get Element Count    ${all_products}
    :FOR    ${i}    IN RANGE    1    ${total_products}
    \    ${product_name_locator}    Product Name Locator    product-${i}
    \    ${current_product_name}    Get Text    ${product_name_locator}
    \    Continue For Loop If    "${product_name}" != "${current_product_name}"
    \    ${product_id}    Set Variable    product-${i}
    \    Exit For Loop
    [Return]    ${product_id}
    