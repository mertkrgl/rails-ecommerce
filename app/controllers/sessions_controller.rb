class SessionsController < ApplicationController

  def new
  end

  def create
    
    user = User.find_by(username: params[:username])

    if user && user.password == params[:password]
      if user.role == params[:role]
          session[:user_id]=user.id
          redirect_to home_path
     else
      flash.now[:message] = "Hatalı giriş bilgileri. Lütfen kullanıcı adı, şifre ve rolü kontrol edin."
      render :new
     end
    else
      flash.now[:message] = "Hatalı giriş bilgileri. Lütfen kullanıcı adı, şifre ve rolü kontrol edin."
    render :new
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to login_path, notice: "Çıkış yapıldı."
  end
end
