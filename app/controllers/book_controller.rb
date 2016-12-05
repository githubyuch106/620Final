class BookController < ApplicationController
  
  layout "main"

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def checkout
    @book_name = params[:name]
  end

  def checkout_post
    @checked = Checkout.new
    @checked.member_id = session[:member_id]
    @checked.checkout_date = Date.today.to_s
    @checked.due_date = Date.today.next_month.to_s
    @checked.book_name = params[:book_name]

    @checked.save

    redirect_to :controller => 'book', :action => 'index'
  end

end
