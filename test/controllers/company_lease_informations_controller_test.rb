require 'test_helper'

class CompanyLeaseInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_lease_information = company_lease_informations(:one)
  end

  test "should get index" do
    get company_lease_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_company_lease_information_url
    assert_response :success
  end

  test "should create company_lease_information" do
    assert_difference('CompanyLeaseInformation.count') do
      post company_lease_informations_url, params: { company_lease_information: { company_id: @company_lease_information.company_id, end_date: @company_lease_information.end_date, house_id: @company_lease_information.house_id, start_date: @company_lease_information.start_date, total_lease_amount: @company_lease_information.total_lease_amount } }
    end

    assert_redirected_to company_lease_information_url(CompanyLeaseInformation.last)
  end

  test "should show company_lease_information" do
    get company_lease_information_url(@company_lease_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_lease_information_url(@company_lease_information)
    assert_response :success
  end

  test "should update company_lease_information" do
    patch company_lease_information_url(@company_lease_information), params: { company_lease_information: { company_id: @company_lease_information.company_id, end_date: @company_lease_information.end_date, house_id: @company_lease_information.house_id, start_date: @company_lease_information.start_date, total_lease_amount: @company_lease_information.total_lease_amount } }
    assert_redirected_to company_lease_information_url(@company_lease_information)
  end

  test "should destroy company_lease_information" do
    assert_difference('CompanyLeaseInformation.count', -1) do
      delete company_lease_information_url(@company_lease_information)
    end

    assert_redirected_to company_lease_informations_url
  end
end
