*** Settings ***


Resource     ../base.robot

*** Keywords ***

that I search for the username "${user}"
    ${response}=    GetUser ${user}
    Set Test Variable    ${response}

I use the id fetched to search for the posts written by the user
    ${id}=   set Variable     ${response}[0][id]
    ${allPosts}=    GetUserPosts ${id}
    Set Test Variable    ${allPosts}
    
I validate if the emails in the comment section are in the proper format
    Get post Coments emails ${allPosts}

I search for a inexistent username "${inexistentUser}"
    ${response}=      GetUserInexistentUser ${inexistentUser}
    Set Test Variable    ${response}

I receive an empty body response
    ${size}=     Get Length    ${response.json()}
    Should Be Equal As Numbers    ${size}    0

I use an inexistent user id to search for the posts
    ${response}=    GetUserPosts ${99999}
    Set Test Variable    ${response}

I use an inexistent post id to search for the posts comments
    ${response}=    Get post Coments ${999999}
    Set Test Variable    ${response}