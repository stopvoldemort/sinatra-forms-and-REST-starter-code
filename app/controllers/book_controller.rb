class BookController < Sinatra::Base
  set :views, 'app/views/book'


  get '/books' do
    @books = Book.all
    erb :'index.html'
  end

  get '/books/new' do
    erb :'new.html'
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'show.html'
  end

  patch '/books/:id' do
    @book = Book.find(params[:id])
    @book.update(title: params[:title], snippet: params[:snippet])
    erb :'show.html'
  end



  post '/books' do
    Book.create(title: params[:title], snippet: params[:snippet])
    @books = Book.all
    erb :'index.html'
  end

  get '/books/:id/edit' do
    @book = Book.find(params[:id])
    erb :'edit.html'
  end


  delete '/books/:id' do
    Book.destroy(params[:id])
    @books = Book.all
    erb :'index.html'
  end




end
