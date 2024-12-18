class SessionsController < ApplicationController
#セッションデータ登録(ログイン)や削除(ログアウト)の処理
  skip_before_action :login_required, only: [:new, :create]
  #new、createに対しlogin_requiredメソッドを呼ばない設定

  def new #ログイン画面表示
  end

  def create #ログイン情報登録→new.html.erb
    user = User.find_by(email: params[:session][:email].downcase)
    #セッションオブジェクトにユーザID登録、ユーザの詳細画面に遷移
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_path(user.id)
    else #newアクション呼び出し、メッセージ表示
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy #ログアウトする、セッションオブジェクトからユーザIDを削除
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

end
