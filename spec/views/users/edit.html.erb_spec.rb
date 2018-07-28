require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :sender_number => "MyString",
      :pass_code => "MyString",
      :service_provider => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[sender_number]"

      assert_select "input[name=?]", "user[pass_code]"

      assert_select "input[name=?]", "user[service_provider]"
    end
  end
end
