require 'rails_helper'

RSpec.describe Person, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:person) do
    Person.new(first_name: 'Alice', last_name: 'Smith')
  end

  it "is invalid without a first name" do
    # person = Person.new(first_name: nil)
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it "is invalid without a last name" do
    # person = Person.new(first_name: "Jane", last_name: nil)
    person.last_name = nil
    expect(person).not_to be_valid
  end
end
