class ApplicationController < ActionController::Base
  helper_method :current_user


def current_user
  if session[:user_id]
    @current_user ||= User.find_by( id: session[:user_id] )    
  end
end

def authorize_user
  unless current_user 
    redirect_to login_path , alert: "Giriş yapmalısınız."
  end
  
end



end
