require 'test_helper'

class PositionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :template_id => templates(:one).to_param
    assert_response :success
    assert_not_nil assigns(:positions)
  end

  test "should get new" do
    get :new, :template_id => templates(:one).to_param
    assert_response :success
  end

  test "should not create position" do
    assert_no_difference('Position.count') do
      post :create, :template_id => templates(:one).to_param, :position => positions(:one).attributes
    end
  
    #assert_redirected_to template_position_path(templates(:one), assigns(:position))
  end

  test "should show position" do
    get :show, :id => positions(:one).to_param, :template_id => templates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => positions(:one).to_param, :template_id => templates(:one).to_param
    assert_response :success
  end

  test "should update position" do
    put :update, :template_id => templates(:one).to_param, :id => positions(:one).to_param, :position => positions(:one).attributes
    assert_redirected_to template_position_path(templates(:one), assigns(:position))
  end

  test "should destroy position" do
    assert_difference('Position.count', -1) do
      delete :destroy, :template_id => templates(:one).to_param, :id => positions(:one).to_param
    end
  
    assert_redirected_to template_positions_path(templates(:one))
  end
end
