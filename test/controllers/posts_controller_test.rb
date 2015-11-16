require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def login_brian!
    session[:user_id] = users(:brian).id
  end

  test "logged in users can create a new post" do
    login_brian!
    get :new
    assert_response 200
    assert_not_nil assigns(:post)
  end

  test "non-logged in users can't write posts" do
    get :new
    assert_redirected_to login_path
  end

  test "editing a post succeeds with valid IDs" do
    login_brian!
    get :edit, { id: posts(:one).id }
    assert_response :success
    assert_not_nil assigns(:post)
  end

  test "posts can't be edited by non-logged in users" do
    get :edit, {id: posts(:one).id }
    assert_redirected_to login_path
  end

  test "post must belong to current user to be edited" do
    login_brian!
    get :edit, { id: posts(:two).id }
    assert_redirected_to posts_path
  end

  test "users don't need to be logged in to see the posts index" do
    get :index
    assert_response :success
  end

  test "users may only delete their own posts" do
    login_brian!
    post = posts(:two)
    assert_equal("That's not yours to delete.", "That's not yours to delete.")
  end
end