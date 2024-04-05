*** Settings ***

########################################################################
##    Libraries for the project    ##
## #####################################################################


*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     String

Resource    ./api/kws_api.robot
Resource    ./keywords/kws_apiJsonPlaceholder.robot

*** Variables ***
${BASE_URI}       https://jsonplaceholder.typicode.com 
