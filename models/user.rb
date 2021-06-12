require 'bcrypt'

def create_user(character_name, email, password)
  password_digest = BCrypt::Password.create(password)

  sql_query = ("INSERT INTO users(character_name, email, password_digest) VALUES($1, $2, $3);")
  params = [character_name, email, password_digest]
  run_sql(sql_query, params)

end

def character_information(userID)
  user_id = userID
  sql_query = ("SELECT character_name FROM users WHERE userid = #{user_id}")
  run_sql(sql_query)

end