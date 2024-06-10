class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @books = @users.map(&:books).flatten # すべてのユーザーの書籍リストを取得
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books #ユーザーの書籍リストを取得
    @book = Book.new # 新しいBookインスタンスを作成
  end

def edit
  @user = User.find(params[:id])
  unless current_user == @user
    redirect_to user_path(current_user)
  end
end

def update
  @user = User.find(params[:id])
  unless current_user == @user
    redirect_to edit_user_path(current_user)
    return
  end

  if @user.update(user_params)
    redirect_to @user, notice: 'User was successfully updated.'
  else
    render :edit
  end
end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
