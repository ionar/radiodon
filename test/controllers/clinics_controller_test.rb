require 'test_helper'

class ClinicsControllerTest < ActionController::TestCase
  setup do
    @clinic = clinics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clinics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clinic" do
    assert_difference('Clinic.count') do
      post :create, clinic: { address: @clinic.address, cep: @clinic.cep, city: @clinic.city, cnpj: @clinic.cnpj, corporate_name: @clinic.corporate_name, fantasy_name: @clinic.fantasy_name, province_id: @clinic.province_id, technical_manager: @clinic.technical_manager }
    end

    assert_redirected_to clinic_path(assigns(:clinic))
  end

  test "should show clinic" do
    get :show, id: @clinic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clinic
    assert_response :success
  end

  test "should update clinic" do
    patch :update, id: @clinic, clinic: { address: @clinic.address, cep: @clinic.cep, city: @clinic.city, cnpj: @clinic.cnpj, corporate_name: @clinic.corporate_name, fantasy_name: @clinic.fantasy_name, province_id: @clinic.province_id, technical_manager: @clinic.technical_manager }
    assert_redirected_to clinic_path(assigns(:clinic))
  end

  test "should destroy clinic" do
    assert_difference('Clinic.count', -1) do
      delete :destroy, id: @clinic
    end

    assert_redirected_to clinics_path
  end
end
