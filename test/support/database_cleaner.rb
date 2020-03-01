# frozen_string_literal: true

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

module Minitest
  class Spec
    around do |tests|
      DatabaseCleaner.cleaning(&tests)
    end
  end
end
