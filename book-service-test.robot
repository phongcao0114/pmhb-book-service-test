*Settings
# Library                   String
# Library                   Collections
# Library                   RequestsLibrary
Library                     REST                                       localhost:8080

*Variables
${header}                   {"Content-Type":"application/json"}

${book_name}                SampleBook
${author}                   Nick

${req_body}                 {"name":"${book_name}","author":"${author}"}
${req_body_missing_name}    {"name":"","author":"${author}"}
${req_body_missing_author}  {"name":"${book_name}","author":""}

${err_missing_name}         name is missing
${err_missing_author}       author is missing


*Test Cases
Insert Book - Missing Name
    POST                    /kph/api/book                              ${req_body_missing_name}                    headers=${header}       # this creates a new instance
    Integer                 response status                            200
    Output                  response body error
    String                  response body error original_error_str      ${err_missing_name}   

Insert Book - Missing Author
    POST                    /kph/api/book                              ${req_body_missing_author}                  headers=${header}
    Integer                 response status                            200
    Output                  response body error
    String                  response body error original_error_str      ${err_missing_author}    

Insert Book - Success
    POST                    /kph/api/book                               ${req_body}                                 headers=${header}       # this creates a new instance
    Integer                 response status                             200
    ${id}=                  String                                      response body
    Set Global Variable     ${id} 

Get Book - Success
    GET                     /kph/api/book/${id}[0]                      headers=${header}  
    Output                  response
    Integer                 response status                             200
    String                  response body name                          ${book_name}
    String                  response body author                        ${author}

Delete Book - Success
    DELETE                  /kph/api/book/${id}[0]                      headers=${header} 
    Output                  response 
    Integer                 response status                             200
  

