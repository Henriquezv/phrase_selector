require "application_system_test_case"

class MoodTypesTest < ApplicationSystemTestCase
  setup do
    @mood_type = mood_types(:one)
  end

  test "visiting the index" do
    visit mood_types_url
    assert_selector "h1", text: "Mood Types"
  end

  test "creating a Mood type" do
    visit mood_types_url
    click_on "New Mood Type"

    fill_in "Description", with: @mood_type.description
    click_on "Create Mood type"

    assert_text "Mood type was successfully created"
    click_on "Back"
  end

  test "updating a Mood type" do
    visit mood_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @mood_type.description
    click_on "Update Mood type"

    assert_text "Mood type was successfully updated"
    click_on "Back"
  end

  test "destroying a Mood type" do
    visit mood_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mood type was successfully destroyed"
  end
end
