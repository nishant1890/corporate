require 'test_helper'

class CompanyNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_name = company_names(:one)
  end

  test "should get index" do
    get company_names_url
    assert_response :success
  end

  test "should get new" do
    get new_company_name_url
    assert_response :success
  end

  test "should create company_name" do
    assert_difference('CompanyName.count') do
      post company_names_url, params: { company_name: { amount: @company_name.amount, company_id: @company_name.company_id, date: @company_name.date, miscellaneous_expense_type: @company_name.miscellaneous_expense_type, month: @company_name.month, payroll_type: @company_name.payroll_type, search_engine: @company_name.search_engine, year: @company_name.year } }
    end

    assert_redirected_to company_name_url(CompanyName.last)
  end

  test "should show company_name" do
    get company_name_url(@company_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_name_url(@company_name)
    assert_response :success
  end

  test "should update company_name" do
    patch company_name_url(@company_name), params: { company_name: { amount: @company_name.amount, company_id: @company_name.company_id, date: @company_name.date, miscellaneous_expense_type: @company_name.miscellaneous_expense_type, month: @company_name.month, payroll_type: @company_name.payroll_type, search_engine: @company_name.search_engine, year: @company_name.year } }
    assert_redirected_to company_name_url(@company_name)
  end

  test "should destroy company_name" do
    assert_difference('CompanyName.count', -1) do
      delete company_name_url(@company_name)
    end

    assert_redirected_to company_names_url
  end
end
