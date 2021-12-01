*** Settings ***
Library    SeleniumLibrary    timeout=60
Resource    ../Resources/SourceFile.robot

*** Keywords ***
Navigate To Homepage
    [Arguments]    ${url}    ${browser}=chrome
    Open Browser    ${url}    ${browser}
    Maximize Browser Window