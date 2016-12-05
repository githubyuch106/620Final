class AdminController < ApplicationController
  
  layout "main"
  
  def dashboard
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.save
  end

  private
  def book_params
  	params.require(:book).permit(:title, :year, :picture)
  end

  

end
