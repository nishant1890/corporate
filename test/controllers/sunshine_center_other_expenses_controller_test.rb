require 'test_helper'

class SunshineCenterOtherExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sunshine_center_other_expense = sunshine_center_other_expenses(:one)
  end

  test "should get index" do
    get sunshine_center_other_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_sunshine_center_other_expense_url
    assert_response :success
  end

  test "should create sunshine_center_other_expense" do
    assert_difference('SunshineCenterOtherExpense.count') do
      post sunshine_center_other_expenses_url, params: { sunshine_center_other_expense: { blogging: @sunshine_center_other_expense.blogging, company_id: @sunshine_center_other_expense.company_id, cort: @sunshine_center_other_expense.cort, detox: @sunshine_center_other_expense.detox, end_date: @sunshine_center_other_expense.end_date, facebook: @sunshine_center_other_expense.facebook, fica: @sunshine_center_other_expense.fica, heath_insurance: @sunshine_center_other_expense.heath_insurance, hosting: @sunshine_center_other_expense.hosting, kipu: @sunshine_center_other_expense.kipu, liability_insurance: @sunshine_center_other_expense.liability_insurance, miscellaneous: @sunshine_center_other_expense.miscellaneous, office_supplies: @sunshine_center_other_expense.office_supplies, start_date: @sunshine_center_other_expense.start_date, workers_compensation: @sunshine_center_other_expense.workers_compensation } }
    end

    assert_redirected_to sunshine_center_other_expense_url(SunshineCenterOtherExpense.last)
  end

  test "should show sunshine_center_other_expense" do
    get sunshine_center_other_expense_url(@sunshine_center_other_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_sunshine_center_other_expense_url(@sunshine_center_other_expense)
    assert_response :success
  end

  test "should update sunshine_center_other_expense" do
    patch sunshine_center_other_expense_url(@sunshine_center_other_expense), params: { sunshine_center_other_expense: { blogging: @sunshine_center_other_expense.blogging, company_id: @sunshine_center_other_expense.company_id, cort: @sunshine_center_other_expense.cort, detox: @sunshine_center_other_expense.detox, end_date: @sunshine_center_other_expense.end_date, facebook: @sunshine_center_other_expense.facebook, fica: @sunshine_center_other_expense.fica, heath_insurance: @sunshine_center_other_expense.heath_insurance, hosting: @sunshine_center_other_expense.hosting, kipu: @sunshine_center_other_expense.kipu, liability_insurance: @sunshine_center_other_expense.liability_insurance, miscellaneous: @sunshine_center_other_expense.miscellaneous, office_supplies: @sunshine_center_other_expense.office_supplies, start_date: @sunshine_center_other_expense.start_date, workers_compensation: @sunshine_center_other_expense.workers_compensation } }
    assert_redirected_to sunshine_center_other_expense_url(@sunshine_center_other_expense)
  end

  test "should destroy sunshine_center_other_expense" do
    assert_difference('SunshineCenterOtherExpense.count', -1) do
      delete sunshine_center_other_expense_url(@sunshine_center_other_expense)
    end

    assert_redirected_to sunshine_center_other_expenses_url
  end
end
