require 'sinatra'

class App < Sinatra::Base
  get '/' do
    'Hello Nanobox!'
  end
end
