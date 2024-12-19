class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  #new、createに対してlogin_requiredメソッドが呼ばれない
  before_action :correct_user, only: [:show, :edit, :destroy]
  

  def new #ユーザ情報を変数に格納、登録画面表示
    @user = User.new
  end

  def create 
    @user = User.new(user_params) #登録フォームの入力値
    if @user.save #詳細画面に遷移→show action
      log_in(@user)
      flash[:notice] = 'アカウントを登録しました'
      redirect_to tasks_path(@user.id)
    else #再度登録画面表示
      render :new #エラーメッセージはnew.html.erb
    end
  end

  def show #ユーザidを探して詳細画面表示、show.html.erb/タスク一覧画面へ
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) #データ取得
    if @user.update(user_params)
      flash[:notice] = 'アカウントを更新しました'
      redirect_to user_path(@user) #ユーザの詳細ページ(show)へ
    else
      redirect_to edit_user_path(@user) 
      #edit～はidを引数として取る、編集画面にリダイレクト
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_session_path
    #ビューファイルのリンクはルーティングヘルパーを使う、手動×
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user #アクセス先の確認、本人でなければ本人の詳細画面へ
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user)
    #パラメータのidを使ってデータベースからユーザ取り出し、引数に渡す
  end
end
