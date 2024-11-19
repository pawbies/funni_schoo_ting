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
    @borrow = Borrow.find_by(id: params[:id])
  end

  def update
    @borrow = Borrow.find(params[:id])
    if @borrow.update(borrow_params)
      redirect_to root_path, notice: "Borrow record updated successfully."
    else
      render :edit, status: :unprocessable_entity, alert: "Something went wrong"
    end
  end

  def destroy
    @borrow = Borrow.find(params[:id])

    @borrow.destroy!

    redirect_to root_path, notice: "Removed Borrow"
  end

  private

  def borrow_params
    params.require(:borrow).permit(:book_id, :borrow_date, :return_date, :firstname, :lastname, :returned)
  end
end
