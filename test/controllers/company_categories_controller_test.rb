require "test_helper"

class CompanyCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_category = company_categories(:one)
  end

  test "should get index" do
    get company_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_company_category_url
    assert_response :success
  end

  test "should create company_category" do
    assert_difference("CompanyCategory.count") do
      post company_categories_url, params: { company_category: { active: @company_category.active, description: @company_category.description, is_partner: @company_category.is_partner, name: @company_category.name, quota: @company_category.quota } }
    end

    assert_redirected_to company_category_url(CompanyCategory.last)
  end

  test "should show company_category" do
    get company_category_url(@company_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_category_url(@company_category)
    assert_response :success
  end

  test "should update company_category" do
    patch company_category_url(@company_category), params: { company_category: { active: @company_category.active, description: @company_category.description, is_partner: @company_category.is_partner, name: @company_category.name, quota: @company_category.quota } }
    assert_redirected_to company_category_url(@company_category)
  end

  test "should destroy company_category" do
    assert_difference("CompanyCategory.count", -1) do
      delete company_category_url(@company_category)
    end

    assert_redirected_to company_categories_url
  end
end
