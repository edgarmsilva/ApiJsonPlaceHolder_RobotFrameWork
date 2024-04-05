# Api jsonplaceholder Test Automation 
Automation Made by Edgar Silva

Date: April, 2024

Description:

This Automation was created from scratch using Robot FrameWork for test the provided APÌ in  https://jsonplaceholder.typicode.com/

It have automated tests running with github actions on each pull request on the main branch

## Requirements:
- Python
- Robot Framework

### The scope of this automation is: 
* Validate if the emails in the comments are properly formatted
* Validate the username search by an inexistent user
* Validate the post search by an inexistent user id
* Validate the post comment search by an inexistent post id

### installation:
run the command bellow to install all requirements:

```
pip install -r requirements.txt
```

### Execution:
To run all tests from command console:
```
robot -d ./results features
```

### Report Page:
After the test job finishes, a report page will be available ate the address below:

https://edgarmsilva.github.io/ApiJsonPlaceHolder_RobotFrameWork/