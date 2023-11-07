require "test_helper"
# require "minitest/pride"
# require 'minitest/emoji'
# require "minitest/untz"

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = people(:one)
  end

  test 'valid person' do
    assert @person.valid?
  end 

  test 'invalid person without name' do 
    @person.name = nil
    refute @person.valid?, 'person is valid without a name'
    assert_not_nil @person.errors[:name], 'no validation error for name present'
  end

  test 'invalid person without lastname' do
    @person.last_name = nil
    refute @person.valid?, 'person is valid without a lastname'
    assert_not_nil @person.errors[:last_name], 'no validation error for lastname present'
  end

  test 'invalid person without cuil' do
    @person.cuil = nil
    refute @person.valid?, 'person is valid without a cuil'
    assert_not_nil @person.errors[:cuil], 'no validation error for cuil present'
  end

  test 'valid person without province and city, those attributes are optionals' do 
    @person.province = nil
    @person.city = nil
    assert @person.valid?, 'person is invalid without a province and city'
  end

  test 'valid person without celphone' do 
    @person.celphone = nil
    refute @person.valid?, 'person is valid without a celphone'
    assert_not_nil @person.errors[:celphone], 'no validation error for celphone present'
  end
end
