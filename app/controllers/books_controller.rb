class BooksController < ApplicationController
	before_action :authenticate_user!

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@books = Book.all
		@book_new = Book.new
	end

	def edit
		@book = Book.find(params[:id])
		@user = @book.user
		@books = Book.all
		if @user.id != current_user.id
			redirect_to "/books"
		end
	end

	def update
		@book = Book.find(params[:id])
			if @book.update(book_params)
			redirect_to book_path(@book)
		else
			render "books/edit"
		end
	end

	def create
		@user = current_user
		@book = Book.new(book_params)
		@book.user_id = current_user.id #これにより紐づけられる！！
		if @book.save
    	redirect_to user_path(current_user)
    else
    	@books = Book.all
    	render "books/index"
    end

	end

	def destroy
		@book = Book.find(params[:id])
		if @book.user_id == current_user.id
			@book.destroy
			redirect_to books_path
		else
			render "books/show"
		end
	end

	private

	def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
	
	def book_params
		# ストロングパラメータ→ファームの入力値の受け渡し、データベースから値受け取り		
  	params.require(:book).permit(:title, :body, :user)
  end
   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
  end
end
