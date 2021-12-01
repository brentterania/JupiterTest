*** Settings ***
Resource    ../Resources/SourceFile.robot

*** Keywords ***
Get Test Data
    [Arguments]    ${identifier}    ${test_data_name}    ${json_directory}=${CURDIR}
    ${test_data}    Get File    ${json_directory}/${test_data_name}.json    encoding=iso-8859-1   encoding_errors=strict
    ${test_data}    Convert To String     ${test_data}
    ${test_data}    Convert String To Json    ${test_data}
    [Return]    ${test_data}

Get Contact Test Data
    [Arguments]    ${identifier}    ${index}=0    ${test_data_name}=contact_test_data
    ${test_data}    Get Test Data    ${identifier}    ${test_data_name}
    ${forename}    Get Value From Json    ${test_data}    $.${identifier}[${index}].forename
    ${email}    Get Value From Json    ${test_data}    $.${identifier}[${index}].email
    ${message}    Get Value From Json    ${test_data}    $.${identifier}[${index}].message
    Set Test Variable    ${Forename}    ${forename[0]}
    Set Test Variable    ${Email}    ${email[0]}
    Set Test Variable    ${Message}    ${message[0]}
    
Get Shopping Cart Test Data
    [Arguments]    ${identifier}    ${product_identifier}    ${test_data_name}=shopping_cart_test_data
    ${test_data}    Get Test Data    ${identifier}    ${test_data_name}
    ${product_name}    Get Value From Json    ${test_data}    $.${identifier}.${product_identifier}.name
    ${price}    Get Value From Json    ${test_data}    $.${identifier}.${product_identifier}.price
    ${quantity}    Get Value From Json    ${test_data}    $.${identifier}.${product_identifier}.quantity
    Set Test Variable    ${${product_identifier}_ProductName}    ${product_name[0]}
    Set Test Variable    ${${product_identifier}_Price}    ${price[0]}
    Set Test Variable    ${${product_identifier}_Quantity}    ${quantity[0]}