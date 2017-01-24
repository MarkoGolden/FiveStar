require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { address: @customer.address, cook_fuel: @customer.cook_fuel, cook_heat: @customer.cook_heat, disabled: @customer.disabled, end_date: @customer.end_date, end_date_reason: @customer.end_date_reason, first_name: @customer.first_name, gps_location: @customer.gps_location, id_pp: @customer.id_pp, installed: @customer.installed, last_name: @customer.last_name, lease_stove: @customer.lease_stove, mobile: @customer.mobile, number_in_household: @customer.number_in_household, power_pack_paid: @customer.power_pack_paid, race: @customer.race, sex: @customer.sex, start_date: @customer.start_date, stove_number: @customer.stove_number, terms_agreed: @customer.terms_agreed }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { address: @customer.address, cook_fuel: @customer.cook_fuel, cook_heat: @customer.cook_heat, disabled: @customer.disabled, end_date: @customer.end_date, end_date_reason: @customer.end_date_reason, first_name: @customer.first_name, gps_location: @customer.gps_location, id_pp: @customer.id_pp, installed: @customer.installed, last_name: @customer.last_name, lease_stove: @customer.lease_stove, mobile: @customer.mobile, number_in_household: @customer.number_in_household, power_pack_paid: @customer.power_pack_paid, race: @customer.race, sex: @customer.sex, start_date: @customer.start_date, stove_number: @customer.stove_number, terms_agreed: @customer.terms_agreed }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
