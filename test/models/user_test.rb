require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def test_validate_required_params_to_create_user
    user = User.new(username: "test", email: "name@example.com", password: "tomatoes")
    assert user.save
  end

  def test_validate_params_required_for_new_user
    user = User.new(username: "name", password: "tomatoes")
    refute user.save
    user = User.new(email: "test@example.com", password: "tomatoes")
    refute user.save
  end
  
end
