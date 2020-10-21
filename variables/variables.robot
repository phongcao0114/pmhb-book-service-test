*Variables
${header}                   {"Content-Type":"application/json"}

${book_name}                SampleBook
${new_book_name}            NewBook
${author}                   Nick
${new_author}               John

${req_body}                 {"name":"${book_name}","author":"${author}"}
${req_body_missing_name}    {"author":"${author}"}
${req_body_missing_author}  {"name":"${book_name}"}
${req_body_update_name}     {"name":"${new_book_name}"}
${req_body_update_author}   {"author":"${new_author}"}
${req_body_update}          {"name":"${new_book_name}","author":"${new_author}"}