require 'test_helper'

class OwnerSalaryComponentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owner_salary_component = owner_salary_components(:one)
  end

  test "should get index" do
    get owner_salary_components_url
    assert_response :success
  end

  test "should get new" do
    get new_owner_salary_component_url
    assert_response :success
  end

  test "should create owner_salary_component" do
    assert_difference('OwnerSalaryComponent.count') do
      post owner_salary_components_url, params: { owner_salary_component: { company_id: @owner_salary_component.company_id, end_date: @owner_salary_component.end_date, owner_commission: @owner_salary_component.owner_commission, owner_salary: @owner_salary_component.owner_salary, spouse_commission: @owner_salary_component.spouse_commission, spouse_salary: @owner_salary_component.spouse_salary, start_date: @owner_salary_component.start_date } }
    end

    assert_redirected_to owner_salary_component_url(OwnerSalaryComponent.last)
  end

  test "should show owner_salary_component" do
    get owner_salary_component_url(@owner_salary_component)
    assert_response :success
  end

  test "should get edit" do
    get edit_owner_salary_component_url(@owner_salary_component)
    assert_response :success
  end

  test "should update owner_salary_component" do
    patch owner_salary_component_url(@owner_salary_component), params: { owner_salary_component: { company_id: @owner_salary_component.company_id, end_date: @owner_salary_component.end_date, owner_commission: @owner_salary_component.owner_commission, owner_salary: @owner_salary_component.owner_salary, spouse_commission: @owner_salary_component.spouse_commission, spouse_salary: @owner_salary_component.spouse_salary, start_date: @owner_salary_component.start_date } }
    assert_redirected_to owner_salary_component_url(@owner_salary_component)
  end

  test "should destroy owner_salary_component" do
    assert_difference('OwnerSalaryComponent.count', -1) do
      delete owner_salary_component_url(@owner_salary_component)
    end

    assert_redirected_to owner_salary_components_url
  end
end
