require 'rails_helper'
require 'Validator'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }
  subject { @user }

  it { should respond_to(:sender_number) }
  it { should respond_to(:pass_code) }
  it { should respond_to(:service_provider) }

  it 'has many transactions' do
    assc = described_class.reflect_on_association(:transactions)
    expect(assc.macro).to eq :has_many
  end

  it 'has a valid nigerian number' do
    user = FactoryGirl.build(:user)
    is_nigerian_number = Validator.valid_number?(@user.sender_number)
    expect(is_nigerian_number).to be(true)
  end

  it 'has an invalid number' do
    user = FactoryGirl.build(:user, :invalid_number)
    is_nigerian_number = Validator.valid_number? user.sender_number
    expect(is_nigerian_number).not_to be(true)
  end
end
