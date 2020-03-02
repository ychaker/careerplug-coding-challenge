# frozen_string_literal: true

# Main Application helper
module ApplicationHelper
  def alert_class_for flash_type
    {
      success: 'alert-success',
      notice:  'alert-success',
      error:   'alert-danger',
      alert:   'alert-danger',
      warn:    'alert-warning',
      info:    'alert-info',
    }[flash_type.to_sym] || flash_type.to_s
  end
end
