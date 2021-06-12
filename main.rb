     
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

enable :sessions

require_relative 'db/db'


get '/' do
  erb :index
end
