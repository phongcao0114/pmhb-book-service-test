*Settings
# Library                   String
# Library                   Collections
# Library                   RequestsLibrary
Resource                    configs/${CONFIG_FILE}
Resource                    variables/variables.robot
Resource                    variables/errors.robot
Library                     REST                                       ${BOOK_SERVICE_URL}

*Test Cases
Insert Book - Missing Name              
    POST                    /kph/api/book                              ${req_body_missing_name}                    headers=${header}        # Create a new instance
    Integer                 response status                            200                                                                  # Check if repsonse status is 200 OK
    Output                  response body error                                                                                             # Print reponse error
    String                  response body error original_error_str      ${err_missing_name}                                                 # Check if response error is as same as expected error

Insert Book - Missing Author
    POST                    /kph/api/book                              ${req_body_missing_author}                  headers=${header}       
    Integer                 response status                            200
    Output                  response body error
    String                  response body error original_error_str      ${err_missing_author}    

Insert Book - Success
    POST                    /kph/api/book                               ${req_body}                                 headers=${header}       
    Integer                 response status                             200
    ${id}=                  String                                      response body                                                       # Create a varibale names 'id' contains the value which retuned from "Insert Book' api
    Set Global Variable     ${id}                                                                                                           # Set variable 'id' global to re-use in other test cases

Get Book - Success
    GET                     /kph/api/book/${id}[0]                      headers=${header}  
    Output                  response
    Integer                 response status                             200
    String                  response body name                          ${book_name}                                                        # Check if response book name is as same as expected book name
    String                  response body author                        ${author}                                                           # Check if response book author is as same as expected book author

Delete Book - Success
    DELETE                  /kph/api/book/${id}[0]                      headers=${header} 
    Output                  response 
    Integer                 response status                             200
  

