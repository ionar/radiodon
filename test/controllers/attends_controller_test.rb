require 'test_helper'

class AttendsControllerTest < ActionController::TestCase
  setup do
    @attend = attends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attend" do
    assert_difference('Attend.count') do
      post :create, attend: { clinic_id: @attend.clinic_id, dentist_id: @attend.dentist_id, discount: @attend.discount, exam_id: @attend.exam_id, finalized: @attend.finalized, missed: @attend.missed, notes: @attend.notes, patient_id: @attend.patient_id, payment_detail: @attend.payment_detail, schedule: @attend.schedule, total: @attend.total }
    end

    assert_redirected_to attend_path(assigns(:attend))
  end

  test "should show attend" do
    get :show, id: @attend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attend
    assert_response :success
  end

  test "should update attend" do
    patch :update, id: @attend, attend: { clinic_id: @attend.clinic_id, dentist_id: @attend.dentist_id, discount: @attend.discount, exam_id: @attend.exam_id, finalized: @attend.finalized, missed: @attend.missed, notes: @attend.notes, patient_id: @attend.patient_id, payment_detail: @attend.payment_detail, schedule: @attend.schedule, total: @attend.total }
    assert_redirected_to attend_path(assigns(:attend))
  end

  test "should destroy attend" do
    assert_difference('Attend.count', -1) do
      delete :destroy, id: @attend
    end

    assert_redirected_to attends_path
  end
end
