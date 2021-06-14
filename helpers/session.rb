def user_found users
  if users.to_a.length > 0
    users[0]
  else
    nil
  end
end

def is_logged_in?
  
  if session[:user_id]
    return true
  else 
    return false
  end

end

# def is_logged_in?
#   !!session[:userid]
# end

def current_user
  if is_logged_in?
    return find_user_by_id(session[:user_id])
  else
    return nil
  end
end