require 'bcrypt'

def create_user(character_name, email, password)
  password_digest = BCrypt::Password.create(password)

  sql_query = ("INSERT INTO users(character_name, email, password_digest) VALUES($1, $2, $3);")
  params = [character_name, email, password_digest]
  run_sql(sql_query, params)

end

def character_information(userID)

  user_id = userID
  sql_query = ("SELECT character_name FROM users WHERE userid=#{user_id};")
  run_sql(sql_query)

end

def find_user_by_email email
  
  sql_query = ("SELECT * FROM users WHERE email = $1;")
  params = [email]
  results = run_sql(sql_query, params)

  if results.to_a.length > 0
    return results[0]
  else
    return nil
  end

end

def find_user_by_id id

  sql_query = ("SELECT * FROM users WHERE userid = $1;")
  params = [id]
  results = run_sql(sql_query, params)

  if results.to_a.length > 0
    return results[0]
  else
    return nil
  end

end