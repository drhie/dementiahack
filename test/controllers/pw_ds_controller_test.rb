require 'test_helper'

class PwDsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pwd = pwds(:one)
  end

  test "should get index" do
    get pwds_url
    assert_response :success
  end

  test "should get new" do
    get new_pwd_url
    assert_response :success
  end

  test "should create pwd" do
    assert_difference('Pwd.count') do
      post pwds_url, params: { pwd: {  } }
    end

    assert_redirected_to pwd_url(Pwd.last)
  end

  test "should show pwd" do
    get pwd_url(@pwd)
    assert_response :success
  end

  test "should get edit" do
    get edit_pwd_url(@pwd)
    assert_response :success
  end

  test "should update pwd" do
    patch pwd_url(@pwd), params: { pwd: {  } }
    assert_redirected_to pwd_url(@pwd)
  end

  test "should destroy pwd" do
    assert_difference('Pwd.count', -1) do
      delete pwd_url(@pwd)
    end

    assert_redirected_to pwds_url
  end
end
