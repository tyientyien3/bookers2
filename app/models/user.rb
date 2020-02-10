class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # deviseでemailを不必要にする
  def email_required?
    false
  end

  def email_changed?
    false
  end

  has_many :book_comments, dependent: :destroy
  has_many :liked_books, through: :favorites, source: :book
  has_many :favorites, dependent: :destroy
  has_many :books, dependent: :destroy
  attachment :profile_image

  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  # すでにいいねしているかの判定
  def already_liked?(book)
    self.favorites.exists?(book_id: book.id)
  end
end
