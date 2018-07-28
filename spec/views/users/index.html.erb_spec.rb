require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :sender_number => "Sender Number",
        :pass_code => "Pass Code",
        :service_provider => "Service Provider"
      ),
      User.create!(
        :sender_number => "Sender Number",
        :pass_code => "Pass Code",
        :service_provider => "Service Provider"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Sender Number".to_s, :count => 2
    assert_select "tr>td", :text => "Pass Code".to_s, :count => 2
    assert_select "tr>td", :text => "Service Provider".to_s, :count => 2
  end
end
