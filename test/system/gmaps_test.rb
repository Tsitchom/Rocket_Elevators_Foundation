require "application_system_test_case"

class GmapsTest < ApplicationSystemTestCase
  setup do
    @gmap = gmaps(:one)
  end

  test "visiting the index" do
    visit gmaps_url
    assert_selector "h1", text: "Gmaps"
  end

  test "creating a Gmap" do
    visit gmaps_url
    click_on "New Gmap"

    click_on "Create Gmap"

    assert_text "Gmap was successfully created"
    click_on "Back"
  end

  test "updating a Gmap" do
    visit gmaps_url
    click_on "Edit", match: :first

    click_on "Update Gmap"

    assert_text "Gmap was successfully updated"
    click_on "Back"
  end

  test "destroying a Gmap" do
    visit gmaps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gmap was successfully destroyed"
  end
end
