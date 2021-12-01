*** Settings ***
Library    SeleniumLibrary    timeout=60
Library    BuiltIn
Library    Collections
Library    JSONLibrary
Library    OperatingSystem
Library    ShopPageElements
Library    CartPageElements
Resource    ../Jupiter_Pages/BasePage.robot
Resource    ../Jupiter_Pages/CartPage.robot
Resource    ../Jupiter_Pages/ContactPage.robot
Resource    ../Jupiter_Pages/HomePage.robot
Resource    ../Jupiter_Pages/ShopPage.robot
Resource    ../CustLibrary/ContactPageElements.py
Resource    ../CustLibrary/CartPageElements.py
Resource    ../CustLibrary/GetTestData.py
Resource    ../CustLibrary/ShopPageElements.py
Resource    ../DataSet/GetData.robot