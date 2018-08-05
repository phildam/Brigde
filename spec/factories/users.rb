require 'ffaker'

FactoryGirl.define do
  factory :user do
    id 1
    sender_number '08109157668'
    pass_code '1234'
    service_provider { FFaker::Company }
  end

  trait :invalid_number do
    sender_number '0023984992942'
  end

  trait :invalid_pass_code do
    pass_code '4456'
  end
end
