
require 'Validator'

class User < ApplicationRecord
  has_many :transactions
  validate :valid_number, on: %i[create update]
  validates :pass_code, presence: true

  private

  def valid_number
    if :sender_number.present?
      unless Validator.valid_number? sender_number
        errors.add(:sender_number, 'phone number is not valid')
      end
    else
      errors.add(:sender_number, 'Number is required')
    end
  end
end
