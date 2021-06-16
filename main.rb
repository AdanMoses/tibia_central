     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'httparty'

enable :sessions

require_relative 'db/db'

require_relative 'models/user'
require_relative 'models/post'

require_relative 'controllers/users_controller'
require_relative 'controllers/session_controller'
require_relative 'controllers/posts_controller'

require_relative 'helpers/session.rb'

get '/' do

  if is_logged_in?
    redirect '/posts'
  end

  erb :index, layout: :layout
end
