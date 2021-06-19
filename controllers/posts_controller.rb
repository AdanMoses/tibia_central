get '/posts' do

  posts = get_posts()

  erb :'posts/index', locals: {posts: posts, response: response}
end

get '/posts/new' do
  erb :'posts/new'
end

post '/posts' do
  message = params[:message]
  userid = session[:user_id]
  create_message(userid, message)

  redirect '/posts'
end

delete '/posts/:postid' do |postid|
  delete_post(postid)

  redirect '/posts'
end

get '/posts/:postid' do |postid|
  
  post = select_post(postid)
  
  binding.irb

  erb :'posts/show', layout: :layout

end