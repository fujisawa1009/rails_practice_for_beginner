class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to questions_path, success: 'サインアップが完了しました'
    else
      flash.now[:danger] = 'サインアップに失敗しました'
      render :new
    end
  end


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to question_path(params[:id]), success: 'ユーザー情報を更新しました'
    else
      flash.now[:danger] = '失敗しました'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile)
  end
end
