# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  body           :text             not null
#  comments_count :integer          default("0")
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_posts_on_body   (body)
#  index_posts_on_title  (title)
#
class Post < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_body,
                  against:  %i[ title body ],
                  using:    {
                    tsearch: { dictionary: 'english' },
                    trigram: {},
                  },
                  ignoring: :accents

  # Validations
  validates :title,
            presence: true

  validates :body,
            presence: true

  # Associations
  has_many :comments,
           dependent: :destroy
end
