class Transaction < ApplicationRecord
  before_save :set_transaction_status
  belongs_to :user
  validates :user_id, presence: true
  validate :validate_account_balance, :validate_credit, :valid_receiver

  private

  def valid_receiver
    if :receiver_number.present?
      valid_number = Validator.valid_number? receiver_number
      errors.add(:receiver_number, message: 'receiver number is not a valid nigerian number') unless valid_number
    else
      errors.add(:receiver_number, message: 'Number is required')
    end
  end

  def validate_account_balance
    if sender_balance.present? && sender_balance
      valid_balance = sender_balance >= 50
      errors.add(:sender_number, message: 'Invalid account balance, your minimum balance must be 50') unless valid_balance
    else
      errors.add(:sender_number, message: 'sender balance is required')
    end
  end

  def validate_credit
    if :credit_amount.present? && sender_balance
      is_allowed = sender_balance >= credit_amount + 10
      errors.add(:credit_amount, message: 'unable to deduct 10 naira service charge') if sender_balance == credit_amount
      errors.add(:credit_amount, message: 'balance is less than the allowed transaction') unless is_allowed
    else
      errors.add(:credit_amount, 'credit amount and balance is required')
    end
  end

  def set_transaction_status
    self.debit_amount = credit_amount + 10
    if !errors.empty?
      self.status = 'failed'
      self.reason = errors.full_messages
    else
      self.status = 'success'
    end
  end
end
