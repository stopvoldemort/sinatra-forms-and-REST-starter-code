require_relative './config/environment'

use Rack::MethodOverride
use BooksController
use AuthorsController
run ApplicationController
