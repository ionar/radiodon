require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, patient: { address: @patient.address, birth_date: @patient.birth_date, cep: @patient.cep, clinic_id: @patient.clinic_id, cpf: @patient.cpf, dentist_id: @patient.dentist_id, email: @patient.email, fathers_name: @patient.fathers_name, gender: @patient.gender, mothers_name: @patient.mothers_name, name: @patient.name, notes: @patient.notes, occupation: @patient.occupation, phone2: @patient.phone2, phone: @patient.phone, rg: @patient.rg }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    patch :update, id: @patient, patient: { address: @patient.address, birth_date: @patient.birth_date, cep: @patient.cep, clinic_id: @patient.clinic_id, cpf: @patient.cpf, dentist_id: @patient.dentist_id, email: @patient.email, fathers_name: @patient.fathers_name, gender: @patient.gender, mothers_name: @patient.mothers_name, name: @patient.name, notes: @patient.notes, occupation: @patient.occupation, phone2: @patient.phone2, phone: @patient.phone, rg: @patient.rg }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
