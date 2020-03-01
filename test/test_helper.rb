# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
require 'minitest/spec'
Dir[Rails.root.join('test/support/**/*.rb')].sort.each { |f| require f }

reporter_options = { color: true, slow_count: 5 }
Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new(reporter_options)
]

module ActiveSupport
  class TestCase
    extend MiniTest::Spec::DSL

    # Setup all fixtures in test/fixtures/*.yml for all tests
    # in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
