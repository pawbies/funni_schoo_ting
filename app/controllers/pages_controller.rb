class PagesController < ApplicationController
  def home
    @borrowed_books = Borrow
      .where(returned: false)
      .order(return_date: :asc)
  end

  def archive
    @books = Borrow
      .where(returned: true)
      .order(return_date: :desc)
  end
end
