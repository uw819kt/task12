module SessionsHelper

  def current_user #ログイン情報保持、取得、現在ログイン中のユーザ代入
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in? #ログイン中か判断する
    current_user.present?
  end
  
  def log_in(user) #セッションオブジェクトにユーザID登録をメソッド化
    session[:user_id] = user.id
    #ユーザが登録された際に呼び出すとログインを同時に行える
  end

  def current_user?(user)
  #引数に入ったユーザとログイン中ユーザを比較→true/false
    user == current_user
  end
end
