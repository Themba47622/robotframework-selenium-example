*** Settings ***
Library                                         SeleniumLibrary
Resource                                        ../Resources/Common.robot

Test Setup                                      Launch browser to Login page
Test Teardown                                   Close all browsers

*** Test Cases ***
Login with Valid credentials
    [documentation]                             Log into saucedemo.com using valid credentials
    [tags]                                      positive

    Login page is displayed
    Input username and password                 ${valid_username}  ${valid_password}
    Click login button
    Products page is displayed

Login with Invalid credentials
    [documentation]                             Log into saucedemo.com using invalid credentials
    [tags]                                      negative

    Login page is displayed
    Input username and password                 ${valid_username}  x0x0
    Click login button
    Error message is displayed