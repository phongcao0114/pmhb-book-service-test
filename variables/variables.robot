*Variables
${header}                   {"Content-Type":"application/json"}

${book_name}                SampleBook
${author}                   Nick

${req_body}                 {"name":"${book_name}","author":"${author}"}
${req_body_missing_name}    {"name":"","author":"${author}"}
${req_body_missing_author}  {"name":"${book_name}","author":""}