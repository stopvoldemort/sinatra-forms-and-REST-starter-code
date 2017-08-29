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

        book.save
      end
    end

    private

    def subject_url(max_results = 40)
      "#{BASE_URL}#{subject}&maxResults=#{max_results}"
    end


  end
end
