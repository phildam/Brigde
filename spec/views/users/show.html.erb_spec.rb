require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :sender_number => "Sender Number",
      :pass_code => "Pass Code",
      :service_provider => "Service Provider"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sender Number/)
    expect(rendered).to match(/Pass Code/)
    expect(rendered).to match(/Service Provider/)
  end
end
