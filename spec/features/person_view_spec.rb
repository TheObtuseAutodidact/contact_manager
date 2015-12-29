require 'rails_helper'

describe 'the person view', type: :feature do
  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.phone_numbers.create(number: "555-1234")
    person.phone_numbers.create(number: "555-5678")
    visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it 'has a link to add a new phone number' do
    expect(page).to have_link("Add phone number", href: new_phone_number_path(person_id: person.id))
  end

  it 'adds a new phone number' do
    page.click_link("Add phone number")
    page.fill_in("Number", with: "555-8888")
    page.click_button("Create Phone number")
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content("555-8888")
  end

  it 'has links to edit phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('edit', href: edit_phone_number_path(phone))
    end
  end

  it 'edits a phone number' do
    phone = person.phone_numbers.first
    old_number = phone.number
    first(:link, 'edit').click
    page.fill_in("Number", with: '555-9191')
    page.click_button("Update Phone number")
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content("555-9191")
    expect(page).to_not have_content(old_number)
  end

  it 'deletes a phone number' do
    # click_on("555-1234")
    phone = person.phone_numbers.first
    old_number = phone.number
    first(:link, 'delete').click
    expect(current_path).to eq(person_path(person))
    expect(page).to_not have_content(old_number)
  end



# Write a test that looks for a delete link for each phone number
# Modify the partial to have that link
# Try it in your browser and destroy a phone number
# Update the expectation in the controller spec to specify that you get redirected to the phone number’s person after destroy
# Fix the controller to redirect to the phone number’s person after destroy
# Fix the resulting spec failure in the controller spec


end
