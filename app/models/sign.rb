class Sign < ApplicationRecord
  belongs_to :user, optional: true # nullを許容
  has_many: :comments, dependent: :destroy

  # typeという名のカラムを許容
  self.inheritance_column = :_type_disabled

  validates :name, presence: true, length: { maximum: 8 }
end
