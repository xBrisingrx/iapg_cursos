require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference("Company.count") do
      post companies_url, params: { company: { city_id: @company.city_id, comment: @company.comment, company_category_id: @company.company_category_id, contract: @company.contract, cuit: @company.cuit, direction: @company.direction, iva_condition_id: @company.iva_condition_id, name: @company.name, operator: @company.operator, phone: @company.phone, province_id: @company.province_id } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { city_id: @company.city_id, comment: @company.comment, company_category_id: @company.company_category_id, contract: @company.contract, cuit: @company.cuit, direction: @company.direction, iva_condition_id: @company.iva_condition_id, name: @company.name, operator: @company.operator, phone: @company.phone, province_id: @company.province_id } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference("Company.count", -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
