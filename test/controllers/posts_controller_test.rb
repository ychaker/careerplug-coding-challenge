# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  describe '.index' do
    it 'does not return more than the max per page' do
      get posts_path(per_page: 5)

      assert_equal 5, assigns(:posts).size
    end

    it 'filters the list based on the search query' do
      get posts_path(q: 'filter_me')

      assert_equal 1, assigns(:posts).size
    end
  end
end
