# == Schema Information
#
# Table name: signs
#
#  id         :bigint           not null, primary key
#  angle      :float            not null
#  image      :string           not null
#  name       :string           not null
#  type       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
# Indexes
#
#  index_signs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Sign < ApplicationRecord
  belongs_to :user, optional: true # nullを許容
  has_many :comments, dependent: :destroy

  # typeという名のカラムを許容
  self.inheritance_column = :_type_disabled

  validates :name, presence: true, length: { maximum: 8 }
end
