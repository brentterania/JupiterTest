*** Settings ***
Library    SeleniumLibrary    timeout=60
Resource    ../Resources/SourceFile.robot

*** Keywords ***
Verify Selected Products Are Displayed In The Cart
    [Arguments]    @{expected_cart_items}
    @{actual_cart_items}    _Get All Cart Items
    Lists Should Be Equal    ${expected_cart_items}    ${actual_cart_items}    

Verify Product Price Is Correct
    [Arguments]    ${item_name}    ${expected_price}
    ${cart_items}    Cart Items Locator
    Wait Until Element Is Visible    ${cart_items}
    ${total_items}    Get Element Count    ${cart_items}
    :FOR    ${i}    IN RANGE    1    ${total_items} + 1
    \    ${item_name_locator}    Cart Name Locator    ${i}
    \    ${current_item_name}    Get Text    ${item_name_locator}
    \    Continue For Loop If    "${item_name}" != "${current_item_name}"
    \    ${item_price_locator}    Price Locator    ${i}
    \    ${current_item_price}    Get Text    ${item_price_locator}
    \    Should Be Equal    ${expected_price}    ${current_item_price}
    \    Exit For Loop
    \    
Verify Product Sub Total Is Correct
    [Arguments]    ${item_name}
    ${cart_items}    Cart Items Locator
    Wait Until Element Is Visible    ${cart_items}
    ${total_items}    Get Element Count    ${cart_items}
    :FOR    ${i}    IN RANGE    1    ${total_items} + 1
    \    ${item_name_locator}    Cart Name Locator    ${i}
    \    ${current_item_name}    Get Text    ${item_name_locator}
    \    Continue For Loop If    "${item_name}" != "${current_item_name}"
    \    ${price_locator}    Price Locator    ${i}
    \    ${quantity_locator}    Quantity Locator    ${i}
    \    ${sub_total_locator}    Sub Total Locator    ${i}
    \    ${price}    Get Text    ${price_locator}
    \    ${quantity}    Get Value    ${quantity_locator}
    \    ${computed_sub_total}    Compute Sub Total    ${price}    ${quantity}    currency=$
    \    ${current_sub_total}    Get Text    ${sub_total_locator}
    \    Should Be Equal    ${computed_sub_total}    ${current_sub_total}
    \    ${computed_sub_total}    Remove Non Numeric    ${computed_sub_total}
    \    Set Test Variable    ${${item_name}_computed_sub_total}    ${computed_sub_total}
    \    Exit For Loop
    
Verify Subtotal Is Equal To Total
    [Arguments]    ${is_computed}=True    ${expected_amount}=${EMPTY}    @{product_names}
    ${expected_subtotal}    Run Keyword If    ${is_computed}    _Compute Sub Total For Selected Product In Cart    @{product_names}    ELSE    Set Variable    ${expected_amount} 
    ${total_locator}    Total Locator
    ${total_amount}    Get Text    ${total_locator}
    ${total_amount}    Remove Non Numeric    ${total_amount}
    Should Be Equal    float(${expected_subtotal})    float(${total_amount}) 

_Compute Sub Total For Selected Product In Cart
    [Arguments]    @{product_names}
    ${computed_sub_total}    Set Variable    0
    :FOR    ${product_name}    IN    @{product_names}
    \    ${computed_sub_total}    Evaluate    ${computed_sub_total} + ${${product_name}_computed_sub_total}
    [Return]    ${computed_sub_total}
    
_Get All Cart Items
    ${cart_items_list}    Create List
    ${cart_items}    Cart Items Locator
    Wait Until Element Is Visible    ${cart_items}   
    ${total_items}    Get Element Count    ${cart_items}
    :FOR    ${i}    IN RANGE    1    ${total_items} + 1
    \    ${item_name_locator}    Cart Name Locator    ${i}
    \    ${item_name}    Get Text    ${item_name_locator}
    \    Append To List    ${cart_items_list}    ${item_name}
    [Return]    ${cart_items_list}