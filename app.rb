require 'sinatra/base'
require_relative 'lib/string_formatter'

class App < Sinatra::Base
  get '/' do
    slim :index
  end
end
