*** Settings ***
Resource     ../resources/base.robot

Test Setup    setupApi

***Test Cases***

Scenario: Validate if the emails in the comments are properly formatted
   [Tags]     EmailFormats
   Given that I search for the username "Delphine"
   When I use the id fetched to search for the posts written by the user
   Then I validate if the emails in the comment section are in the proper format

Scenario: Validate the username search by an inexistent user
   [Tags]     inexistentUser
   When I search for a inexistent username "inexistentUser"
   Then I receive an empty body response

Scenario: Validate the post search by an inexistent user id
    [Tags]     inexistent User id
   When I use an inexistent user id to search for the posts
   Then I receive an empty body response

Scenario: Validate the post comment search by an inexistent post id
   [Tags]     inexistent post id
   When I use an inexistent post id to search for the posts comments
   Then I receive an empty body response