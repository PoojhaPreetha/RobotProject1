*** Settings ***
Library    SeleniumLibrary    


Suite Setup    Log    I am inside Test Suite setup
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Test Teardown                

Default Tags    sanity

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log    Hello World...  
    
MySecondTest
    Log    Hello India... 
    Set Tags    regression1
    Remove Tags    regression1
    
MyThirdTest
    Log    Hello Poojha...  
    
MyFourthTest
    Log    Hello Preetha...  
FirstSeleniumTest
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text      name=q                Automation Step by Step
    Press Keys    name=q    ENTER
    # Click Button    name=btnK   
    Sleep    2    
    Close Browser
    Log    Test Completed    
    
SampleLoginTest
    [Documentation]    This is a Sample login test   
    Open Browser    ${url}    chrome
    Set Browser Implicit Wait    5
    Loginkeyword
    Click Element    id=welcome    
    Click Element    link=Logout 
    Close Browser 
    Log    Test Completed    
    Log    This test was completed by %{username} on %{os}    
    
*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/
@{username}    Admin    admin123
&{login}    username=Admin    password=admin123

*** Keywords ***
Loginkeyword
    Input Text      id=txtUsername    @{username}[0]
    Input Password    id=txtPassword    &{login}[password]    
    Click Button    id=btnLogin