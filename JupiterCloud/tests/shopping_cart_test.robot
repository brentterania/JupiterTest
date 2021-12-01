*** Settings ***
Resource    ../Resources/SourceFile.robot

Test Setup    Navigate To Homepage    ${base_url}
Test Teardown    Close Browser

*** Test Cases ***  
Test Case 3: Verify That Selected Products Are Recorded In The Cart
    [Tags]    Priority2
    Get Test Data For Shopping Cart    TestCase3    FunnyCow    FluffyBunny
    Click Shop
    Add To Cart    ${FunnyCow_ProductName}    ${FunnyCow_Quantity}
    Add To Cart    ${FluffyBunny_ProductName}    ${FluffyBunny_Quantity}
    Click Cart
    Verify Selected Products Are Displayed In The Cart    Funny Cow    Fluffy Bunny
    
Test Case 4: Verify That Selected Products Are Computed Correctly In The Cart
    [Tags]    Priority1
    Get Test Data For Shopping Cart    TestCase4    StuffedFrog    FluffyBunny    ValentineBear
    Click Shop
    Add To Cart    ${StuffedFrog_ProductName}    ${StuffedFrog_Quantity}
    Add To Cart    ${FluffyBunny_ProductName}    ${FluffyBunny_Quantity}
    Add To Cart    ${ValentineBear_ProductName}    ${ValentineBear_Quantity}
    Click Cart
    Verify Product Price Is Correct    ${StuffedFrog_ProductName}    ${StuffedFrog_Price}
    Verify Product Sub Total Is Correct    ${StuffedFrog_ProductName}
    Verify Product Price Is Correct    ${FluffyBunny_ProductName}    ${FluffyBunny_Price}
    Verify Product Sub Total Is Correct    ${FluffyBunny_ProductName}
    Verify Product Price Is Correct    ${ValentineBear_ProductName}    ${ValentineBear_Price}
    Verify Product Sub Total Is Correct    ${ValentineBear_ProductName}
    Verify Subtotal Is Equal To Total    True    ${EMPTY}    StuffedFrog    FluffyBunny    ValentineBear
    Verify Subtotal Is Equal To Total    False    116.9
    
*** Keywords **
Get Test Data For Shopping Cart
    [Arguments]    ${identifier}    @{product_names}
    :FOR    ${product}    IN    @{product_names}
    \    Get Shopping Cart Test Data    ${identifier}    ${product}