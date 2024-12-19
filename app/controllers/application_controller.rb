class ApplicationController < ActionController::Base
  include SessionsHelper #全てのコントローラで使用できるように
  before_action :login_required 
  #アクション実行前にlogin_requiredが呼ばれる
  
  private

  def login_required #ログインしないとアクセス不可
    redirect_to new_session_path unless current_user
    if current_user = nil
     flash[:notice] = "ログインしてください"
    #current_user=nillでログイン画面に遷移
    end
  end
  
end
