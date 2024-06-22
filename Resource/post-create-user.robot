*** Settings ***
Library        RequestsLibrary
Library        Collections
Variables      variable.py  # Import your variables correctly

*** Keywords ***
I want to register a new user    
    &{payload} =    Create Dictionary    name=Gouda    job=QA Engineer
    ${json_payload} =    Evaluate    json.dumps($payload)    json
    Set Suite Variable    ${json_payload}

I sent a request 
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response} =    POST    url=${base_url}${create_user}    data=${json_payload}    headers=${headers}
    Set Suite Variable    ${response}

I verify the response
    Status Should Be    201    ${response}  
    ${response_json} =    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json['name']}    Gouda   
    Should Be Equal As Strings    ${response_json['job']}    QA Engineer 
