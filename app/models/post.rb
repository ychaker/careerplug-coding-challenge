# frozen_string_literal: true

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
end
