require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should respond_to(:sender_number) }
  it { should respond_to(:receiver_number) }
  it { should respond_to(:sender_balance) }
  it { should respond_to(:sender_balance) }

  let(:user_details) do
    { sender_number: '08109165773', pass_code: '2133', service_provider: 'mtn' }
  end

  describe 'validation' do
    it 'is valid with valid attributes' do
      transaction = FactoryGirl.build(:transaction)
      expect(transaction).to be_valid
    end

    context 'Account balance' do
      it 'is greater than or equal to mimimum' do
        transaction = FactoryGirl.build(:transaction, :is_minimum_balance)
        expect(transaction).to be_valid
      end

      it 'is not a valid balance' do
        transaction = FactoryGirl.build(:transaction, :is_invalid_balance)
        expect(transaction).not_to be_valid
      end
    end

    it 'is not a valid transaction' do
      transaction = FactoryGirl.build(:transaction, :invalid_details)
      expect(transaction).not_to be_valid
    end

    it 'has set debit' do
      transaction = FactoryGirl.build(:transaction, :transact)
      expect(transaction).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
