require 'test_helper'

class PhrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phrase = phrases(:one)
  end

  test "should get index" do
    get phrases_url
    assert_response :success
  end

  test "should get new" do
    get new_phrase_url
    assert_response :success
  end

  test "should create phrase" do
    assert_difference('Phrase.count') do
      post phrases_url, params: { phrase: { text: @phrase.text } }
    end

    assert_redirected_to phrase_url(Phrase.last)
  end

  test "should show phrase" do
    get phrase_url(@phrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_phrase_url(@phrase)
    assert_response :success
  end

  test "should update phrase" do
    patch phrase_url(@phrase), params: { phrase: { text: @phrase.text } }
    assert_redirected_to phrase_url(@phrase)
  end

  test "should destroy phrase" do
    assert_difference('Phrase.count', -1) do
      delete phrase_url(@phrase)
    end

    assert_redirected_to phrases_url
  end
end
