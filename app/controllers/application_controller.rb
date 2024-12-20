class ApplicationController < ActionController::Base
  include SessionsHelper #全てのコントローラで使用できるように
  before_action :login_required 
  #アクション実行前にlogin_requiredが呼ばれる
  
  private

  def login_required #ログインしないとアクセス不可
    unless current_user
      flash[:notice] = "ログインしてください"
      redirect_to new_session_path
    #current_user=nillでログイン画面に遷移
    end
  end
  
end
