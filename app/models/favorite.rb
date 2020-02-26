class Favorite < ApplicationRecord
  belongs_to :book
  belongs_to :user

  #1人が１つの投稿に対して、１つしかいいねをつけられないようにする
  validates_uniqueness_of :book_id, scope: :user_id
end
