class BooksController < ApplicationController

  get '/books' do
    @books = Book.all

    erb :'books/index.html'
  end

  post '/books' do
    binding.pry
    book = Book.new(title: params['book']['title'], snippet: params['book']['snippet'], author_id: params['book']['author_id'])
    book.save

    redirect to "/books/#{book.id}"
  end

  get '/books/new' do
    @authors = Author.all.order(:first_name)
    erb :'books/new.html'
  end

  get '/books/:id' do
    @book = Book.find(params[:id])

    erb :'books/show.html'
  end

end
