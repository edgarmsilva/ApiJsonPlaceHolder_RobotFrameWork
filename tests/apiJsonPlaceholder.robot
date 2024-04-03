*** Settings ***
Resource     ../Api/apiJsonPlaceholder.robot
Resource    ../steps/apiJsonPlaceholder_steps.robot

Test Setup      Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com     verify=true


***Test Cases***

Scenario: Validate if the emails in the comments are properly formatted
   Given that I search for the username "Delphine"
   When I use the id fetched to search for the posts written by the user
   Then I validate if the emails in the comment section are in the proper format

Scenario: Validate the username search by an inexistent user
   When I search for a inexistent username "inexistentUser"
   Then I receive an empty body response

Scenario: Validate the post search by an inexistent user id

   When I use an inexistent user id to search for the posts
   Then I receive an empty body response

Scenario: Validate the post comment search by an inexistent post id
   [Tags]     teste
   When I use an inexistent post id to search for the posts comments
   Then I receive an empty body response