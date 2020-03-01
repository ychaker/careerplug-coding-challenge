# frozen_string_literal: true

class Post < ApplicationRecord
  # Validations
  validates :title,
    presence: true

  validates :body,
    presence: true
end
