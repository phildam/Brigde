require 'NigerianNumbers'

class User < ApplicationRecord
  validate :sender_number_is_from_nigeria, on: [ :create, :update ]
  validates :pass_code, presence: true
  validates :service_provider, presence: true

  private 
    def sender_number_is_from_nigeria
      if :sender_number.present?
        valid_number = NumberNetworkPrefix.is_valid_nigerian_number? sender_number
        errors.add(:sender_number, 'phone number is not a valid nigerian number') unless valid_number
      else
        errors.add(:sender_number, 'Number is required');
      end
    end
end
