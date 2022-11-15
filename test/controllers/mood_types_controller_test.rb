require 'test_helper'

class MoodTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mood_type = mood_types(:one)
  end

  test "should get index" do
    get mood_types_url
    assert_response :success
  end

  test "should get new" do
    get new_mood_type_url
    assert_response :success
  end

  test "should create mood_type" do
    assert_difference('MoodType.count') do
      post mood_types_url, params: { mood_type: { description: @mood_type.description } }
    end

    assert_redirected_to mood_type_url(MoodType.last)
  end

  test "should show mood_type" do
    get mood_type_url(@mood_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_mood_type_url(@mood_type)
    assert_response :success
  end

  test "should update mood_type" do
    patch mood_type_url(@mood_type), params: { mood_type: { description: @mood_type.description } }
    assert_redirected_to mood_type_url(@mood_type)
  end

  test "should destroy mood_type" do
    assert_difference('MoodType.count', -1) do
      delete mood_type_url(@mood_type)
    end

    assert_redirected_to mood_types_url
  end
end
