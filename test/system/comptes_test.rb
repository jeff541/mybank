require "application_system_test_case"

class ComptesTest < ApplicationSystemTestCase
  setup do
    @compte = comptes(:one)
  end

  test "visiting the index" do
    visit comptes_url
    assert_selector "h1", text: "Comptes"
  end

  test "should create compte" do
    visit comptes_url
    click_on "New compte"

    fill_in "Amount", with: @compte.amount
    fill_in "Name", with: @compte.name
    click_on "Create Compte"

    assert_text "Compte was successfully created"
    click_on "Back"
  end

  test "should update Compte" do
    visit compte_url(@compte)
    click_on "Edit this compte", match: :first

    fill_in "Amount", with: @compte.amount
    fill_in "Name", with: @compte.name
    click_on "Update Compte"

    assert_text "Compte was successfully updated"
    click_on "Back"
  end

  test "should destroy Compte" do
    visit compte_url(@compte)
    click_on "Destroy this compte", match: :first

    assert_text "Compte was successfully destroyed"
  end
end
