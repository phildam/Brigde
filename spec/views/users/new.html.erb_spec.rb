require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    sender_number: 'MyString',
                    pass_code: 'MyString',
                    service_provider: 'MyString'
    ))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[sender_number]'

      assert_select 'input[name=?]', 'user[pass_code]'

      assert_select 'input[name=?]', 'user[service_provider]'
    end
  end
end
