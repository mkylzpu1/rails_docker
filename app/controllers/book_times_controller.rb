class BookTimesController < ApplicationController
  def index
  end

  def new
    @book_time = BookTime.new()
    @book_id = params[:book]

  end

  def create
    @book_time = BookTime.new(book_time_params)
    @book_time.user_id = current_user.id
    @book_time.save
  end

  def book_time_params
    params.require(:book_time).permit(:day, :hour, :minute, :second, :book_id)
  end
end
