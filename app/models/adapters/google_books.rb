require 'rest-client'
require 'json'

module GoogleBooks

  class Adapter

    BASE_URL = "https://www.googleapis.com/books/v1/volumes?q=subject:"

    attr_reader :subject

    def initialize(subject="fiction")
      @subject = subject
    end

    def fetch_books
      books = JSON.parse(RestClient.get(subject_url))

      books['items'].each do |item|
        book = Book.new
        book.title = item["volumeInfo"]["title"]

        book.snippet = item["volumeInfo"]["description"]

        if item['volumeInfo']['authors']
          author = item['volumeInfo']['authors'].first
        else
          author = 'No Author'
        end

        first_name = author.split(" ").first
        last_name = author.split(" ").last

        book.author = Author.find_or_create_by(
        first_name: first_name,
        last_name: last_name
        )

        book.save
      end
    end

    private

    def subject_url(max_results = 40)
      "#{BASE_URL}#{subject}&maxResults=#{max_results}"
    end


  end
end
