require 'rails_helper'
require 'NigerianNumbers'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }
  subject { @user }

  let(:user_account) {
    { :sender_number => "08109167559", :pass_code => "1234",
    :time => DateTime.current(), :service_provider => "PhilMobile" }
  }

  it { should respond_to(:sender_number) }
  it { should respond_to(:pass_code) }
  it { should respond_to(:service_provider) }

  it { expect(@user.pass_code).to eq("1234") }

  it "has a valid nigerian number" do
    @user.sender_number = "08109234532"
    is_nigerian_number = NumberNetworkPrefix.is_valid_nigerian_number?(@user.sender_number)
    expect(is_nigerian_number).to be(true)
  end

  it "has an invalid number" do
    is_nigerian_number = NumberNetworkPrefix.is_valid_nigerian_number? @user.sender_number
    expect(is_nigerian_number).not_to be(true)
  end
end
