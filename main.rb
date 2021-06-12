     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'httparty'

enable :sessions

require_relative 'db/db'
require_relative 'models/user'
require_relative 'helpers/session.rb'
require_relative 'controllers/users_controller'


get '/' do
  erb :index, layout: :layout
end
