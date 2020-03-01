# frozen_string_literal: true

# Main Application mailer all mailers inherit from
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
