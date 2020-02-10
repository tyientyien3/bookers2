class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # validation unpermitted blank
  validates :comment, presence: true
end
