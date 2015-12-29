require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:email_address) do
    EmailAddress.new(address: "john@test.com", person_id: 1)
  end

  it "is valid" do
    expect(email_address).to be_valid
  end

  it "is invalid without address" do
    email_address.address = nil
    expect(email_address).to_not be_valid
  end

  it "is invalid with person_id" do
    email_address.person_id = nil
    expect(email_address).to_not be_valid
  end
end
