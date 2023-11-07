require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post people_url, params: { person: { active: @person.active, birthdate: @person.birthdate, celphone: @person.celphone, 
      city_id: @person.city_id, code: @person.code, cuil: "#{@person.cuil}1", direction: @person.direction, email: @person.email, 
        last_name: @person.last_name, name: @person.name, phone: @person.phone, province_id: @person.province_id } }
    end
    assert_equal flash[:notice], "Persona registrada."
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { active: @person.active, birthdate: @person.birthdate, celphone: @person.celphone, 
      city_id: @person.city_id, code: @person.code, cuil: @person.cuil, 
      direction: @person.direction, email: @person.email, last_name: @person.last_name, name: @person.name, phone: @person.phone, 
      province_id: @person.province_id } }
    # assert_redirected_to person_url(@person)
    assert_equal flash[:notice], "Los datos de la persona fueron actualizados."
  end

  test "should destroy person" do
    assert_difference("Person.count", -1) do
      delete person_url(@person)
    end

    assert_equal flash[:notice], "Se elimino a #{@person.fullname} con éxito."
  end

  test "must disable a person" do 
    assert_difference("Person.actives.count", -1) do
      patch disable_person_url(@person)
    end
    assert_equal flash[:notice], "Se deshabilito a #{@person.fullname} con éxito."
  end
end
