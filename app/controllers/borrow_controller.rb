class BorrowController < ApplicationController
  def new
    @book = Book.find_by(id: params[:id])
    @borrow = Borrow.new
  end

  def create
    @borrow = Borrow.new(borrow_params)
    @borrow.user = Current.user
    @borrow.returned ||= false

    if @borrow.save
      redirect_to root_path, notice: "Created new Borrow"
    else
      @book = @borrow.book
      render :new, status: :unprocessable_entity, alert: "Unable to create this borrow"
    end
  end

  def edit
  end

  def destroy
  end

  private

  def borrow_params
    params.require(:borrow).permit(:book_id, :borrow_date, :return_date, :firstname, :lastname, :returned)
  end
end
