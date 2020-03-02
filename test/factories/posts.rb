# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_body   (body)
#  index_posts_on_title  (title)
#
FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body  { Faker::Lorem.paragraph }
  end
end
