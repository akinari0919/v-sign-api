# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sign_id    :bigint           not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_comments_on_sign_id  (sign_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (sign_id => signs.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :sign
  belongs_to :user

  validates :body, presence: true, length: { maximum: 32 }
end
