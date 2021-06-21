def create_message(userid, message)
  run_sql("INSERT INTO posts(userid, message) VALUES($1, $2);", [userid, message])
end

def get_posts()
  run_sql("SELECT * FROM posts ORDER BY postid DESC;")
end

def delete_post(postid)
  run_sql("DELETE FROM posts WHERE postid=#{postid};")
end

def select_post(postid)
  run_sql("SELECT * FROM posts WHERE postid = #{postid}")
end