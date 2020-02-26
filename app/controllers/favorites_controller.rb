class FavoritesController < ApplicationController

  # いいね機能を追加するために作ったコントローラー

  def create
    @favorite = current_user.favorites.create(book_id: params[:book_id])
    @books = Book.all
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
