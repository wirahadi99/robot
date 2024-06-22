*** Settings ***
Library    SeleniumLibrary
Resource   /Users/wiraproject/Documents/automation/Robot/Resource/checkout-steps.robot

*** Test Cases ***
Successful checkout with a backpack
    Given I am logged in to Saucedemo
    And I have added a backpack to my cart

    When I navigate to the cart
    And I click Checkout

    Then I am on the checkout information page
    When I enter my valid first name, last name, and postal code
    And I click Continue

    Then I am on the checkout overview page
    And I click Finish

    Then I am on the checkout complete page
    And I see a confirmation message "Thank you for your order!"
    
    