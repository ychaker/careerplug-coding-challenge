# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  body           :text             not null
#  comments_count :integer          default("0")
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_posts_on_body   (body)
#  index_posts_on_title  (title)
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  describe 'with valid params' do
    subject { create(:post) }

    it 'validates title' do
      assert_must validate_presence_of(:title), subject
    end

    it 'validates body' do
      assert_must validate_presence_of(:body), subject
    end
  end

  describe 'search' do
    subject { create(:post, title: 'no way in hell this exists!') }

    before do
      create_list(:post, 10)
    end

    it 'fetches the correct posts based on the query param' do
      q = subject.title

      posts = Post.search_by_title_and_body(q)

      assert_equal 1, posts.count
    end

    it 'returns 0 results if the query does not match' do
      q = 'Youssef'

      posts = Post.search_by_title_and_body(q)

      assert_equal 0, posts.count
    end
  end

  describe 'comments' do
    subject { create(:post) }

    it 'can have many comments' do
      assert_must have_many(:comments), subject
    end

    it 'deletes the associates comments when deleted' do
      2.times do
        create(:comment, post: subject)
      end

      assert_difference 'Comment.count', -2 do
        subject.destroy
      end
    end

    it 'keeps a count of the number of comments' do
      assert_equal 0, subject.comments_count

      2.times do
        create(:comment, post: subject)
      end

      assert_equal 2, subject.comments_count
    end
  end
end
