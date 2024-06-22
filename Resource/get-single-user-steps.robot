*** Settings ***
Library    RequestsLibrary
Library    Collections   
Variables  variable.py

*** Keywords ***
I am hit api get single user 
    ${response} =    GET  ${base_url}${single_user}  expected_status=200
    Set Suite Variable    ${response}

I want to check the response data
    ${resJson} =    Set Variable    ${response.json()}  
    Set Suite Variable    ${resJson}

First name should be Janet
    Should Be Equal    ${resJson['data']['first_name']}    Janet

Last name should be Weaver
    Should Be Equal    ${resJson['data']['last_name']}    Weaver

Email should be janet.weaver@reqres.in
    Should Be Equal    ${resJson['data']['email']}    janet.weaver@reqres.in