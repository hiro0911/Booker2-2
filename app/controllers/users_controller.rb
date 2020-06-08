class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :new ] #ログイン済かどうか。じゃない場合ログイン画面に遷移。

	def index
		@book = Book.new
		@user = current_user
		@users = User.all
	end
	
	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = Book.where(user: @user.id) #current_userが投稿したものを集める。
	end
	
	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(params[:id])
    @user.update(user_params) #user_paramsで受け取った値を更新？
    redirect_to user_path(@user.id), notice: "ほしのるな"
	end
		


	private

	def user_params
		# ストロングパラメータ→ファームの入力値の受け渡しに使用	
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
  	params.require(:book).permit(:title, :body, :user)
  end

   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
  end
end