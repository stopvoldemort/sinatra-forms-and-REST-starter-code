## Sinatra

### Deliverables

As a site visitor, I should be able to see a list of authors
1. Does my schema have to change?
2. What routes do i need?
get '/authors' index

As a site visitor, I should be able to see a list of books. I should be able to click on each book title to see more information about that book.
get '/books'
get '/books/:id'

As a site visitor, I should be able to see a form where I create a book. When I create a book I can associate it with an existing author.
1. Does my schema have to change?
2. What routes do i need?

#show me the form route
get '/books/new'

#create a new resource
 post '/books'
