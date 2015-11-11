require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def test_validate_required_params_to_create
    post = Post.new(title: "Test", link: "http://www.google.com", user_id: 4)
    assert post.save
    post = Post.new(title: "Test", user_id: 4)
    refute post.save
    post = Post.new(link: "http://www.google.com", user_id: 4)
    refute post.save
  end
end
