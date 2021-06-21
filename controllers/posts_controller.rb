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

delete '/posts/:id' do |id|

  delete_post(id)

  redirect '/posts'
end

get '/posts/:id' do |id|
  
  post = select_post(id)
  post_info = post[0]

  erb :'posts/show', layout: :layout, locals: {post_info: post_info}

end

put '/post/:id' do |id|

  message = params[:message]

  sql_query = ("UPDATE posts SET message = $1 WHERE postid = $2")
  params = [message, id]
  run_sql(sql_query, params)

  redirect "/posts/#{id}"

end

get '/posts/:id/edit' do |id|
  
  post = select_post(id)
  post_info = post[0]

  erb :'/planet/edit', layout: :main_layout, locals: {post_info: post_info}
end