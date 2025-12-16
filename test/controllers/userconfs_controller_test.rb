require "test_helper"

class UserconfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userconf = userconfs(:one)
  end

  test "should get index" do
    get userconfs_url
    assert_response :success
  end

  test "should get new" do
    get new_userconf_url
    assert_response :success
  end

  test "should create userconf" do
    assert_difference("Userconf.count") do
      post userconfs_url, params: { userconf: {} }
    end

    assert_redirected_to userconf_url(Userconf.last)
  end

  test "should show userconf" do
    get userconf_url(@userconf)
    assert_response :success
  end

  test "should get edit" do
    get edit_userconf_url(@userconf)
    assert_response :success
  end

  test "should update userconf" do
    patch userconf_url(@userconf), params: { userconf: {} }
    assert_redirected_to userconf_url(@userconf)
  end

  test "should destroy userconf" do
    assert_difference("Userconf.count", -1) do
      delete userconf_url(@userconf)
    end

    assert_redirected_to userconfs_url
  end
end
