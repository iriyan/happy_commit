require 'test_helper'

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get rails_generate_url
    assert_response :success
  end

  test "should get migration" do
    get rails_migration_url
    assert_response :success
  end

  test "should get rename_fight_id_column_to_fights" do
    get rails_rename_fight_id_column_to_fights_url
    assert_response :success
  end

end
