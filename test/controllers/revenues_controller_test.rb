require 'test_helper'

class RevenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @revenue = revenues(:one)
  end

  test "should get index" do
    get revenues_url
    assert_response :success
  end

  test "should get new" do
    get new_revenue_url
    assert_response :success
  end

  test "should create revenue" do
    assert_difference('Revenue.count') do
      post revenues_url, params: { revenue: { amount: @revenue.amount, company_id: @revenue.company_id, company_name: @revenue.company_name, date: @revenue.date, number_of_deals: @revenue.number_of_deals, type_of_revenue: @revenue.type_of_revenue } }
    end

    assert_redirected_to revenue_url(Revenue.last)
  end

  test "should show revenue" do
    get revenue_url(@revenue)
    assert_response :success
  end

  test "should get edit" do
    get edit_revenue_url(@revenue)
    assert_response :success
  end

  test "should update revenue" do
    patch revenue_url(@revenue), params: { revenue: { amount: @revenue.amount, company_id: @revenue.company_id, company_name: @revenue.company_name, date: @revenue.date, number_of_deals: @revenue.number_of_deals, type_of_revenue: @revenue.type_of_revenue } }
    assert_redirected_to revenue_url(@revenue)
  end

  test "should destroy revenue" do
    assert_difference('Revenue.count', -1) do
      delete revenue_url(@revenue)
    end

    assert_redirected_to revenues_url
  end
end
