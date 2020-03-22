class SessionsController < ApplicationController
  protect_from_forgery except: :destroy  #CERF対策で外部からのリクエストをはじくので、弾きたくないものをこれで指定すれば、解決！
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user #redirect_to user_url(user)に読み替えてくれる
    else
      flash.now[:danger] = "Invalid email/password combination"#本当は正しくない
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
