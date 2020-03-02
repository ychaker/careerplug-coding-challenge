# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  describe 'with valid params' do
    subject { create(:comment) }

    it 'validates body' do
      assert_must validate_presence_of(:body), subject
    end
  end

  describe 'post' do
    subject { create(:comment) }

    it 'belongs to a Post' do
      assert_must belong_to(:post), subject
    end
  end
end
