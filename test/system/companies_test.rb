require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "should create company" do
    visit companies_url
    click_on "New company"

    fill_in "City", with: @company.city_id
    fill_in "Comment", with: @company.comment
    fill_in "Company category", with: @company.company_category_id
    fill_in "Contract", with: @company.contract
    fill_in "Cuit", with: @company.cuit
    fill_in "Direction", with: @company.direction
    fill_in "Iva condition", with: @company.iva_condition_id
    fill_in "Name", with: @company.name
    check "Operator" if @company.operator
    fill_in "Phone", with: @company.phone
    fill_in "Province", with: @company.province_id
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "should update Company" do
    visit company_url(@company)
    click_on "Edit this company", match: :first

    fill_in "City", with: @company.city_id
    fill_in "Comment", with: @company.comment
    fill_in "Company category", with: @company.company_category_id
    fill_in "Contract", with: @company.contract
    fill_in "Cuit", with: @company.cuit
    fill_in "Direction", with: @company.direction
    fill_in "Iva condition", with: @company.iva_condition_id
    fill_in "Name", with: @company.name
    check "Operator" if @company.operator
    fill_in "Phone", with: @company.phone
    fill_in "Province", with: @company.province_id
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "should destroy Company" do
    visit company_url(@company)
    click_on "Destroy this company", match: :first

    assert_text "Company was successfully destroyed"
  end
end
