# frozen_string_literal: true

# Main Application record all models inherit from
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
