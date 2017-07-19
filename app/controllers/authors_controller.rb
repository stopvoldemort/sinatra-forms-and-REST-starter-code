class AuthorsController < ApplicationController

  get '/authors' do
    @authors = Author.all

    erb :'authors/index.html'
  end

end
