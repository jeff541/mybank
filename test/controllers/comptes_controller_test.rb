require "test_helper"

class ComptesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compte = comptes(:one)
  end

  test "should get index" do
    get comptes_url
    assert_response :success
  end

  test "should get new" do
    get new_compte_url
    assert_response :success
  end

  test "should create compte" do
    assert_difference("Compte.count") do
      post comptes_url, params: { compte: { amount: @compte.amount, name: @compte.name } }
    end

    assert_redirected_to compte_url(Compte.last)
  end

  test "should show compte" do
    get compte_url(@compte)
    assert_response :success
  end

  test "should get edit" do
    get edit_compte_url(@compte)
    assert_response :success
  end

  test "should update compte" do
    patch compte_url(@compte), params: { compte: { amount: @compte.amount, name: @compte.name } }
    assert_redirected_to compte_url(@compte)
  end

  test "should destroy compte" do
    assert_difference("Compte.count", -1) do
      delete compte_url(@compte)
    end

    assert_redirected_to comptes_url
  end
end
