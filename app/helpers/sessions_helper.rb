module SessionsHelper

  #渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember #これは、モデルのrememberメソッド
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget #これは、モデルのインスタンスuserに定義されたメソッド
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end


  #現在ログイン中のユーザーを返す　（いる場合）
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  #ユーザーがログインしていれば、true,その他ならfalseを返す。
  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user) #current_userメソッドは、現在のユーザーを返すメソッド
    session.delete(:user_id)
    @current_user = nil
  end

end
