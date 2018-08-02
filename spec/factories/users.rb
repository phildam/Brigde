require 'ffaker'

FactoryGirl.define do
  factory :user do
    sender_number { FFaker::PhoneNumber }
    pass_code "1234"
    service_provider { FFaker::Company }
  end
end