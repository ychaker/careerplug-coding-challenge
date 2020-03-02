# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  describe 'ApplicationHelper' do
    describe '.alert_class' do
      it 'returns the correct alert class based on the flash type' do
        assert_equal 'alert-success', alert_class_for(:notice)
        assert_equal 'alert-danger',  alert_class_for(:error)
      end
    end
  end
end
