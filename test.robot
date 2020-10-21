*Settings
Resource        configs/${CONFIG_FILE}
Resource        variables/variables.robot
Resource        variables/errors.robot
Library         REST                                ${BOOK_SERVICE_URL}

*Variables
${ID}=          aeab040f-d2b0-47f7-b346-61be3ec19d6a

*Test Cases
# GET book sample 1
#     GET                 kph/api/book/${ID}
#     Output Schema       response body