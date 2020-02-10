class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :liked_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy

  def like_user(id)
    likes.find_by(user_id: id)
  end

  validates :body, length: { in: 1..200 }
  validates :title, length: { in: 1..200 }
end
