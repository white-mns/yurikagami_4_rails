require 'test_helper'

class EnemiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enemy = enemies(:one)
  end

  test "should get index" do
    get enemies_url
    assert_response :success
  end

  test "should get new" do
    get new_enemy_url
    assert_response :success
  end

  test "should create enemy" do
    assert_difference('Enemy.count') do
      post enemies_url, params: { enemy: { enemy: @enemy.enemy, generate_no: @enemy.generate_no, party_no: @enemy.party_no, result_no: @enemy.result_no, suffix: @enemy.suffix } }
    end

    assert_redirected_to enemy_url(Enemy.last)
  end

  test "should show enemy" do
    get enemy_url(@enemy)
    assert_response :success
  end

  test "should get edit" do
    get edit_enemy_url(@enemy)
    assert_response :success
  end

  test "should update enemy" do
    patch enemy_url(@enemy), params: { enemy: { enemy: @enemy.enemy, generate_no: @enemy.generate_no, party_no: @enemy.party_no, result_no: @enemy.result_no, suffix: @enemy.suffix } }
    assert_redirected_to enemy_url(@enemy)
  end

  test "should destroy enemy" do
    assert_difference('Enemy.count', -1) do
      delete enemy_url(@enemy)
    end

    assert_redirected_to enemies_url
  end
end
