require 'sinatra/base'
require_relative 'lib/string_formatter'

class App < Sinatra::Base
  get '/' do
    slim :index
  end

  get '/automaton/:rule' do
    @string = StringFormatter.new(rule: params[:rule]).call

    slim :automaton
  end
end
