*** Settings ***
Library                                         SeleniumLibrary

*** Variables ***
${browser}                                      chrome
${url}                                          https://www.saucedemo.com/
${valid_username}                               standard_user
${valid_password}                               secret_sauce

*** Keywords ***
Launch browser to Login page
    comment                                     I am launching google
    open browser                                ${url}  ${browser}
    Maximize Browser Window

Login page is displayed
    Title Should Be                             Swag Labs

Input username and password
  [Arguments]                                   ${username}  ${password}
  Input text                                    css:input#user-name  ${username}
  Input password                                css:input#password  ${password}

Products page is displayed
    Page Should Contain                         Products

Click login button
    Click Button                                css:[value='LOGIN']

Error message is displayed
    Page Should Contain                         Epic sadface: Username and password do not match any user in this service

Close all browsers
    close browser