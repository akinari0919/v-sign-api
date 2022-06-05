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
FactoryBot.define do
  factory :sign do
    name { "MyString" }
    image { "MyString" }
    type { 1 }
    angle { 1 }
    user { nil }
  end
end
