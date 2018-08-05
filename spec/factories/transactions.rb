FactoryGirl.define do
  factory :transaction do
    sender_number '08190167559'
    receiver_number '08109343456'
    credit_amount 490
    sender_balance 1000

    user
  end

  trait :invalid_transaction do
    credit amount 500
    debit_amount 500
    sender_balance 0
    receiver_number '0810916337478'
  end

  trait :is_minimum_balance do
    credit_amount 50
    sender_balance 60
  end

  trait :is_invalid_balance do
    sender_balance 400
  end

  trait :invalid_details do
    credit_amount 480
    sender_balance 200
  end
  trait :transact do
    sender_balance 400
    credit_amount 300
  end
end
