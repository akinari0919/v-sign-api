class Comment < ApplicationRecord
  belongs_to :sign
  belongs_to :user

  validates :body, presence: true, length: { maximum: 32 }
end
