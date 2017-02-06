require 'test_helper'

class UtilityExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @utility_expense = utility_expenses(:one)
  end

  test "should get index" do
    get utility_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_utility_expense_url
    assert_response :success
  end

  test "should create utility_expense" do
    assert_difference('UtilityExpense.count') do
      post utility_expenses_url, params: { utility_expense: { acupunture: @utility_expense.acupunture, auto: @utility_expense.auto, cable: @utility_expense.cable, cleaning: @utility_expense.cleaning, company_id: @utility_expense.company_id, electric: @utility_expense.electric, end_date: @utility_expense.end_date, food: @utility_expense.food, fuel: @utility_expense.fuel, gas: @utility_expense.gas, landscaping: @utility_expense.landscaping, start_date: @utility_expense.start_date, total_per_house: @utility_expense.total_per_house, water: @utility_expense.water, yoga: @utility_expense.yoga } }
    end

    assert_redirected_to utility_expense_url(UtilityExpense.last)
  end

  test "should show utility_expense" do
    get utility_expense_url(@utility_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_utility_expense_url(@utility_expense)
    assert_response :success
  end

  test "should update utility_expense" do
    patch utility_expense_url(@utility_expense), params: { utility_expense: { acupunture: @utility_expense.acupunture, auto: @utility_expense.auto, cable: @utility_expense.cable, cleaning: @utility_expense.cleaning, company_id: @utility_expense.company_id, electric: @utility_expense.electric, end_date: @utility_expense.end_date, food: @utility_expense.food, fuel: @utility_expense.fuel, gas: @utility_expense.gas, landscaping: @utility_expense.landscaping, start_date: @utility_expense.start_date, total_per_house: @utility_expense.total_per_house, water: @utility_expense.water, yoga: @utility_expense.yoga } }
    assert_redirected_to utility_expense_url(@utility_expense)
  end

  test "should destroy utility_expense" do
    assert_difference('UtilityExpense.count', -1) do
      delete utility_expense_url(@utility_expense)
    end

    assert_redirected_to utility_expenses_url
  end
end
