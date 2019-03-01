class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
    else
      # エラーメッセージ用のflashを入れる
      # 実装はまだ完了していません
      flash.now[:danger] = 'メールアドレスとパスワードの情報が一致しませんでした。'
      render 'new'
    end
  end
  
  
  def destroy
    log_out
    redirect_to root_url
  end
end