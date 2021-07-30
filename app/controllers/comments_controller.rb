class CommentsController < ApplicationController
  before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		@comment =  Comment.new(comment_params)
		@comment.book_id = @book.id
		@comment.user_id = current_user.id
		if @comment.save
  		redirect_to book_path(@book.id)
		else
		  render 'books/show'
		end
	end

	def destroy
		@book = Book.find(params[:book_id])
  	comment = @book.comments.find(params[:id])
		comment.destroy
		redirect_to request.referer
	end

	private
	def book_comment_params
		params.require(:comment).permit(:comment)
	end
end
