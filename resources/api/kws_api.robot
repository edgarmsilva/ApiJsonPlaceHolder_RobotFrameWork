*** Settings ***
Resource     ../../resources/base.robot

*** Keywords ***
setupApi
    Create Session    jsonplaceholder    ${BASE_URI}    verify=true

GetUser ${user}
    ${response}=    GET On Session    jsonplaceholder    /users?username\=${user}
    Should Be Equal As Numbers    ${response.status_code}    200
    RETURN    ${response.json()}

GetUserInexistentUser ${user}
    ${response}=    GET On Session    jsonplaceholder    /users?username\=${user}
    RETURN    ${response}

GetUserPosts ${userId}
    ${allPosts}=    GET On Session    jsonplaceholder    /posts?userId\=${userId}

    # validate if all posts bellongs to the user
    FOR    ${post}    IN    @{allPosts.json()}
        Should Be Equal As Strings    ${post}[userId]    ${userId}
    END

    RETURN    ${allPosts}

Get post Coments ${postId}
    ${response}=    GET On Session    jsonplaceholder    /comments?postId\=${postId}

    FOR    ${eachComent}    IN    @{response.json()}
        # Log To Console    :::::::::::::::::::::${eachComent}[email]
        ${result}=    Get Regexp Matches    ${eachComent}[email]    ^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$
        IF    not ${result}
            Log To Console  WARNING!! The Email ${eachComent}[email] From comment ID No. ${postId} is not a valid Email..."
        END
    END

    RETURN    ${response}
