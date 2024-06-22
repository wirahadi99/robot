*** Settings ***
Library    RequestsLibrary
Library    Collections   
Resource   /Users/wiraproject/Documents/automation/Robot/Resource/get-single-user-steps.robot
Resource   /Users/wiraproject/Documents/automation/Robot/Resource/post-create-user.robot

*** Test Cases ***
GET SINGLE USER
    Given I am hit api get single user
    When I want to check the response data
    Then First name should be Janet
    Then Last name should be Weaver
    And Email should be janet.weaver@reqres.in

Register New User
    Given I want to register a new user
    When I sent a request
    Then I verify the response  