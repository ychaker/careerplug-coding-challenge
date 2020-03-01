# frozen_string_literal: true

# Main Application controller all controllers inherit from
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
