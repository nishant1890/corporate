require 'test_helper'

class ErpOperatingExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @erp_operating_expense = erp_operating_expenses(:one)
  end

  test "should get index" do
    get erp_operating_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_erp_operating_expense_url
    assert_response :success
  end

  test "should create erp_operating_expense" do
    assert_difference('ErpOperatingExpense.count') do
      post erp_operating_expenses_url, params: { erp_operating_expense: { company_id: @erp_operating_expense.company_id, end_date: @erp_operating_expense.end_date, insurance: @erp_operating_expense.insurance, internet: @erp_operating_expense.internet, lindexed: @erp_operating_expense.lindexed, office: @erp_operating_expense.office, paycheck: @erp_operating_expense.paycheck, phone: @erp_operating_expense.phone, rt: @erp_operating_expense.rt, salesforce: @erp_operating_expense.salesforce, sf_admin: @erp_operating_expense.sf_admin, sms_magic: @erp_operating_expense.sms_magic, start_date: @erp_operating_expense.start_date, utilities: @erp_operating_expense.utilities } }
    end

    assert_redirected_to erp_operating_expense_url(ErpOperatingExpense.last)
  end

  test "should show erp_operating_expense" do
    get erp_operating_expense_url(@erp_operating_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_erp_operating_expense_url(@erp_operating_expense)
    assert_response :success
  end

  test "should update erp_operating_expense" do
    patch erp_operating_expense_url(@erp_operating_expense), params: { erp_operating_expense: { company_id: @erp_operating_expense.company_id, end_date: @erp_operating_expense.end_date, insurance: @erp_operating_expense.insurance, internet: @erp_operating_expense.internet, lindexed: @erp_operating_expense.lindexed, office: @erp_operating_expense.office, paycheck: @erp_operating_expense.paycheck, phone: @erp_operating_expense.phone, rt: @erp_operating_expense.rt, salesforce: @erp_operating_expense.salesforce, sf_admin: @erp_operating_expense.sf_admin, sms_magic: @erp_operating_expense.sms_magic, start_date: @erp_operating_expense.start_date, utilities: @erp_operating_expense.utilities } }
    assert_redirected_to erp_operating_expense_url(@erp_operating_expense)
  end

  test "should destroy erp_operating_expense" do
    assert_difference('ErpOperatingExpense.count', -1) do
      delete erp_operating_expense_url(@erp_operating_expense)
    end

    assert_redirected_to erp_operating_expenses_url
  end
end
