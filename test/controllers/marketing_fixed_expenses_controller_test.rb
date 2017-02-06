require 'test_helper'

class MarketingFixedExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marketing_fixed_expense = marketing_fixed_expenses(:one)
  end

  test "should get index" do
    get marketing_fixed_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_marketing_fixed_expense_url
    assert_response :success
  end

  test "should create marketing_fixed_expense" do
    assert_difference('MarketingFixedExpense.count') do
      post marketing_fixed_expenses_url, params: { marketing_fixed_expense: { addiction_advisor: @marketing_fixed_expense.addiction_advisor, air_time: @marketing_fixed_expense.air_time, company_id: @marketing_fixed_expense.company_id, drug_use_today: @marketing_fixed_expense.drug_use_today, easy_breeze: @marketing_fixed_expense.easy_breeze, end_date: @marketing_fixed_expense.end_date, facebook: @marketing_fixed_expense.facebook, midwest: @marketing_fixed_expense.midwest, new_england: @marketing_fixed_expense.new_england, rehabs_hq: @marketing_fixed_expense.rehabs_hq, sober_recover: @marketing_fixed_expense.sober_recover, south_east: @marketing_fixed_expense.south_east, southwest: @marketing_fixed_expense.southwest, start_date: @marketing_fixed_expense.start_date, visible: @marketing_fixed_expense.visible, west_coast: @marketing_fixed_expense.west_coast } }
    end

    assert_redirected_to marketing_fixed_expense_url(MarketingFixedExpense.last)
  end

  test "should show marketing_fixed_expense" do
    get marketing_fixed_expense_url(@marketing_fixed_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_marketing_fixed_expense_url(@marketing_fixed_expense)
    assert_response :success
  end

  test "should update marketing_fixed_expense" do
    patch marketing_fixed_expense_url(@marketing_fixed_expense), params: { marketing_fixed_expense: { addiction_advisor: @marketing_fixed_expense.addiction_advisor, air_time: @marketing_fixed_expense.air_time, company_id: @marketing_fixed_expense.company_id, drug_use_today: @marketing_fixed_expense.drug_use_today, easy_breeze: @marketing_fixed_expense.easy_breeze, end_date: @marketing_fixed_expense.end_date, facebook: @marketing_fixed_expense.facebook, midwest: @marketing_fixed_expense.midwest, new_england: @marketing_fixed_expense.new_england, rehabs_hq: @marketing_fixed_expense.rehabs_hq, sober_recover: @marketing_fixed_expense.sober_recover, south_east: @marketing_fixed_expense.south_east, southwest: @marketing_fixed_expense.southwest, start_date: @marketing_fixed_expense.start_date, visible: @marketing_fixed_expense.visible, west_coast: @marketing_fixed_expense.west_coast } }
    assert_redirected_to marketing_fixed_expense_url(@marketing_fixed_expense)
  end

  test "should destroy marketing_fixed_expense" do
    assert_difference('MarketingFixedExpense.count', -1) do
      delete marketing_fixed_expense_url(@marketing_fixed_expense)
    end

    assert_redirected_to marketing_fixed_expenses_url
  end
end
