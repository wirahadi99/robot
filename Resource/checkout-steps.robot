*** Settings ***
Library    SeleniumLibrary
Variables  variable.py

*** Keywords ***
I am logged in to Saucedemo
    Open Browser      ${sauceDemoUrl}     chrome
    Title Should Be   Swag Labs
    Input Text        ${userNameId}       standard_user  
    Input Password    ${passwordId}       secret_sauce
    Click Button      ${buttonId}
    Wait Until Element Is Visible    id:inventory_container


I have added a backpack to my cart
    Click Button    ${addToCartId}
 
I navigate to the cart
    Click Link    ${checkoutPageLink}
    Wait Until Page Contains Element    ${checkoutButton}

I click Checkout
    Click Button    ${checkoutButton}

I am on the checkout information page
     Wait Until Page Contains    Checkout: Your Information

I enter my valid first name, last name, and postal code
    Input Text    ${firstNameField}    Minamoto
    Input Text    ${lastNameField}     Shizuka
    Input Text    ${postalCodeField}    54551

I click Continue
    Click Button  ${continueButton}

I am on the checkout overview page
    Wait Until Page Contains    Checkout: Overview

I click Finish
    Click Button    ${finishButton}

I am on the checkout complete page
    Wait Until Page Contains    Checkout: Complete!

I see a confirmation message "Thank you for your order!"
    Page Should Contain    Thank you for your order!
