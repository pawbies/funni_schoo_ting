class PagesController < ApplicationController
  def home
    @borrowed_books = Borrow
    .order(return_date: :asc)
    .includes(:book)
  end
end
