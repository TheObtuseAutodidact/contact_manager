class PhoneNumber < ActiveRecord::Base
  # belnongs_to :person
  validates :number, presence: true
  validates :person_id, presence: true
end
